import 'dart:convert';
import 'dart:io';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class GbOpsGenerator extends Generator {
  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    final generatedCode = StringBuffer();
    generatedCode.write("import 'registers.dart';");
    generatedCode.write("class Instructions {");
    generateOpFunctionMap(generatedCode);
    generatedCode.write("}");
    return generatedCode.toString();
  }

  void generateOpFunctionMap(StringBuffer generatedCode) {
    final gbOpsJson = getGbOpsJson();
    gbOpsJson['Unprefixed'].asMap().forEach((index, opCell) {
      generateFunctionForUnprefixedOp(opCell, index, generatedCode);
    });
  }

  void generateFunctionForUnprefixedOp(
      dynamic opCell, int index, StringBuffer generatedCode) {
    final operation = getOperation(opCell, index);
    final opName = operation.name;

    switch (opName) {
      default:
        throw 'Unknown operation: $opName';
    }
  }

  Operation getOperation(dynamic opCell, int index, {String? prefix}) {
    final opName = opCell['Name'].split(' ')[0];
    String? operand1;
    String? operand2;

    if (opCell['Name'].split(' ').length > 1) {
      final operands = opCell['Name'].split(' ')[1];
      operand1 = operands.split(',')[0];
      if (operands.split(',')) {
        operand2 = operands.split(',')[1];
      }
    }

    final opCode = (prefix ?? '') + index.toRadixString(16).toString();
    return Operation(opCode, opName, operand1, operand2);
  }

  dynamic getGbOpsJson() {
    final jsonString = File('lib/data/gbops.json').readAsStringSync();
    return jsonDecode(jsonString);
  }
}

class Operation {
  Operation(this.opCode, this.name, this.operand1, this.operand2);

  final String opCode;
  final String name;
  final String? operand1;
  final String? operand2;
}
