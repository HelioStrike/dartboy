import 'package:emulator/src/cpu/instructions.dart';
import 'package:emulator/src/cpu/registers.dart';
import 'package:emulator/src/memory/cartridge.dart';

class CPU {
  CPU(this.cartridge);

  final Cartridge cartridge;

  void run() {
    RegisterExtension.reset();
    // Actual ROM entry point.
    Register.PC.value = 0x0100;

    while (true) {
      executeCurrentInstruction();
      Register.PC.value += 1;
    }
  }

  void executeCurrentInstruction() {
    final inst = cartridge.getByte(Register.PC.value);

    if (Instructions.opcodeToFunction[inst] != null) {
      Instructions.opcodeToFunction[inst]!();
    } else {
      throw 'Unknown instruction: $inst';
    }
  }
}
