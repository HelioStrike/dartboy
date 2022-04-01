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
        return _getValueFor16BitRegisters(Register.A, Register.F);
      case Register.BC:
        return _getValueFor16BitRegisters(Register.B, Register.C);
      case Register.DE:
        return _getValueFor16BitRegisters(Register.D, Register.E);
      case Register.HL:
        return _getValueFor16BitRegisters(Register.H, Register.L);
      default:
        return _values[this]!;
    }
  }

  set value(int val) {
    switch (this) {
      case Register.AF:
        _setValueFor16BitRegisters(Register.A, Register.F, val);
        break;
      case Register.BC:
        _setValueFor16BitRegisters(Register.B, Register.C, val);
        break;
      case Register.DE:
        _setValueFor16BitRegisters(Register.D, Register.E, val);
        break;
      case Register.HL:
        _setValueFor16BitRegisters(Register.H, Register.L, val);
        break;
      default:
        _values[this] = val;
    }
  }

  int _getValueFor16BitRegisters(Register a, Register b) {
    return (_values[a]! << 8) | _values[b]!;
  }

  void _setValueFor16BitRegisters(Register a, Register b, int val) {
    _values[a] = (val >> 8) & 255;
    _values[b] = val & 255;
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

  static void reset() {
    for (var flag in Flag.values) {
      flag.value = false;
    }
  }
}
