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
  AF,
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

extension RegisterExtension on Register {
  static final Map<Register, int> _values = {
    for (var register in Register.values) register: 0
  };

  int get value {
    switch (this) {
      case Register.AF:
        return (_values[Register.A]! << 8) | _values[Register.F]!;
      case Register.BC:
        return (_values[Register.B]! << 8) | _values[Register.C]!;
      case Register.DE:
        return (_values[Register.D]! << 8) | _values[Register.E]!;
      case Register.HL:
        return (_values[Register.H]! << 8) | _values[Register.L]!;
      default:
        return _values[this]!;
    }
  }

  set value(int val) {
    switch (this) {
      case Register.AF:
        _values[Register.A] = val >> 8;
        _values[Register.F] = val & 255;
        break;
      case Register.BC:
        _values[Register.B] = val >> 8;
        _values[Register.C] = val & 255;
        break;
      case Register.DE:
        _values[Register.D] = val >> 8;
        _values[Register.E] = val & 255;
        break;
      case Register.HL:
        _values[Register.H] = val >> 8;
        _values[Register.L] = val & 255;
        break;
      default:
        _values[this] = val;
    }
  }

  static void reset() {
    for (var register in Register.values) {
      _values[register] = 0;
    }
  }
}

extension FlagExtension on Flag {
  bool get value {
    return (Register.F.value & (1 << (8 - index))) > 0;
  }

  set value(bool newValue) {
    if (value != newValue) {
      Register.F.value ^= (1 << (8 - index));
    }
  }
}
