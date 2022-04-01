import 'package:emulator/src/cpu/instructions.dart';
import 'package:emulator/src/cpu/registers.dart';
import 'package:emulator/src/memory/cartridge.dart';

class CPU {
  CPU(this.cartridge);

  final Cartridge cartridge;

  void run() {
    RegisterExtension.reset();
    Register.SP.value = 0xffee;
    // Actual ROM entry point.
    Register.PC.value = 0x0100;

    while (true) {
      executeCurrentInstruction();
      Register.PC.value += 1;
    }
  }

  /// Returns the instruction pointed to by the program counter (PC).
  void executeCurrentInstruction() {
    final inst = getNextByte();

    if (Instructions.opcodeToFunctionMap[inst] != null) {
      Instructions.opcodeToFunctionMap[inst]!(this);
    } else {
      throw 'Unknown instruction: $inst';
    }
  }

  /// Returns the byte pointed to by the Program Counter (PC),
  /// and increments PC.
  int getNextByte() {
    final ret = cartridge.getByte(Register.PC.value);
    Register.PC.value++;
    return ret;
  }

  /// Returns the byte pointed to by the Program Counter (PC) plus a lookahead.
  int peekByte(int lookAhead) {
    final ret = cartridge.getByte(Register.PC.value + lookAhead);
    return ret;
  }
}
