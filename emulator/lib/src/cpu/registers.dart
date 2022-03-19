// ignore_for_file: constant_identifier_names

enum Register {
  // 8-bit registers
  A,
  F,
  B,
  C,
  D,
  E,
  H,
  L,
  // 16-bit registers
  BC,
  DE,
  HL,
  SP,
  PC,
}

enum Flag {
  z,
  n,
  h,
  c,
}

class Registers {
  Registers() {
    reset();
  }

  final Map<Register, int> _registers = {};

  int getRegister(Register register) {
    switch (register) {
      case Register.BC:
        return (_registers[Register.B]! << 8) | _registers[Register.C]!;
      case Register.DE:
        return (_registers[Register.D]! << 8) | _registers[Register.E]!;
      case Register.HL:
        return (_registers[Register.H]! << 8) | _registers[Register.L]!;
      default:
        return _registers[register]!;
    }
  }

  int setRegister(Register register, int value) {
    switch (register) {
      case Register.BC:
        return (_registers[Register.B]! << 8) | _registers[Register.C]!;
      case Register.DE:
        return (_registers[Register.D]! << 8) | _registers[Register.E]!;
      case Register.HL:
        return (_registers[Register.H]! << 8) | _registers[Register.L]!;
      default:
        return _registers[register]!;
    }
  }

  bool getFlag(Flag flag) {
    return (_registers[Register.F]! & (1 << (8 - flag.index))) > 0;
  }

  void setFlag(Flag flag) {
    _registers[Register.F] = _registers[Register.F]! | (1 << (8 - flag.index));
  }

  void reset() {
    for (var register in Register.values) {
      _registers[register] = 0;
    }
  }
}
