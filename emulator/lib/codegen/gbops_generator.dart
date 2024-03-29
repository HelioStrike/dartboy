import 'dart:convert';
import 'dart:io';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class GbOpsGenerator extends Generator {
  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    final generatedCode = StringBuffer();
    generatedCode.write("class Instructions {");
    generateOpFunctionMap(generatedCode);
    writeFlagAdjustFunctions(generatedCode);
    generatedCode.write("}");
    return generatedCode.toString();
  }

  void generateOpFunctionMap(StringBuffer generatedCode) {
    final gbOpsJson = getGbOpsJson();

    generatedCode.write('static final opcodeToFunctionMap = {');
    gbOpsJson['Unprefixed'].asMap().forEach((index, opCell) {
      generateFunctionForOperation(opCell, index, generatedCode);
    });
    generatedCode.write('};');
    generatedCode.write('static final cbOpcodeToFunctionMap = {');
    gbOpsJson['CBPrefixed'].asMap().forEach((index, opCell) {
      generateFunctionForOperation(opCell, index, generatedCode);
    });
    generatedCode.write('};');
  }

  void generateFunctionForOperation(
    dynamic opCell,
    int index,
    StringBuffer generatedCode,
  ) {
    final operation = getOperation(opCell, index);
    final opName = operation.name;

    generatedCode.write('0x${operation.opCode}: (CPU cpu) {');

    final op1 = getOperandCode(operation.operand1);
    final op2 = getOperandCode(operation.operand2);

    switch (opName) {
      case 'NOP':
        break;
      case 'LD':
        final maybeResetNFlag =
            (operation.operand2 == 'SP+i8') ? 'Flag.n.value = false;' : '';
        generatedCode.write('$op1 = $op2; $maybeResetNFlag');
        break;
      case 'INC':
        generatedCode.write('''
        $op1 = addWithFlagAdjust(${_cleanDestForAdjustFn(op1!)}, 1);
        Flag.z.value = $op1 == 0;
        Flag.n.value = false;
        ''');
        break;
      case 'DEC':
        generatedCode.write('''
        $op1 = subWithFlagAdjust(${_cleanDestForAdjustFn(op1!)}, 1);
        Flag.z.value = $op1 == 0;
        Flag.n.value = true;
        ''');
        break;
      case 'RLCA':
        generatedCode.write('''
        Flag.c.value = (Register.A.value & 128) > 1;
        Register.A.value = (Register.A.value << 1) & 255;
        Register.A.value &= Flag.c.value ? 1 : 0;
        Flag.n.value = false;
        Flag.h.value = false;
        ''');
        break;
      case 'ADD':
        generatedCode.write('''
        $op1 = addWithFlagAdjust(${_cleanDestForAdjustFn(op1!)}, $op2);
        Flag.z.value = $op1 == 0;
        Flag.n.value = false;
        ''');
        break;
      case 'RRCA':
        generatedCode.write('''
        Flag.c.value = (Register.A.value & 1) > 1;
        Register.A.value = (Register.A.value >> 1) & 255;
        Register.A.value &= (Flag.c.value ? 1 : 0) << 7;
        Flag.n.value = false;
        Flag.h.value = false;
        ''');
        break;
      case 'STOP':
        break;
      case 'RLA':
        generatedCode.write('''
        final highBit = (Register.A.value & 128) > 0;
        Register.A.value = (Register.A.value << 1) & 255;
        Register.A.value &= Flag.c.value ? 1 : 0;
        Flag.c.value = highBit;
        Flag.n.value = false;
        Flag.h.value = false;
        ''');
        break;
      case 'JR':
        if (op2 != null) {
          generatedCode.write('''
          if (${correctCOperand(op1!)}) {
            Register.PC.value += $op2;
          }
          ''');
        } else {
          generatedCode.write('Register.PC.value += $op1;');
        }
        break;
      case 'RRA':
        generatedCode.write('''
        final lowBit = (Register.A.value & 1) > 0;
        Register.A.value = (Register.A.value >> 1) & 255;
        Register.A.value &= (Flag.c.value ? 1 : 0) << 7;
        Flag.c.value = lowBit;
        Flag.n.value = false;
        Flag.h.value = false;
        ''');
        break;
      case 'DAA':
        generatedCode.write('''
        var correction = 0;

        final low = Register.A.value & 0xf;
        final high = (Register.A.value & 0xf0);

        if (Flag.h.value || (!Flag.n.value && low > 0x09)) {
          correction |= 6;
        } else if (Flag.c.value || (!Flag.n.value && high > 0x99)) {
          correction |= 0x60;
          Flag.c.value = true;
        }
        Register.A.value += correction;
        Flag.h.value = false;
        Flag.z.value = Register.A.value == 0;
        ''');
        break;
      case 'CPL':
        generatedCode.write('''
        Register.A.value ^= 255;
        Flag.n.value = true;
        Flag.h.value = true;
        ''');
        break;
      case 'SCF':
        generatedCode.write('Flag.c.value = true;');
        break;
      case 'CCF':
        generatedCode.write('Flag.c.value = !Flag.c.value;');
        break;
      case 'HALT':
        break;
      case 'ADC':
        generatedCode.write('''
        $op1 = addWithFlagAdjust(${_cleanDestForAdjustFn(op1!)}, $op2 + (Flag.c.value ? 1 : 0));
        Flag.z.value = $op1 == 0;
        ''');
        break;
      case 'SUB':
        generatedCode.write('''
          Register.A.value = subWithFlagAdjust(Register.A, $op1);
          Flag.z.value = Register.A.value == 0;
          Flag.n.value = true;
        ''');
        break;
      case 'SBC':
        generatedCode.write('''
          $op1 = subWithFlagAdjust(${_cleanDestForAdjustFn(op1!)}, $op2 + (Flag.c.value ? 1 : 0));
          Flag.z.value = $op1 == 0;
          Flag.n.value = true;
        ''');
        break;
      case 'AND':
        generatedCode.write('''
        $op1 &= $op2;
        Flag.z.value = $op1 == 0;
        Flag.n.value = false;
        Flag.h.value = true;
        ''');
        break;
      case 'XOR':
        generatedCode.write('''
        $op1 ^= $op2;
        Flag.z.value = $op1 == 0;
        Flag.n.value = false;
        Flag.h.value = false;
        ''');
        break;
      case 'OR':
        generatedCode.write('''
        $op1 |= $op2;
        Flag.z.value = $op1 == 0;
        Flag.n.value = false;
        Flag.h.value = false;
        ''');
        break;
      case 'CP':
        generatedCode.write('''
        if ($op1 == $op2) {
          Flag.z.value = true;
        }
        subWithFlagAdjust(${_cleanDestForAdjustFn(op1!)}, $op2);
        Flag.n.value = true;
        ''');
        break;
      case 'RET':
        if (op1 != null) {
          generatedCode.write('''
          if (${correctCOperand(op1!)}) {
            Register.PC.value = Register.PC.value & (255 << 8) + (ram[Register.SP.value] & 255);
            Register.SP.value++;
            Register.PC.value = Register.PC.value & 255 + ((ram[Register.SP.value] & 255) << 8);
            Register.SP.value++;
          }
          ''');
        } else {
          generatedCode.write('''
          Register.PC.value = Register.PC.value & (255 << 8) + (ram[Register.SP.value] & 255);
          Register.SP.value++;
          Register.PC.value = Register.PC.value & 255 + ((ram[Register.SP.value] & 255) << 8);
          Register.SP.value++;
          ''');
        }

        break;
      case 'POP':
        generatedCode.write('''
        $op1 = $op1 & (255 << 8) + (ram[Register.SP.value] & 255);
        Register.SP.value++;
        $op1 = $op1 + ((ram[Register.SP.value] & 255) << 8);
        Register.SP.value++;
        ''');
        break;
      case 'JP':
        if (op2 != null) {
          generatedCode.write('''
          if (${correctCOperand(op1!)}) {
            Register.PC.value = $op2;
          }
          ''');
        } else {
          generatedCode.write('Register.PC.value = $op1;');
        }

        break;
      case 'CALL':
        if (op2 != null) {
          generatedCode.write('''
        if (${correctCOperand(op1!)}) {
          Register.PC.value = $op2;
        }
        ''');
        } else {
          generatedCode.write('Register.PC.value = $op1;');
        }
        break;
      case 'PUSH':
        generatedCode.write('''
        ram[Register.SP.value - 1] = $op1 & (255 << 8);
        ram[Register.SP.value - 2] = $op1 & 255;
        Register.SP.value -= 2;
        ''');
        break;
      case 'RST':
        generatedCode.write('''
        ram[Register.SP.value - 1] = Register.SP.value & (255 << 8);
        ram[Register.SP.value - 2] = Register.SP.value & 255;
        Register.SP.value -= 2;
        Register.PC.value = ram[$op1];
        ''');
        break;
      case 'PREFIX':
        generatedCode.write('''
        cbOpcodeToFunctionMap[cpu.getNextByte()]!(cpu);
        ''');
        break;
      case 'UNUSED':
        break;
      case 'RETI':
        break;
      case 'DI':
        break;
      case 'EI':
        break;
      case 'RLC':
        generatedCode.write('''
        Flag.c.value = ($op1 & 128) > 1;
        $op1 = ($op1 << 1) & 255;
        $op1 &= Flag.c.value ? 1 : 0;
        Flag.z.value = $op1 == 0;
        Flag.n.value = false;
        Flag.h.value = false;
        ''');
        break;
      case 'RRC':
        generatedCode.write('''
        Flag.c.value = ($op1 & 1) > 1;
        $op1 = ($op1 >> 1) & 255;
        $op1 &= (Flag.c.value ? 1 : 0) << 7;
        Flag.z.value = $op1 == 0;
        Flag.n.value = false;
        Flag.h.value = false;
        ''');
        break;
      case 'RL':
        generatedCode.write('''
        final highBit = (Register.A.value & 128) > 0;
        $op1 = ($op1 << 1) & 255;
        $op1 &= Flag.c.value ? 1 : 0;
        Flag.c.value = highBit;
        Flag.z.value = $op1 == 0;
        Flag.n.value = false;
        Flag.h.value = false;
        ''');
        break;
      case 'RR':
        generatedCode.write('''
        final lowBit = (Register.A.value & 1) > 0;
        $op1 = ($op1 >> 1) & 255;
        $op1 &= (Flag.c.value ? 1 : 0) << 7;
        Flag.c.value = lowBit;
        Flag.z.value = $op1 == 0;
        Flag.n.value = false;
        Flag.h.value = false;
        ''');
        break;
      case 'SLA':
        generatedCode.write('''
        Flag.c.value = ($op1 & 128) > 1;
        $op1 = ($op1 << 1) & 255;
        Flag.z.value = $op1 == 0;
        Flag.n.value = false;
        Flag.h.value = false;
        ''');
        break;
      case 'SRA':
        generatedCode.write('''
        Flag.c.value = ($op1 & 1) > 1;
        final unchangedBit = $op1 & 128;
        $op1 = (($op1 >> 1) & 255) + unchangedBit;
        Flag.z.value = $op1 == 0;
        Flag.n.value = false;
        ''');
        break;
      case 'SWAP':
        generatedCode.write('''
        final low = $op1 & 255;
        $op1 >>= 4;
        $op1 = $op1 | (low << 4);
        Flag.n.value = false;
        Flag.h.value = false;
        ''');
        break;
      case 'SRL':
        generatedCode.write('''
        Flag.c.value = ($op1 & 1) > 1;
        $op1 = ($op1 >> 1) & 255;
        Flag.z.value = $op1 == 0;
        Flag.n.value = false;
        ''');
        break;
      case 'BIT':
        generatedCode.write('''
        Flag.z.value = ($op2 & (1 << $op1)) > 0;
        Flag.n.value = false;
        ''');
        break;
      case 'RES':
        generatedCode.write('''
        $op2 = $op2 - ($op2 & (1 << $op1));
        ''');
        break;
      case 'SET':
        generatedCode.write('''
        $op2 |= (1 << $op1);
        ''');
        break;
      default:
        throw 'Unknown operation: ${opCell['Name']}';
    }

    // Debug info.
    if (false) {
      generatedCode.write('''
        print('---------------------------------------');
        print('${operation.name} ${op1 ?? ''}, ${op2 ?? ''}\\n');
        print('${operation.length - 1} operands: ${operation.length > 1 ? '\${cpu.peekByte(0).toRadixString(16)}' : ''} ${operation.length > 2 ? '\${cpu.peekByte(1).toRadixString(16)}' : ''}\\n');  
      
        for (final register in Register.values) {
          print('\${register.toString()} \${register.value}') ;
        }
        for (final flag in Flag.values) {
          print('\${flag.toString()} \${flag.value}') ;
        }
      ''');
    }

    generatedCode.write('},');
  }
  // ignore: todo
  // TODO: STOP, HALT, RETI, DI, EI

  /// Returns the C flag if the operator is the C register.
  ///
  /// The data used for generating the instructions doesn''t distinguish
  ///
  String correctCOperand(String op) {
    if (op == 'Register.C.value') {
      return 'Flag.c.value';
    }
    return op;
  }

  Operation getOperation(dynamic opCell, int index) {
    final opName = opCell['Name'].split(' ')[0];
    String? operand1;
    String? operand2;

    if (opCell['Name'].split(' ').length > 1) {
      final operands = opCell['Name'].split(' ')[1];
      operand1 = operands.split(',')[0];
      if (operands.split(',').length > 1) {
        operand2 = operands.split(',')[1];
      }
    }

    final opCode = index.toRadixString(16).toString();
    return Operation(opCode, opName, operand1, operand2, opCell['Length']);
  }

  String? getOperandCode(String? operand) {
    if (operand == null) return null;

    bool getFromMemory = false;
    String op = operand;
    if (operand.startsWith('(') && operand.endsWith(')')) {
      getFromMemory = true;
      op = operand.substring(1, operand.length - 1);
    }

    if ([
      'A', 'B', 'C', 'D', 'E', 'F', 'H', 'L', //
      'AF', 'BC', 'DE', 'HL', 'SP', 'PC'
    ].contains(op)) {
      op = 'Register.$op.value';
    } else if (op == 'HL+') {
      op = 'Register.HL.value++';
    } else if (op == 'HL-') {
      op = 'Register.HL.value--';
    } else if (op == 'u8' || op == 'i8') {
      op = 'cpu.getNextByte()';
    } else if (op == 'u16') {
      op = 'cpu.getNextByte() + (cpu.getNextByte() << 8)';
    } else if (['Z', 'C', 'NZ', 'NC'].contains(op)) {
      op = '${op.length == 2 && op[0] == 'N' ? '!' : ''}'
          'Flag.${op[op.length - 1].toLowerCase()}.value';
    } else if (['0', '1', '2', '3', '4', '5', '6', '7'].contains(op)) {
      // op is set.
    } else if (op.length == 3 && op[op.length - 1] == 'h') {
      op = '0x${op.substring(0, 2)}';
    } else if (op == 'CB') {
      op = '0xCB';
    } else if (op == 'FF00+u8') {
      op = '0xff00 + cpu.getNextByte()';
    } else if (op == 'FF00+C') {
      op = '0xff00 + Register.C.value';
    } else if (op == 'SP+i8') {
      op = 'Register.SP.value + cpu.getNextByte()';
    } else {
      throw 'Unknown operand: $operand';
    }

    if (getFromMemory) {
      op = 'ram[$op]';
    }

    return op;
  }

  void writeFlagAdjustFunctions(StringBuffer generatedCode) {
    generatedCode.write('''
    static int addWithFlagAdjust(dynamic dest, int b) {
      late final int destBytes;
      late final int a;

      if (dest is Register) {
        destBytes = dest.toString().split('Register.')[1].length > 1 ? 2 : 1;
        a = dest.value;
      } else if (dest is int) {
        destBytes =  1;
        a = dest;
      } else {
        throw Exception('Unexpected operand: \$dest');
      }

      int sum = a + b;
      int lowerNibbleSum = (a & 0xf) + (b & 0xf);

      if (destBytes == 1) {
        if (sum > 0xff) {
          Flag.c.value = true;
        }
      } else if (destBytes == 2) {
        if (sum > 0xffff) {
          Flag.c.value = true;
        }
      }

      if (lowerNibbleSum > 0xf) {
        Flag.h.value = true;
      }

      return (destBytes == 1 ? (sum & 0xff) : (sum & 0xffff));
    }

    static int subWithFlagAdjust(dynamic dest, int b) {
      late final int destBytes;
      late final int a;

      if (dest is Register) {
        destBytes = dest.toString().split('Register.')[1].length > 1 ? 2 : 1;
        a = dest.value;
      } else if (dest is int) {
        destBytes =  1;
        a = dest;
      } else {
        throw Exception('Unexpected operand: \$dest');
      }

      int sub = a - b;
      int lowerNibbleSub = (a & 0xf) - (b & 0xf);

      if (sub < 0) {
        Flag.c.value = true;
      }

      if (lowerNibbleSub < 0) {
        Flag.h.value = true;
      }

      return (destBytes == 1 ? (sub & 0xff) : (sub & 0xffff));
    }
    ''');
  }

  static String _cleanDestForAdjustFn(String dest) {
    if (dest.startsWith('ram[')) {
      return dest;
    }
    return dest.split('.value').join('');
  }

  dynamic getGbOpsJson() {
    final jsonString = File('lib/data/gbops.json').readAsStringSync();
    return jsonDecode(jsonString);
  }
}

class Operation {
  Operation(this.opCode, this.name, this.operand1, this.operand2, this.length);

  final String opCode;
  final String name;
  final String? operand1;
  final String? operand2;
  final int length;
}
