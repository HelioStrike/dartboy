// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instructions.dart';

// **************************************************************************
// GbOpsGenerator
// **************************************************************************

class Instructions {
  static final opcodeToFunctionMap = {
    0x0: (CPU cpu) {},
    0x1: (CPU cpu) {
      Register.BC.value = cpu.getNextByte() + (cpu.getNextByte() << 8);
    },
    0x2: (CPU cpu) {
      ram[Register.BC.value] = Register.A.value;
    },
    0x3: (CPU cpu) {
      Register.BC.value = addWithFlagAdjust(Register.BC, 1);
      Flag.z.value = Register.BC.value == 0;
      Flag.n.value = false;
    },
    0x4: (CPU cpu) {
      Register.B.value = addWithFlagAdjust(Register.B, 1);
      Flag.z.value = Register.B.value == 0;
      Flag.n.value = false;
    },
    0x5: (CPU cpu) {
      Register.B.value = subWithFlagAdjust(Register.B, 1);
      Flag.z.value = Register.B.value == 0;
      Flag.n.value = true;
    },
    0x6: (CPU cpu) {
      Register.B.value = cpu.getNextByte();
    },
    0x7: (CPU cpu) {
      Flag.c.value = (Register.A.value & 128) > 1;
      Register.A.value = (Register.A.value << 1) & 255;
      Register.A.value &= Flag.c.value ? 1 : 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x8: (CPU cpu) {
      ram[cpu.getNextByte() + (cpu.getNextByte() << 8)] = Register.SP.value;
    },
    0x9: (CPU cpu) {
      Register.HL.value = addWithFlagAdjust(Register.HL, Register.BC.value);
      Flag.z.value = Register.HL.value == 0;
      Flag.n.value = false;
    },
    0xa: (CPU cpu) {
      Register.A.value = ram[Register.BC.value];
    },
    0xb: (CPU cpu) {
      Register.BC.value = subWithFlagAdjust(Register.BC, 1);
      Flag.z.value = Register.BC.value == 0;
      Flag.n.value = true;
    },
    0xc: (CPU cpu) {
      Register.C.value = addWithFlagAdjust(Register.C, 1);
      Flag.z.value = Register.C.value == 0;
      Flag.n.value = false;
    },
    0xd: (CPU cpu) {
      Register.C.value = subWithFlagAdjust(Register.C, 1);
      Flag.z.value = Register.C.value == 0;
      Flag.n.value = true;
    },
    0xe: (CPU cpu) {
      Register.C.value = cpu.getNextByte();
    },
    0xf: (CPU cpu) {
      Flag.c.value = (Register.A.value & 1) > 1;
      Register.A.value = (Register.A.value >> 1) & 255;
      Register.A.value &= (Flag.c.value ? 1 : 0) << 7;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x10: (CPU cpu) {},
    0x11: (CPU cpu) {
      Register.DE.value = cpu.getNextByte() + (cpu.getNextByte() << 8);
    },
    0x12: (CPU cpu) {
      ram[Register.DE.value] = Register.A.value;
    },
    0x13: (CPU cpu) {
      Register.DE.value = addWithFlagAdjust(Register.DE, 1);
      Flag.z.value = Register.DE.value == 0;
      Flag.n.value = false;
    },
    0x14: (CPU cpu) {
      Register.D.value = addWithFlagAdjust(Register.D, 1);
      Flag.z.value = Register.D.value == 0;
      Flag.n.value = false;
    },
    0x15: (CPU cpu) {
      Register.D.value = subWithFlagAdjust(Register.D, 1);
      Flag.z.value = Register.D.value == 0;
      Flag.n.value = true;
    },
    0x16: (CPU cpu) {
      Register.D.value = cpu.getNextByte();
    },
    0x17: (CPU cpu) {
      final highBit = (Register.A.value & 128) > 0;
      Register.A.value = (Register.A.value << 1) & 255;
      Register.A.value &= Flag.c.value ? 1 : 0;
      Flag.c.value = highBit;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x18: (CPU cpu) {
      Register.PC.value += cpu.getNextByte();
    },
    0x19: (CPU cpu) {
      Register.HL.value = addWithFlagAdjust(Register.HL, Register.DE.value);
      Flag.z.value = Register.HL.value == 0;
      Flag.n.value = false;
    },
    0x1a: (CPU cpu) {
      Register.A.value = ram[Register.DE.value];
    },
    0x1b: (CPU cpu) {
      Register.DE.value = subWithFlagAdjust(Register.DE, 1);
      Flag.z.value = Register.DE.value == 0;
      Flag.n.value = true;
    },
    0x1c: (CPU cpu) {
      Register.E.value = addWithFlagAdjust(Register.E, 1);
      Flag.z.value = Register.E.value == 0;
      Flag.n.value = false;
    },
    0x1d: (CPU cpu) {
      Register.E.value = subWithFlagAdjust(Register.E, 1);
      Flag.z.value = Register.E.value == 0;
      Flag.n.value = true;
    },
    0x1e: (CPU cpu) {
      Register.E.value = cpu.getNextByte();
    },
    0x1f: (CPU cpu) {
      final lowBit = (Register.A.value & 1) > 0;
      Register.A.value = (Register.A.value >> 1) & 255;
      Register.A.value &= (Flag.c.value ? 1 : 0) << 7;
      Flag.c.value = lowBit;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x20: (CPU cpu) {
      if (!Flag.z.value) {
        Register.PC.value += cpu.getNextByte();
      }
    },
    0x21: (CPU cpu) {
      Register.HL.value = cpu.getNextByte() + (cpu.getNextByte() << 8);
    },
    0x22: (CPU cpu) {
      ram[Register.HL.value++] = Register.A.value;
    },
    0x23: (CPU cpu) {
      Register.HL.value = addWithFlagAdjust(Register.HL, 1);
      Flag.z.value = Register.HL.value == 0;
      Flag.n.value = false;
    },
    0x24: (CPU cpu) {
      Register.H.value = addWithFlagAdjust(Register.H, 1);
      Flag.z.value = Register.H.value == 0;
      Flag.n.value = false;
    },
    0x25: (CPU cpu) {
      Register.H.value = subWithFlagAdjust(Register.H, 1);
      Flag.z.value = Register.H.value == 0;
      Flag.n.value = true;
    },
    0x26: (CPU cpu) {
      Register.H.value = cpu.getNextByte();
    },
    0x27: (CPU cpu) {
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
    },
    0x28: (CPU cpu) {
      if (Flag.z.value) {
        Register.PC.value += cpu.getNextByte();
      }
    },
    0x29: (CPU cpu) {
      Register.HL.value = addWithFlagAdjust(Register.HL, Register.HL.value);
      Flag.z.value = Register.HL.value == 0;
      Flag.n.value = false;
    },
    0x2a: (CPU cpu) {
      Register.A.value = ram[Register.HL.value++];
    },
    0x2b: (CPU cpu) {
      Register.HL.value = subWithFlagAdjust(Register.HL, 1);
      Flag.z.value = Register.HL.value == 0;
      Flag.n.value = true;
    },
    0x2c: (CPU cpu) {
      Register.L.value = addWithFlagAdjust(Register.L, 1);
      Flag.z.value = Register.L.value == 0;
      Flag.n.value = false;
    },
    0x2d: (CPU cpu) {
      Register.L.value = subWithFlagAdjust(Register.L, 1);
      Flag.z.value = Register.L.value == 0;
      Flag.n.value = true;
    },
    0x2e: (CPU cpu) {
      Register.L.value = cpu.getNextByte();
    },
    0x2f: (CPU cpu) {
      Register.A.value ^= 255;
      Flag.n.value = true;
      Flag.h.value = true;
    },
    0x30: (CPU cpu) {
      if (!Flag.c.value) {
        Register.PC.value += cpu.getNextByte();
      }
    },
    0x31: (CPU cpu) {
      Register.SP.value = cpu.getNextByte() + (cpu.getNextByte() << 8);
    },
    0x32: (CPU cpu) {
      ram[Register.HL.value--] = Register.A.value;
    },
    0x33: (CPU cpu) {
      Register.SP.value = addWithFlagAdjust(Register.SP, 1);
      Flag.z.value = Register.SP.value == 0;
      Flag.n.value = false;
    },
    0x34: (CPU cpu) {
      ram[Register.HL.value] = addWithFlagAdjust(ram[Register.HL.value], 1);
      Flag.z.value = ram[Register.HL.value] == 0;
      Flag.n.value = false;
    },
    0x35: (CPU cpu) {
      ram[Register.HL.value] = subWithFlagAdjust(ram[Register.HL.value], 1);
      Flag.z.value = ram[Register.HL.value] == 0;
      Flag.n.value = true;
    },
    0x36: (CPU cpu) {
      ram[Register.HL.value] = cpu.getNextByte();
    },
    0x37: (CPU cpu) {
      Flag.c.value = true;
    },
    0x38: (CPU cpu) {
      if (Flag.c.value) {
        Register.PC.value += cpu.getNextByte();
      }
    },
    0x39: (CPU cpu) {
      Register.HL.value = addWithFlagAdjust(Register.HL, Register.SP.value);
      Flag.z.value = Register.HL.value == 0;
      Flag.n.value = false;
    },
    0x3a: (CPU cpu) {
      Register.A.value = ram[Register.HL.value--];
    },
    0x3b: (CPU cpu) {
      Register.SP.value = subWithFlagAdjust(Register.SP, 1);
      Flag.z.value = Register.SP.value == 0;
      Flag.n.value = true;
    },
    0x3c: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(Register.A, 1);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
    },
    0x3d: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(Register.A, 1);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0x3e: (CPU cpu) {
      Register.A.value = cpu.getNextByte();
    },
    0x3f: (CPU cpu) {
      Flag.c.value = !Flag.c.value;
    },
    0x40: (CPU cpu) {
      Register.B.value = Register.B.value;
    },
    0x41: (CPU cpu) {
      Register.B.value = Register.C.value;
    },
    0x42: (CPU cpu) {
      Register.B.value = Register.D.value;
    },
    0x43: (CPU cpu) {
      Register.B.value = Register.E.value;
    },
    0x44: (CPU cpu) {
      Register.B.value = Register.H.value;
    },
    0x45: (CPU cpu) {
      Register.B.value = Register.L.value;
    },
    0x46: (CPU cpu) {
      Register.B.value = ram[Register.HL.value];
    },
    0x47: (CPU cpu) {
      Register.B.value = Register.A.value;
    },
    0x48: (CPU cpu) {
      Register.C.value = Register.B.value;
    },
    0x49: (CPU cpu) {
      Register.C.value = Register.C.value;
    },
    0x4a: (CPU cpu) {
      Register.C.value = Register.D.value;
    },
    0x4b: (CPU cpu) {
      Register.C.value = Register.E.value;
    },
    0x4c: (CPU cpu) {
      Register.C.value = Register.H.value;
    },
    0x4d: (CPU cpu) {
      Register.C.value = Register.L.value;
    },
    0x4e: (CPU cpu) {
      Register.C.value = ram[Register.HL.value];
    },
    0x4f: (CPU cpu) {
      Register.C.value = Register.A.value;
    },
    0x50: (CPU cpu) {
      Register.D.value = Register.B.value;
    },
    0x51: (CPU cpu) {
      Register.D.value = Register.C.value;
    },
    0x52: (CPU cpu) {
      Register.D.value = Register.D.value;
    },
    0x53: (CPU cpu) {
      Register.D.value = Register.E.value;
    },
    0x54: (CPU cpu) {
      Register.D.value = Register.H.value;
    },
    0x55: (CPU cpu) {
      Register.D.value = Register.L.value;
    },
    0x56: (CPU cpu) {
      Register.D.value = ram[Register.HL.value];
    },
    0x57: (CPU cpu) {
      Register.D.value = Register.A.value;
    },
    0x58: (CPU cpu) {
      Register.E.value = Register.B.value;
    },
    0x59: (CPU cpu) {
      Register.E.value = Register.C.value;
    },
    0x5a: (CPU cpu) {
      Register.E.value = Register.D.value;
    },
    0x5b: (CPU cpu) {
      Register.E.value = Register.E.value;
    },
    0x5c: (CPU cpu) {
      Register.E.value = Register.H.value;
    },
    0x5d: (CPU cpu) {
      Register.E.value = Register.L.value;
    },
    0x5e: (CPU cpu) {
      Register.E.value = ram[Register.HL.value];
    },
    0x5f: (CPU cpu) {
      Register.E.value = Register.A.value;
    },
    0x60: (CPU cpu) {
      Register.H.value = Register.B.value;
    },
    0x61: (CPU cpu) {
      Register.H.value = Register.C.value;
    },
    0x62: (CPU cpu) {
      Register.H.value = Register.D.value;
    },
    0x63: (CPU cpu) {
      Register.H.value = Register.E.value;
    },
    0x64: (CPU cpu) {
      Register.H.value = Register.H.value;
    },
    0x65: (CPU cpu) {
      Register.H.value = Register.L.value;
    },
    0x66: (CPU cpu) {
      Register.H.value = ram[Register.HL.value];
    },
    0x67: (CPU cpu) {
      Register.H.value = Register.A.value;
    },
    0x68: (CPU cpu) {
      Register.L.value = Register.B.value;
    },
    0x69: (CPU cpu) {
      Register.L.value = Register.C.value;
    },
    0x6a: (CPU cpu) {
      Register.L.value = Register.D.value;
    },
    0x6b: (CPU cpu) {
      Register.L.value = Register.E.value;
    },
    0x6c: (CPU cpu) {
      Register.L.value = Register.H.value;
    },
    0x6d: (CPU cpu) {
      Register.L.value = Register.L.value;
    },
    0x6e: (CPU cpu) {
      Register.L.value = ram[Register.HL.value];
    },
    0x6f: (CPU cpu) {
      Register.L.value = Register.A.value;
    },
    0x70: (CPU cpu) {
      ram[Register.HL.value] = Register.B.value;
    },
    0x71: (CPU cpu) {
      ram[Register.HL.value] = Register.C.value;
    },
    0x72: (CPU cpu) {
      ram[Register.HL.value] = Register.D.value;
    },
    0x73: (CPU cpu) {
      ram[Register.HL.value] = Register.E.value;
    },
    0x74: (CPU cpu) {
      ram[Register.HL.value] = Register.H.value;
    },
    0x75: (CPU cpu) {
      ram[Register.HL.value] = Register.L.value;
    },
    0x76: (CPU cpu) {},
    0x77: (CPU cpu) {
      ram[Register.HL.value] = Register.A.value;
    },
    0x78: (CPU cpu) {
      Register.A.value = Register.B.value;
    },
    0x79: (CPU cpu) {
      Register.A.value = Register.C.value;
    },
    0x7a: (CPU cpu) {
      Register.A.value = Register.D.value;
    },
    0x7b: (CPU cpu) {
      Register.A.value = Register.E.value;
    },
    0x7c: (CPU cpu) {
      Register.A.value = Register.H.value;
    },
    0x7d: (CPU cpu) {
      Register.A.value = Register.L.value;
    },
    0x7e: (CPU cpu) {
      Register.A.value = ram[Register.HL.value];
    },
    0x7f: (CPU cpu) {
      Register.A.value = Register.A.value;
    },
    0x80: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(Register.A, Register.B.value);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
    },
    0x81: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(Register.A, Register.C.value);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
    },
    0x82: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(Register.A, Register.D.value);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
    },
    0x83: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(Register.A, Register.E.value);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
    },
    0x84: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(Register.A, Register.H.value);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
    },
    0x85: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(Register.A, Register.L.value);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
    },
    0x86: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(Register.A, ram[Register.HL.value]);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
    },
    0x87: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(Register.A, Register.A.value);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
    },
    0x88: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(
          Register.A, Register.B.value + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
    },
    0x89: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(
          Register.A, Register.C.value + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
    },
    0x8a: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(
          Register.A, Register.D.value + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
    },
    0x8b: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(
          Register.A, Register.E.value + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
    },
    0x8c: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(
          Register.A, Register.H.value + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
    },
    0x8d: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(
          Register.A, Register.L.value + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
    },
    0x8e: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(
          Register.A, ram[Register.HL.value] + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
    },
    0x8f: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(
          Register.A, Register.A.value + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
    },
    0x90: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(Register.A, Register.A.value);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0x91: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(Register.A, Register.A.value);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0x92: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(Register.A, Register.A.value);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0x93: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(Register.A, Register.A.value);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0x94: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(Register.A, Register.A.value);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0x95: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(Register.A, Register.A.value);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0x96: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(Register.A, Register.A.value);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0x97: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(Register.A, Register.A.value);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0x98: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(
          Register.A, Register.B.value + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0x99: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(
          Register.A, Register.C.value + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0x9a: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(
          Register.A, Register.D.value + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0x9b: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(
          Register.A, Register.E.value + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0x9c: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(
          Register.A, Register.H.value + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0x9d: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(
          Register.A, Register.L.value + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0x9e: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(
          Register.A, ram[Register.HL.value] + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0x9f: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(
          Register.A, Register.A.value + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0xa0: (CPU cpu) {
      Register.A.value &= Register.B.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = true;
    },
    0xa1: (CPU cpu) {
      Register.A.value &= Register.C.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = true;
    },
    0xa2: (CPU cpu) {
      Register.A.value &= Register.D.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = true;
    },
    0xa3: (CPU cpu) {
      Register.A.value &= Register.E.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = true;
    },
    0xa4: (CPU cpu) {
      Register.A.value &= Register.H.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = true;
    },
    0xa5: (CPU cpu) {
      Register.A.value &= Register.L.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = true;
    },
    0xa6: (CPU cpu) {
      Register.A.value &= ram[Register.HL.value];
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = true;
    },
    0xa7: (CPU cpu) {
      Register.A.value &= Register.A.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = true;
    },
    0xa8: (CPU cpu) {
      Register.A.value ^= Register.B.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xa9: (CPU cpu) {
      Register.A.value ^= Register.C.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xaa: (CPU cpu) {
      Register.A.value ^= Register.D.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xab: (CPU cpu) {
      Register.A.value ^= Register.E.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xac: (CPU cpu) {
      Register.A.value ^= Register.H.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xad: (CPU cpu) {
      Register.A.value ^= Register.L.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xae: (CPU cpu) {
      Register.A.value ^= ram[Register.HL.value];
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xaf: (CPU cpu) {
      Register.A.value ^= Register.A.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xb0: (CPU cpu) {
      Register.A.value |= Register.B.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xb1: (CPU cpu) {
      Register.A.value |= Register.C.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xb2: (CPU cpu) {
      Register.A.value |= Register.D.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xb3: (CPU cpu) {
      Register.A.value |= Register.E.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xb4: (CPU cpu) {
      Register.A.value |= Register.H.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xb5: (CPU cpu) {
      Register.A.value |= Register.L.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xb6: (CPU cpu) {
      Register.A.value |= ram[Register.HL.value];
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xb7: (CPU cpu) {
      Register.A.value |= Register.A.value;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xb8: (CPU cpu) {
      if (Register.A.value == Register.B.value) {
        Flag.z.value = true;
      }
      subWithFlagAdjust(Register.A, Register.B.value);
      Flag.n.value = true;
    },
    0xb9: (CPU cpu) {
      if (Register.A.value == Register.C.value) {
        Flag.z.value = true;
      }
      subWithFlagAdjust(Register.A, Register.C.value);
      Flag.n.value = true;
    },
    0xba: (CPU cpu) {
      if (Register.A.value == Register.D.value) {
        Flag.z.value = true;
      }
      subWithFlagAdjust(Register.A, Register.D.value);
      Flag.n.value = true;
    },
    0xbb: (CPU cpu) {
      if (Register.A.value == Register.E.value) {
        Flag.z.value = true;
      }
      subWithFlagAdjust(Register.A, Register.E.value);
      Flag.n.value = true;
    },
    0xbc: (CPU cpu) {
      if (Register.A.value == Register.H.value) {
        Flag.z.value = true;
      }
      subWithFlagAdjust(Register.A, Register.H.value);
      Flag.n.value = true;
    },
    0xbd: (CPU cpu) {
      if (Register.A.value == Register.L.value) {
        Flag.z.value = true;
      }
      subWithFlagAdjust(Register.A, Register.L.value);
      Flag.n.value = true;
    },
    0xbe: (CPU cpu) {
      if (Register.A.value == ram[Register.HL.value]) {
        Flag.z.value = true;
      }
      subWithFlagAdjust(Register.A, ram[Register.HL.value]);
      Flag.n.value = true;
    },
    0xbf: (CPU cpu) {
      if (Register.A.value == Register.A.value) {
        Flag.z.value = true;
      }
      subWithFlagAdjust(Register.A, Register.A.value);
      Flag.n.value = true;
    },
    0xc0: (CPU cpu) {
      if (!Flag.z.value) {
        Register.PC.value =
            Register.PC.value & (255 << 8) + (ram[Register.SP.value] & 255);
        Register.SP.value++;
        Register.PC.value =
            Register.PC.value & 255 + ((ram[Register.SP.value] & 255) << 8);
        Register.SP.value++;
      }
    },
    0xc1: (CPU cpu) {
      Register.BC.value =
          Register.BC.value & (255 << 8) + (ram[Register.SP.value] & 255);
      Register.SP.value++;
      Register.BC.value =
          Register.BC.value + ((ram[Register.SP.value] & 255) << 8);
      Register.SP.value++;
    },
    0xc2: (CPU cpu) {
      if (!Flag.z.value) {
        Register.PC.value = cpu.getNextByte() + (cpu.getNextByte() << 8);
      }
    },
    0xc3: (CPU cpu) {
      Register.PC.value = cpu.getNextByte() + (cpu.getNextByte() << 8);
    },
    0xc4: (CPU cpu) {
      if (!Flag.z.value) {
        Register.PC.value = cpu.getNextByte() + (cpu.getNextByte() << 8);
      }
    },
    0xc5: (CPU cpu) {
      ram[Register.SP.value - 1] = Register.BC.value & (255 << 8);
      ram[Register.SP.value - 2] = Register.BC.value & 255;
      Register.SP.value -= 2;
    },
    0xc6: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(Register.A, cpu.getNextByte());
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
    },
    0xc7: (CPU cpu) {
      ram[Register.SP.value - 1] = Register.SP.value & (255 << 8);
      ram[Register.SP.value - 2] = Register.SP.value & 255;
      Register.SP.value -= 2;
      Register.PC.value = ram[0x00];
    },
    0xc8: (CPU cpu) {
      if (Flag.z.value) {
        Register.PC.value =
            Register.PC.value & (255 << 8) + (ram[Register.SP.value] & 255);
        Register.SP.value++;
        Register.PC.value =
            Register.PC.value & 255 + ((ram[Register.SP.value] & 255) << 8);
        Register.SP.value++;
      }
    },
    0xc9: (CPU cpu) {
      Register.PC.value =
          Register.PC.value & (255 << 8) + (ram[Register.SP.value] & 255);
      Register.SP.value++;
      Register.PC.value =
          Register.PC.value & 255 + ((ram[Register.SP.value] & 255) << 8);
      Register.SP.value++;
    },
    0xca: (CPU cpu) {
      if (Flag.z.value) {
        Register.PC.value = cpu.getNextByte() + (cpu.getNextByte() << 8);
      }
    },
    0xcb: (CPU cpu) {
      cbOpcodeToFunctionMap[cpu.getNextByte()]!(cpu);
    },
    0xcc: (CPU cpu) {
      if (Flag.z.value) {
        Register.PC.value = cpu.getNextByte() + (cpu.getNextByte() << 8);
      }
    },
    0xcd: (CPU cpu) {
      Register.PC.value = cpu.getNextByte() + (cpu.getNextByte() << 8);
    },
    0xce: (CPU cpu) {
      Register.A.value = addWithFlagAdjust(
          Register.A, cpu.getNextByte() + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
    },
    0xcf: (CPU cpu) {
      ram[Register.SP.value - 1] = Register.SP.value & (255 << 8);
      ram[Register.SP.value - 2] = Register.SP.value & 255;
      Register.SP.value -= 2;
      Register.PC.value = ram[0x08];
    },
    0xd0: (CPU cpu) {
      if (!Flag.c.value) {
        Register.PC.value =
            Register.PC.value & (255 << 8) + (ram[Register.SP.value] & 255);
        Register.SP.value++;
        Register.PC.value =
            Register.PC.value & 255 + ((ram[Register.SP.value] & 255) << 8);
        Register.SP.value++;
      }
    },
    0xd1: (CPU cpu) {
      Register.DE.value =
          Register.DE.value & (255 << 8) + (ram[Register.SP.value] & 255);
      Register.SP.value++;
      Register.DE.value =
          Register.DE.value + ((ram[Register.SP.value] & 255) << 8);
      Register.SP.value++;
    },
    0xd2: (CPU cpu) {
      if (!Flag.c.value) {
        Register.PC.value = cpu.getNextByte() + (cpu.getNextByte() << 8);
      }
    },
    0xd3: (CPU cpu) {},
    0xd4: (CPU cpu) {
      if (!Flag.c.value) {
        Register.PC.value = cpu.getNextByte() + (cpu.getNextByte() << 8);
      }
    },
    0xd5: (CPU cpu) {
      ram[Register.SP.value - 1] = Register.DE.value & (255 << 8);
      ram[Register.SP.value - 2] = Register.DE.value & 255;
      Register.SP.value -= 2;
    },
    0xd6: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(Register.A, Register.A.value);
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0xd7: (CPU cpu) {
      ram[Register.SP.value - 1] = Register.SP.value & (255 << 8);
      ram[Register.SP.value - 2] = Register.SP.value & 255;
      Register.SP.value -= 2;
      Register.PC.value = ram[0x10];
    },
    0xd8: (CPU cpu) {
      if (Flag.c.value) {
        Register.PC.value =
            Register.PC.value & (255 << 8) + (ram[Register.SP.value] & 255);
        Register.SP.value++;
        Register.PC.value =
            Register.PC.value & 255 + ((ram[Register.SP.value] & 255) << 8);
        Register.SP.value++;
      }
    },
    0xd9: (CPU cpu) {},
    0xda: (CPU cpu) {
      if (Flag.c.value) {
        Register.PC.value = cpu.getNextByte() + (cpu.getNextByte() << 8);
      }
    },
    0xdb: (CPU cpu) {},
    0xdc: (CPU cpu) {
      if (Flag.c.value) {
        Register.PC.value = cpu.getNextByte() + (cpu.getNextByte() << 8);
      }
    },
    0xdd: (CPU cpu) {},
    0xde: (CPU cpu) {
      Register.A.value = subWithFlagAdjust(
          Register.A, cpu.getNextByte() + (Flag.c.value ? 1 : 0));
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = true;
    },
    0xdf: (CPU cpu) {
      ram[Register.SP.value - 1] = Register.SP.value & (255 << 8);
      ram[Register.SP.value - 2] = Register.SP.value & 255;
      Register.SP.value -= 2;
      Register.PC.value = ram[0x18];
    },
    0xe0: (CPU cpu) {
      ram[0xff00 + cpu.getNextByte()] = Register.A.value;
    },
    0xe1: (CPU cpu) {
      Register.HL.value =
          Register.HL.value & (255 << 8) + (ram[Register.SP.value] & 255);
      Register.SP.value++;
      Register.HL.value =
          Register.HL.value + ((ram[Register.SP.value] & 255) << 8);
      Register.SP.value++;
    },
    0xe2: (CPU cpu) {
      ram[0xff00 + Register.C.value] = Register.A.value;
    },
    0xe3: (CPU cpu) {},
    0xe4: (CPU cpu) {},
    0xe5: (CPU cpu) {
      ram[Register.SP.value - 1] = Register.HL.value & (255 << 8);
      ram[Register.SP.value - 2] = Register.HL.value & 255;
      Register.SP.value -= 2;
    },
    0xe6: (CPU cpu) {
      Register.A.value &= cpu.getNextByte();
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = true;
    },
    0xe7: (CPU cpu) {
      ram[Register.SP.value - 1] = Register.SP.value & (255 << 8);
      ram[Register.SP.value - 2] = Register.SP.value & 255;
      Register.SP.value -= 2;
      Register.PC.value = ram[0x20];
    },
    0xe8: (CPU cpu) {
      Register.SP.value = addWithFlagAdjust(Register.SP, cpu.getNextByte());
      Flag.z.value = Register.SP.value == 0;
      Flag.n.value = false;
    },
    0xe9: (CPU cpu) {
      Register.PC.value = Register.HL.value;
    },
    0xea: (CPU cpu) {
      ram[cpu.getNextByte() + (cpu.getNextByte() << 8)] = Register.A.value;
    },
    0xeb: (CPU cpu) {},
    0xec: (CPU cpu) {},
    0xed: (CPU cpu) {},
    0xee: (CPU cpu) {
      Register.A.value ^= cpu.getNextByte();
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xef: (CPU cpu) {
      ram[Register.SP.value - 1] = Register.SP.value & (255 << 8);
      ram[Register.SP.value - 2] = Register.SP.value & 255;
      Register.SP.value -= 2;
      Register.PC.value = ram[0x28];
    },
    0xf0: (CPU cpu) {
      Register.A.value = ram[0xff00 + cpu.getNextByte()];
    },
    0xf1: (CPU cpu) {
      Register.AF.value =
          Register.AF.value & (255 << 8) + (ram[Register.SP.value] & 255);
      Register.SP.value++;
      Register.AF.value =
          Register.AF.value + ((ram[Register.SP.value] & 255) << 8);
      Register.SP.value++;
    },
    0xf2: (CPU cpu) {
      Register.A.value = ram[0xff00 + Register.C.value];
    },
    0xf3: (CPU cpu) {},
    0xf4: (CPU cpu) {},
    0xf5: (CPU cpu) {
      ram[Register.SP.value - 1] = Register.AF.value & (255 << 8);
      ram[Register.SP.value - 2] = Register.AF.value & 255;
      Register.SP.value -= 2;
    },
    0xf6: (CPU cpu) {
      Register.A.value |= cpu.getNextByte();
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xf7: (CPU cpu) {
      ram[Register.SP.value - 1] = Register.SP.value & (255 << 8);
      ram[Register.SP.value - 2] = Register.SP.value & 255;
      Register.SP.value -= 2;
      Register.PC.value = ram[0x30];
    },
    0xf8: (CPU cpu) {
      Register.HL.value = Register.SP.value + cpu.getNextByte();
      Flag.n.value = false;
    },
    0xf9: (CPU cpu) {
      Register.SP.value = Register.HL.value;
    },
    0xfa: (CPU cpu) {
      Register.A.value = ram[cpu.getNextByte() + (cpu.getNextByte() << 8)];
    },
    0xfb: (CPU cpu) {},
    0xfc: (CPU cpu) {},
    0xfd: (CPU cpu) {},
    0xfe: (CPU cpu) {
      if (Register.A.value == cpu.getNextByte()) {
        Flag.z.value = true;
      }
      subWithFlagAdjust(Register.A, cpu.getNextByte());
      Flag.n.value = true;
    },
    0xff: (CPU cpu) {
      ram[Register.SP.value - 1] = Register.SP.value & (255 << 8);
      ram[Register.SP.value - 2] = Register.SP.value & 255;
      Register.SP.value -= 2;
      Register.PC.value = ram[0x38];
    },
  };
  static final cbOpcodeToFunctionMap = {
    0x0: (CPU cpu) {
      Flag.c.value = (Register.B.value & 128) > 1;
      Register.B.value = (Register.B.value << 1) & 255;
      Register.B.value &= Flag.c.value ? 1 : 0;
      Flag.z.value = Register.B.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x1: (CPU cpu) {
      Flag.c.value = (Register.C.value & 128) > 1;
      Register.C.value = (Register.C.value << 1) & 255;
      Register.C.value &= Flag.c.value ? 1 : 0;
      Flag.z.value = Register.C.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x2: (CPU cpu) {
      Flag.c.value = (Register.D.value & 128) > 1;
      Register.D.value = (Register.D.value << 1) & 255;
      Register.D.value &= Flag.c.value ? 1 : 0;
      Flag.z.value = Register.D.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x3: (CPU cpu) {
      Flag.c.value = (Register.E.value & 128) > 1;
      Register.E.value = (Register.E.value << 1) & 255;
      Register.E.value &= Flag.c.value ? 1 : 0;
      Flag.z.value = Register.E.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x4: (CPU cpu) {
      Flag.c.value = (Register.H.value & 128) > 1;
      Register.H.value = (Register.H.value << 1) & 255;
      Register.H.value &= Flag.c.value ? 1 : 0;
      Flag.z.value = Register.H.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x5: (CPU cpu) {
      Flag.c.value = (Register.L.value & 128) > 1;
      Register.L.value = (Register.L.value << 1) & 255;
      Register.L.value &= Flag.c.value ? 1 : 0;
      Flag.z.value = Register.L.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x6: (CPU cpu) {
      Flag.c.value = (ram[Register.HL.value] & 128) > 1;
      ram[Register.HL.value] = (ram[Register.HL.value] << 1) & 255;
      ram[Register.HL.value] &= Flag.c.value ? 1 : 0;
      Flag.z.value = ram[Register.HL.value] == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x7: (CPU cpu) {
      Flag.c.value = (Register.A.value & 128) > 1;
      Register.A.value = (Register.A.value << 1) & 255;
      Register.A.value &= Flag.c.value ? 1 : 0;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x8: (CPU cpu) {
      Flag.c.value = (Register.B.value & 1) > 1;
      Register.B.value = (Register.B.value >> 1) & 255;
      Register.B.value &= (Flag.c.value ? 1 : 0) << 7;
      Flag.z.value = Register.B.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x9: (CPU cpu) {
      Flag.c.value = (Register.C.value & 1) > 1;
      Register.C.value = (Register.C.value >> 1) & 255;
      Register.C.value &= (Flag.c.value ? 1 : 0) << 7;
      Flag.z.value = Register.C.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xa: (CPU cpu) {
      Flag.c.value = (Register.D.value & 1) > 1;
      Register.D.value = (Register.D.value >> 1) & 255;
      Register.D.value &= (Flag.c.value ? 1 : 0) << 7;
      Flag.z.value = Register.D.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xb: (CPU cpu) {
      Flag.c.value = (Register.E.value & 1) > 1;
      Register.E.value = (Register.E.value >> 1) & 255;
      Register.E.value &= (Flag.c.value ? 1 : 0) << 7;
      Flag.z.value = Register.E.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xc: (CPU cpu) {
      Flag.c.value = (Register.H.value & 1) > 1;
      Register.H.value = (Register.H.value >> 1) & 255;
      Register.H.value &= (Flag.c.value ? 1 : 0) << 7;
      Flag.z.value = Register.H.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xd: (CPU cpu) {
      Flag.c.value = (Register.L.value & 1) > 1;
      Register.L.value = (Register.L.value >> 1) & 255;
      Register.L.value &= (Flag.c.value ? 1 : 0) << 7;
      Flag.z.value = Register.L.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xe: (CPU cpu) {
      Flag.c.value = (ram[Register.HL.value] & 1) > 1;
      ram[Register.HL.value] = (ram[Register.HL.value] >> 1) & 255;
      ram[Register.HL.value] &= (Flag.c.value ? 1 : 0) << 7;
      Flag.z.value = ram[Register.HL.value] == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0xf: (CPU cpu) {
      Flag.c.value = (Register.A.value & 1) > 1;
      Register.A.value = (Register.A.value >> 1) & 255;
      Register.A.value &= (Flag.c.value ? 1 : 0) << 7;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x10: (CPU cpu) {
      final highBit = (Register.A.value & 128) > 0;
      Register.B.value = (Register.B.value << 1) & 255;
      Register.B.value &= Flag.c.value ? 1 : 0;
      Flag.c.value = highBit;
      Flag.z.value = Register.B.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x11: (CPU cpu) {
      final highBit = (Register.A.value & 128) > 0;
      Register.C.value = (Register.C.value << 1) & 255;
      Register.C.value &= Flag.c.value ? 1 : 0;
      Flag.c.value = highBit;
      Flag.z.value = Register.C.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x12: (CPU cpu) {
      final highBit = (Register.A.value & 128) > 0;
      Register.D.value = (Register.D.value << 1) & 255;
      Register.D.value &= Flag.c.value ? 1 : 0;
      Flag.c.value = highBit;
      Flag.z.value = Register.D.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x13: (CPU cpu) {
      final highBit = (Register.A.value & 128) > 0;
      Register.E.value = (Register.E.value << 1) & 255;
      Register.E.value &= Flag.c.value ? 1 : 0;
      Flag.c.value = highBit;
      Flag.z.value = Register.E.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x14: (CPU cpu) {
      final highBit = (Register.A.value & 128) > 0;
      Register.H.value = (Register.H.value << 1) & 255;
      Register.H.value &= Flag.c.value ? 1 : 0;
      Flag.c.value = highBit;
      Flag.z.value = Register.H.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x15: (CPU cpu) {
      final highBit = (Register.A.value & 128) > 0;
      Register.L.value = (Register.L.value << 1) & 255;
      Register.L.value &= Flag.c.value ? 1 : 0;
      Flag.c.value = highBit;
      Flag.z.value = Register.L.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x16: (CPU cpu) {
      final highBit = (Register.A.value & 128) > 0;
      ram[Register.HL.value] = (ram[Register.HL.value] << 1) & 255;
      ram[Register.HL.value] &= Flag.c.value ? 1 : 0;
      Flag.c.value = highBit;
      Flag.z.value = ram[Register.HL.value] == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x17: (CPU cpu) {
      final highBit = (Register.A.value & 128) > 0;
      Register.A.value = (Register.A.value << 1) & 255;
      Register.A.value &= Flag.c.value ? 1 : 0;
      Flag.c.value = highBit;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x18: (CPU cpu) {
      final lowBit = (Register.A.value & 1) > 0;
      Register.B.value = (Register.B.value >> 1) & 255;
      Register.B.value &= (Flag.c.value ? 1 : 0) << 7;
      Flag.c.value = lowBit;
      Flag.z.value = Register.B.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x19: (CPU cpu) {
      final lowBit = (Register.A.value & 1) > 0;
      Register.C.value = (Register.C.value >> 1) & 255;
      Register.C.value &= (Flag.c.value ? 1 : 0) << 7;
      Flag.c.value = lowBit;
      Flag.z.value = Register.C.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x1a: (CPU cpu) {
      final lowBit = (Register.A.value & 1) > 0;
      Register.D.value = (Register.D.value >> 1) & 255;
      Register.D.value &= (Flag.c.value ? 1 : 0) << 7;
      Flag.c.value = lowBit;
      Flag.z.value = Register.D.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x1b: (CPU cpu) {
      final lowBit = (Register.A.value & 1) > 0;
      Register.E.value = (Register.E.value >> 1) & 255;
      Register.E.value &= (Flag.c.value ? 1 : 0) << 7;
      Flag.c.value = lowBit;
      Flag.z.value = Register.E.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x1c: (CPU cpu) {
      final lowBit = (Register.A.value & 1) > 0;
      Register.H.value = (Register.H.value >> 1) & 255;
      Register.H.value &= (Flag.c.value ? 1 : 0) << 7;
      Flag.c.value = lowBit;
      Flag.z.value = Register.H.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x1d: (CPU cpu) {
      final lowBit = (Register.A.value & 1) > 0;
      Register.L.value = (Register.L.value >> 1) & 255;
      Register.L.value &= (Flag.c.value ? 1 : 0) << 7;
      Flag.c.value = lowBit;
      Flag.z.value = Register.L.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x1e: (CPU cpu) {
      final lowBit = (Register.A.value & 1) > 0;
      ram[Register.HL.value] = (ram[Register.HL.value] >> 1) & 255;
      ram[Register.HL.value] &= (Flag.c.value ? 1 : 0) << 7;
      Flag.c.value = lowBit;
      Flag.z.value = ram[Register.HL.value] == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x1f: (CPU cpu) {
      final lowBit = (Register.A.value & 1) > 0;
      Register.A.value = (Register.A.value >> 1) & 255;
      Register.A.value &= (Flag.c.value ? 1 : 0) << 7;
      Flag.c.value = lowBit;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x20: (CPU cpu) {
      Flag.c.value = (Register.B.value & 128) > 1;
      Register.B.value = (Register.B.value << 1) & 255;
      Flag.z.value = Register.B.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x21: (CPU cpu) {
      Flag.c.value = (Register.C.value & 128) > 1;
      Register.C.value = (Register.C.value << 1) & 255;
      Flag.z.value = Register.C.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x22: (CPU cpu) {
      Flag.c.value = (Register.D.value & 128) > 1;
      Register.D.value = (Register.D.value << 1) & 255;
      Flag.z.value = Register.D.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x23: (CPU cpu) {
      Flag.c.value = (Register.E.value & 128) > 1;
      Register.E.value = (Register.E.value << 1) & 255;
      Flag.z.value = Register.E.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x24: (CPU cpu) {
      Flag.c.value = (Register.H.value & 128) > 1;
      Register.H.value = (Register.H.value << 1) & 255;
      Flag.z.value = Register.H.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x25: (CPU cpu) {
      Flag.c.value = (Register.L.value & 128) > 1;
      Register.L.value = (Register.L.value << 1) & 255;
      Flag.z.value = Register.L.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x26: (CPU cpu) {
      Flag.c.value = (ram[Register.HL.value] & 128) > 1;
      ram[Register.HL.value] = (ram[Register.HL.value] << 1) & 255;
      Flag.z.value = ram[Register.HL.value] == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x27: (CPU cpu) {
      Flag.c.value = (Register.A.value & 128) > 1;
      Register.A.value = (Register.A.value << 1) & 255;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x28: (CPU cpu) {
      Flag.c.value = (Register.B.value & 1) > 1;
      final unchangedBit = Register.B.value & 128;
      Register.B.value = ((Register.B.value >> 1) & 255) + unchangedBit;
      Flag.z.value = Register.B.value == 0;
      Flag.n.value = false;
    },
    0x29: (CPU cpu) {
      Flag.c.value = (Register.C.value & 1) > 1;
      final unchangedBit = Register.C.value & 128;
      Register.C.value = ((Register.C.value >> 1) & 255) + unchangedBit;
      Flag.z.value = Register.C.value == 0;
      Flag.n.value = false;
    },
    0x2a: (CPU cpu) {
      Flag.c.value = (Register.D.value & 1) > 1;
      final unchangedBit = Register.D.value & 128;
      Register.D.value = ((Register.D.value >> 1) & 255) + unchangedBit;
      Flag.z.value = Register.D.value == 0;
      Flag.n.value = false;
    },
    0x2b: (CPU cpu) {
      Flag.c.value = (Register.E.value & 1) > 1;
      final unchangedBit = Register.E.value & 128;
      Register.E.value = ((Register.E.value >> 1) & 255) + unchangedBit;
      Flag.z.value = Register.E.value == 0;
      Flag.n.value = false;
    },
    0x2c: (CPU cpu) {
      Flag.c.value = (Register.H.value & 1) > 1;
      final unchangedBit = Register.H.value & 128;
      Register.H.value = ((Register.H.value >> 1) & 255) + unchangedBit;
      Flag.z.value = Register.H.value == 0;
      Flag.n.value = false;
    },
    0x2d: (CPU cpu) {
      Flag.c.value = (Register.L.value & 1) > 1;
      final unchangedBit = Register.L.value & 128;
      Register.L.value = ((Register.L.value >> 1) & 255) + unchangedBit;
      Flag.z.value = Register.L.value == 0;
      Flag.n.value = false;
    },
    0x2e: (CPU cpu) {
      Flag.c.value = (ram[Register.HL.value] & 1) > 1;
      final unchangedBit = ram[Register.HL.value] & 128;
      ram[Register.HL.value] =
          ((ram[Register.HL.value] >> 1) & 255) + unchangedBit;
      Flag.z.value = ram[Register.HL.value] == 0;
      Flag.n.value = false;
    },
    0x2f: (CPU cpu) {
      Flag.c.value = (Register.A.value & 1) > 1;
      final unchangedBit = Register.A.value & 128;
      Register.A.value = ((Register.A.value >> 1) & 255) + unchangedBit;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
    },
    0x30: (CPU cpu) {
      final low = Register.B.value & 255;
      Register.B.value >>= 4;
      Register.B.value = Register.B.value | (low << 4);
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x31: (CPU cpu) {
      final low = Register.C.value & 255;
      Register.C.value >>= 4;
      Register.C.value = Register.C.value | (low << 4);
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x32: (CPU cpu) {
      final low = Register.D.value & 255;
      Register.D.value >>= 4;
      Register.D.value = Register.D.value | (low << 4);
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x33: (CPU cpu) {
      final low = Register.E.value & 255;
      Register.E.value >>= 4;
      Register.E.value = Register.E.value | (low << 4);
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x34: (CPU cpu) {
      final low = Register.H.value & 255;
      Register.H.value >>= 4;
      Register.H.value = Register.H.value | (low << 4);
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x35: (CPU cpu) {
      final low = Register.L.value & 255;
      Register.L.value >>= 4;
      Register.L.value = Register.L.value | (low << 4);
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x36: (CPU cpu) {
      final low = ram[Register.HL.value] & 255;
      ram[Register.HL.value] >>= 4;
      ram[Register.HL.value] = ram[Register.HL.value] | (low << 4);
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x37: (CPU cpu) {
      final low = Register.A.value & 255;
      Register.A.value >>= 4;
      Register.A.value = Register.A.value | (low << 4);
      Flag.n.value = false;
      Flag.h.value = false;
    },
    0x38: (CPU cpu) {
      Flag.c.value = (Register.B.value & 1) > 1;
      Register.B.value = (Register.B.value >> 1) & 255;
      Flag.z.value = Register.B.value == 0;
      Flag.n.value = false;
    },
    0x39: (CPU cpu) {
      Flag.c.value = (Register.C.value & 1) > 1;
      Register.C.value = (Register.C.value >> 1) & 255;
      Flag.z.value = Register.C.value == 0;
      Flag.n.value = false;
    },
    0x3a: (CPU cpu) {
      Flag.c.value = (Register.D.value & 1) > 1;
      Register.D.value = (Register.D.value >> 1) & 255;
      Flag.z.value = Register.D.value == 0;
      Flag.n.value = false;
    },
    0x3b: (CPU cpu) {
      Flag.c.value = (Register.E.value & 1) > 1;
      Register.E.value = (Register.E.value >> 1) & 255;
      Flag.z.value = Register.E.value == 0;
      Flag.n.value = false;
    },
    0x3c: (CPU cpu) {
      Flag.c.value = (Register.H.value & 1) > 1;
      Register.H.value = (Register.H.value >> 1) & 255;
      Flag.z.value = Register.H.value == 0;
      Flag.n.value = false;
    },
    0x3d: (CPU cpu) {
      Flag.c.value = (Register.L.value & 1) > 1;
      Register.L.value = (Register.L.value >> 1) & 255;
      Flag.z.value = Register.L.value == 0;
      Flag.n.value = false;
    },
    0x3e: (CPU cpu) {
      Flag.c.value = (ram[Register.HL.value] & 1) > 1;
      ram[Register.HL.value] = (ram[Register.HL.value] >> 1) & 255;
      Flag.z.value = ram[Register.HL.value] == 0;
      Flag.n.value = false;
    },
    0x3f: (CPU cpu) {
      Flag.c.value = (Register.A.value & 1) > 1;
      Register.A.value = (Register.A.value >> 1) & 255;
      Flag.z.value = Register.A.value == 0;
      Flag.n.value = false;
    },
    0x40: (CPU cpu) {
      Flag.z.value = (Register.B.value & (1 << 0)) > 0;
      Flag.n.value = false;
    },
    0x41: (CPU cpu) {
      Flag.z.value = (Register.C.value & (1 << 0)) > 0;
      Flag.n.value = false;
    },
    0x42: (CPU cpu) {
      Flag.z.value = (Register.D.value & (1 << 0)) > 0;
      Flag.n.value = false;
    },
    0x43: (CPU cpu) {
      Flag.z.value = (Register.E.value & (1 << 0)) > 0;
      Flag.n.value = false;
    },
    0x44: (CPU cpu) {
      Flag.z.value = (Register.H.value & (1 << 0)) > 0;
      Flag.n.value = false;
    },
    0x45: (CPU cpu) {
      Flag.z.value = (Register.L.value & (1 << 0)) > 0;
      Flag.n.value = false;
    },
    0x46: (CPU cpu) {
      Flag.z.value = (ram[Register.HL.value] & (1 << 0)) > 0;
      Flag.n.value = false;
    },
    0x47: (CPU cpu) {
      Flag.z.value = (Register.A.value & (1 << 0)) > 0;
      Flag.n.value = false;
    },
    0x48: (CPU cpu) {
      Flag.z.value = (Register.B.value & (1 << 1)) > 0;
      Flag.n.value = false;
    },
    0x49: (CPU cpu) {
      Flag.z.value = (Register.C.value & (1 << 1)) > 0;
      Flag.n.value = false;
    },
    0x4a: (CPU cpu) {
      Flag.z.value = (Register.D.value & (1 << 1)) > 0;
      Flag.n.value = false;
    },
    0x4b: (CPU cpu) {
      Flag.z.value = (Register.E.value & (1 << 1)) > 0;
      Flag.n.value = false;
    },
    0x4c: (CPU cpu) {
      Flag.z.value = (Register.H.value & (1 << 1)) > 0;
      Flag.n.value = false;
    },
    0x4d: (CPU cpu) {
      Flag.z.value = (Register.L.value & (1 << 1)) > 0;
      Flag.n.value = false;
    },
    0x4e: (CPU cpu) {
      Flag.z.value = (ram[Register.HL.value] & (1 << 1)) > 0;
      Flag.n.value = false;
    },
    0x4f: (CPU cpu) {
      Flag.z.value = (Register.A.value & (1 << 1)) > 0;
      Flag.n.value = false;
    },
    0x50: (CPU cpu) {
      Flag.z.value = (Register.B.value & (1 << 2)) > 0;
      Flag.n.value = false;
    },
    0x51: (CPU cpu) {
      Flag.z.value = (Register.C.value & (1 << 2)) > 0;
      Flag.n.value = false;
    },
    0x52: (CPU cpu) {
      Flag.z.value = (Register.D.value & (1 << 2)) > 0;
      Flag.n.value = false;
    },
    0x53: (CPU cpu) {
      Flag.z.value = (Register.E.value & (1 << 2)) > 0;
      Flag.n.value = false;
    },
    0x54: (CPU cpu) {
      Flag.z.value = (Register.H.value & (1 << 2)) > 0;
      Flag.n.value = false;
    },
    0x55: (CPU cpu) {
      Flag.z.value = (Register.L.value & (1 << 2)) > 0;
      Flag.n.value = false;
    },
    0x56: (CPU cpu) {
      Flag.z.value = (ram[Register.HL.value] & (1 << 2)) > 0;
      Flag.n.value = false;
    },
    0x57: (CPU cpu) {
      Flag.z.value = (Register.A.value & (1 << 2)) > 0;
      Flag.n.value = false;
    },
    0x58: (CPU cpu) {
      Flag.z.value = (Register.B.value & (1 << 3)) > 0;
      Flag.n.value = false;
    },
    0x59: (CPU cpu) {
      Flag.z.value = (Register.C.value & (1 << 3)) > 0;
      Flag.n.value = false;
    },
    0x5a: (CPU cpu) {
      Flag.z.value = (Register.D.value & (1 << 3)) > 0;
      Flag.n.value = false;
    },
    0x5b: (CPU cpu) {
      Flag.z.value = (Register.E.value & (1 << 3)) > 0;
      Flag.n.value = false;
    },
    0x5c: (CPU cpu) {
      Flag.z.value = (Register.H.value & (1 << 3)) > 0;
      Flag.n.value = false;
    },
    0x5d: (CPU cpu) {
      Flag.z.value = (Register.L.value & (1 << 3)) > 0;
      Flag.n.value = false;
    },
    0x5e: (CPU cpu) {
      Flag.z.value = (ram[Register.HL.value] & (1 << 3)) > 0;
      Flag.n.value = false;
    },
    0x5f: (CPU cpu) {
      Flag.z.value = (Register.A.value & (1 << 3)) > 0;
      Flag.n.value = false;
    },
    0x60: (CPU cpu) {
      Flag.z.value = (Register.B.value & (1 << 4)) > 0;
      Flag.n.value = false;
    },
    0x61: (CPU cpu) {
      Flag.z.value = (Register.C.value & (1 << 4)) > 0;
      Flag.n.value = false;
    },
    0x62: (CPU cpu) {
      Flag.z.value = (Register.D.value & (1 << 4)) > 0;
      Flag.n.value = false;
    },
    0x63: (CPU cpu) {
      Flag.z.value = (Register.E.value & (1 << 4)) > 0;
      Flag.n.value = false;
    },
    0x64: (CPU cpu) {
      Flag.z.value = (Register.H.value & (1 << 4)) > 0;
      Flag.n.value = false;
    },
    0x65: (CPU cpu) {
      Flag.z.value = (Register.L.value & (1 << 4)) > 0;
      Flag.n.value = false;
    },
    0x66: (CPU cpu) {
      Flag.z.value = (ram[Register.HL.value] & (1 << 4)) > 0;
      Flag.n.value = false;
    },
    0x67: (CPU cpu) {
      Flag.z.value = (Register.A.value & (1 << 4)) > 0;
      Flag.n.value = false;
    },
    0x68: (CPU cpu) {
      Flag.z.value = (Register.B.value & (1 << 5)) > 0;
      Flag.n.value = false;
    },
    0x69: (CPU cpu) {
      Flag.z.value = (Register.C.value & (1 << 5)) > 0;
      Flag.n.value = false;
    },
    0x6a: (CPU cpu) {
      Flag.z.value = (Register.D.value & (1 << 5)) > 0;
      Flag.n.value = false;
    },
    0x6b: (CPU cpu) {
      Flag.z.value = (Register.E.value & (1 << 5)) > 0;
      Flag.n.value = false;
    },
    0x6c: (CPU cpu) {
      Flag.z.value = (Register.H.value & (1 << 5)) > 0;
      Flag.n.value = false;
    },
    0x6d: (CPU cpu) {
      Flag.z.value = (Register.L.value & (1 << 5)) > 0;
      Flag.n.value = false;
    },
    0x6e: (CPU cpu) {
      Flag.z.value = (ram[Register.HL.value] & (1 << 5)) > 0;
      Flag.n.value = false;
    },
    0x6f: (CPU cpu) {
      Flag.z.value = (Register.A.value & (1 << 5)) > 0;
      Flag.n.value = false;
    },
    0x70: (CPU cpu) {
      Flag.z.value = (Register.B.value & (1 << 6)) > 0;
      Flag.n.value = false;
    },
    0x71: (CPU cpu) {
      Flag.z.value = (Register.C.value & (1 << 6)) > 0;
      Flag.n.value = false;
    },
    0x72: (CPU cpu) {
      Flag.z.value = (Register.D.value & (1 << 6)) > 0;
      Flag.n.value = false;
    },
    0x73: (CPU cpu) {
      Flag.z.value = (Register.E.value & (1 << 6)) > 0;
      Flag.n.value = false;
    },
    0x74: (CPU cpu) {
      Flag.z.value = (Register.H.value & (1 << 6)) > 0;
      Flag.n.value = false;
    },
    0x75: (CPU cpu) {
      Flag.z.value = (Register.L.value & (1 << 6)) > 0;
      Flag.n.value = false;
    },
    0x76: (CPU cpu) {
      Flag.z.value = (ram[Register.HL.value] & (1 << 6)) > 0;
      Flag.n.value = false;
    },
    0x77: (CPU cpu) {
      Flag.z.value = (Register.A.value & (1 << 6)) > 0;
      Flag.n.value = false;
    },
    0x78: (CPU cpu) {
      Flag.z.value = (Register.B.value & (1 << 7)) > 0;
      Flag.n.value = false;
    },
    0x79: (CPU cpu) {
      Flag.z.value = (Register.C.value & (1 << 7)) > 0;
      Flag.n.value = false;
    },
    0x7a: (CPU cpu) {
      Flag.z.value = (Register.D.value & (1 << 7)) > 0;
      Flag.n.value = false;
    },
    0x7b: (CPU cpu) {
      Flag.z.value = (Register.E.value & (1 << 7)) > 0;
      Flag.n.value = false;
    },
    0x7c: (CPU cpu) {
      Flag.z.value = (Register.H.value & (1 << 7)) > 0;
      Flag.n.value = false;
    },
    0x7d: (CPU cpu) {
      Flag.z.value = (Register.L.value & (1 << 7)) > 0;
      Flag.n.value = false;
    },
    0x7e: (CPU cpu) {
      Flag.z.value = (ram[Register.HL.value] & (1 << 7)) > 0;
      Flag.n.value = false;
    },
    0x7f: (CPU cpu) {
      Flag.z.value = (Register.A.value & (1 << 7)) > 0;
      Flag.n.value = false;
    },
    0x80: (CPU cpu) {
      Register.B.value = Register.B.value - (Register.B.value & (1 << 0));
    },
    0x81: (CPU cpu) {
      Register.C.value = Register.C.value - (Register.C.value & (1 << 0));
    },
    0x82: (CPU cpu) {
      Register.D.value = Register.D.value - (Register.D.value & (1 << 0));
    },
    0x83: (CPU cpu) {
      Register.E.value = Register.E.value - (Register.E.value & (1 << 0));
    },
    0x84: (CPU cpu) {
      Register.H.value = Register.H.value - (Register.H.value & (1 << 0));
    },
    0x85: (CPU cpu) {
      Register.L.value = Register.L.value - (Register.L.value & (1 << 0));
    },
    0x86: (CPU cpu) {
      ram[Register.HL.value] =
          ram[Register.HL.value] - (ram[Register.HL.value] & (1 << 0));
    },
    0x87: (CPU cpu) {
      Register.A.value = Register.A.value - (Register.A.value & (1 << 0));
    },
    0x88: (CPU cpu) {
      Register.B.value = Register.B.value - (Register.B.value & (1 << 1));
    },
    0x89: (CPU cpu) {
      Register.C.value = Register.C.value - (Register.C.value & (1 << 1));
    },
    0x8a: (CPU cpu) {
      Register.D.value = Register.D.value - (Register.D.value & (1 << 1));
    },
    0x8b: (CPU cpu) {
      Register.E.value = Register.E.value - (Register.E.value & (1 << 1));
    },
    0x8c: (CPU cpu) {
      Register.H.value = Register.H.value - (Register.H.value & (1 << 1));
    },
    0x8d: (CPU cpu) {
      Register.L.value = Register.L.value - (Register.L.value & (1 << 1));
    },
    0x8e: (CPU cpu) {
      ram[Register.HL.value] =
          ram[Register.HL.value] - (ram[Register.HL.value] & (1 << 1));
    },
    0x8f: (CPU cpu) {
      Register.A.value = Register.A.value - (Register.A.value & (1 << 1));
    },
    0x90: (CPU cpu) {
      Register.B.value = Register.B.value - (Register.B.value & (1 << 2));
    },
    0x91: (CPU cpu) {
      Register.C.value = Register.C.value - (Register.C.value & (1 << 2));
    },
    0x92: (CPU cpu) {
      Register.D.value = Register.D.value - (Register.D.value & (1 << 2));
    },
    0x93: (CPU cpu) {
      Register.E.value = Register.E.value - (Register.E.value & (1 << 2));
    },
    0x94: (CPU cpu) {
      Register.H.value = Register.H.value - (Register.H.value & (1 << 2));
    },
    0x95: (CPU cpu) {
      Register.L.value = Register.L.value - (Register.L.value & (1 << 2));
    },
    0x96: (CPU cpu) {
      ram[Register.HL.value] =
          ram[Register.HL.value] - (ram[Register.HL.value] & (1 << 2));
    },
    0x97: (CPU cpu) {
      Register.A.value = Register.A.value - (Register.A.value & (1 << 2));
    },
    0x98: (CPU cpu) {
      Register.B.value = Register.B.value - (Register.B.value & (1 << 3));
    },
    0x99: (CPU cpu) {
      Register.C.value = Register.C.value - (Register.C.value & (1 << 3));
    },
    0x9a: (CPU cpu) {
      Register.D.value = Register.D.value - (Register.D.value & (1 << 3));
    },
    0x9b: (CPU cpu) {
      Register.E.value = Register.E.value - (Register.E.value & (1 << 3));
    },
    0x9c: (CPU cpu) {
      Register.H.value = Register.H.value - (Register.H.value & (1 << 3));
    },
    0x9d: (CPU cpu) {
      Register.L.value = Register.L.value - (Register.L.value & (1 << 3));
    },
    0x9e: (CPU cpu) {
      ram[Register.HL.value] =
          ram[Register.HL.value] - (ram[Register.HL.value] & (1 << 3));
    },
    0x9f: (CPU cpu) {
      Register.A.value = Register.A.value - (Register.A.value & (1 << 3));
    },
    0xa0: (CPU cpu) {
      Register.B.value = Register.B.value - (Register.B.value & (1 << 4));
    },
    0xa1: (CPU cpu) {
      Register.C.value = Register.C.value - (Register.C.value & (1 << 4));
    },
    0xa2: (CPU cpu) {
      Register.D.value = Register.D.value - (Register.D.value & (1 << 4));
    },
    0xa3: (CPU cpu) {
      Register.E.value = Register.E.value - (Register.E.value & (1 << 4));
    },
    0xa4: (CPU cpu) {
      Register.H.value = Register.H.value - (Register.H.value & (1 << 4));
    },
    0xa5: (CPU cpu) {
      Register.L.value = Register.L.value - (Register.L.value & (1 << 4));
    },
    0xa6: (CPU cpu) {
      ram[Register.HL.value] =
          ram[Register.HL.value] - (ram[Register.HL.value] & (1 << 4));
    },
    0xa7: (CPU cpu) {
      Register.A.value = Register.A.value - (Register.A.value & (1 << 4));
    },
    0xa8: (CPU cpu) {
      Register.B.value = Register.B.value - (Register.B.value & (1 << 5));
    },
    0xa9: (CPU cpu) {
      Register.C.value = Register.C.value - (Register.C.value & (1 << 5));
    },
    0xaa: (CPU cpu) {
      Register.D.value = Register.D.value - (Register.D.value & (1 << 5));
    },
    0xab: (CPU cpu) {
      Register.E.value = Register.E.value - (Register.E.value & (1 << 5));
    },
    0xac: (CPU cpu) {
      Register.H.value = Register.H.value - (Register.H.value & (1 << 5));
    },
    0xad: (CPU cpu) {
      Register.L.value = Register.L.value - (Register.L.value & (1 << 5));
    },
    0xae: (CPU cpu) {
      ram[Register.HL.value] =
          ram[Register.HL.value] - (ram[Register.HL.value] & (1 << 5));
    },
    0xaf: (CPU cpu) {
      Register.A.value = Register.A.value - (Register.A.value & (1 << 5));
    },
    0xb0: (CPU cpu) {
      Register.B.value = Register.B.value - (Register.B.value & (1 << 6));
    },
    0xb1: (CPU cpu) {
      Register.C.value = Register.C.value - (Register.C.value & (1 << 6));
    },
    0xb2: (CPU cpu) {
      Register.D.value = Register.D.value - (Register.D.value & (1 << 6));
    },
    0xb3: (CPU cpu) {
      Register.E.value = Register.E.value - (Register.E.value & (1 << 6));
    },
    0xb4: (CPU cpu) {
      Register.H.value = Register.H.value - (Register.H.value & (1 << 6));
    },
    0xb5: (CPU cpu) {
      Register.L.value = Register.L.value - (Register.L.value & (1 << 6));
    },
    0xb6: (CPU cpu) {
      ram[Register.HL.value] =
          ram[Register.HL.value] - (ram[Register.HL.value] & (1 << 6));
    },
    0xb7: (CPU cpu) {
      Register.A.value = Register.A.value - (Register.A.value & (1 << 6));
    },
    0xb8: (CPU cpu) {
      Register.B.value = Register.B.value - (Register.B.value & (1 << 7));
    },
    0xb9: (CPU cpu) {
      Register.C.value = Register.C.value - (Register.C.value & (1 << 7));
    },
    0xba: (CPU cpu) {
      Register.D.value = Register.D.value - (Register.D.value & (1 << 7));
    },
    0xbb: (CPU cpu) {
      Register.E.value = Register.E.value - (Register.E.value & (1 << 7));
    },
    0xbc: (CPU cpu) {
      Register.H.value = Register.H.value - (Register.H.value & (1 << 7));
    },
    0xbd: (CPU cpu) {
      Register.L.value = Register.L.value - (Register.L.value & (1 << 7));
    },
    0xbe: (CPU cpu) {
      ram[Register.HL.value] =
          ram[Register.HL.value] - (ram[Register.HL.value] & (1 << 7));
    },
    0xbf: (CPU cpu) {
      Register.A.value = Register.A.value - (Register.A.value & (1 << 7));
    },
    0xc0: (CPU cpu) {
      Register.B.value |= (1 << 0);
    },
    0xc1: (CPU cpu) {
      Register.C.value |= (1 << 0);
    },
    0xc2: (CPU cpu) {
      Register.D.value |= (1 << 0);
    },
    0xc3: (CPU cpu) {
      Register.E.value |= (1 << 0);
    },
    0xc4: (CPU cpu) {
      Register.H.value |= (1 << 0);
    },
    0xc5: (CPU cpu) {
      Register.L.value |= (1 << 0);
    },
    0xc6: (CPU cpu) {
      ram[Register.HL.value] |= (1 << 0);
    },
    0xc7: (CPU cpu) {
      Register.A.value |= (1 << 0);
    },
    0xc8: (CPU cpu) {
      Register.B.value |= (1 << 1);
    },
    0xc9: (CPU cpu) {
      Register.C.value |= (1 << 1);
    },
    0xca: (CPU cpu) {
      Register.D.value |= (1 << 1);
    },
    0xcb: (CPU cpu) {
      Register.E.value |= (1 << 1);
    },
    0xcc: (CPU cpu) {
      Register.H.value |= (1 << 1);
    },
    0xcd: (CPU cpu) {
      Register.L.value |= (1 << 1);
    },
    0xce: (CPU cpu) {
      ram[Register.HL.value] |= (1 << 1);
    },
    0xcf: (CPU cpu) {
      Register.A.value |= (1 << 1);
    },
    0xd0: (CPU cpu) {
      Register.B.value |= (1 << 2);
    },
    0xd1: (CPU cpu) {
      Register.C.value |= (1 << 2);
    },
    0xd2: (CPU cpu) {
      Register.D.value |= (1 << 2);
    },
    0xd3: (CPU cpu) {
      Register.E.value |= (1 << 2);
    },
    0xd4: (CPU cpu) {
      Register.H.value |= (1 << 2);
    },
    0xd5: (CPU cpu) {
      Register.L.value |= (1 << 2);
    },
    0xd6: (CPU cpu) {
      ram[Register.HL.value] |= (1 << 2);
    },
    0xd7: (CPU cpu) {
      Register.A.value |= (1 << 2);
    },
    0xd8: (CPU cpu) {
      Register.B.value |= (1 << 3);
    },
    0xd9: (CPU cpu) {
      Register.C.value |= (1 << 3);
    },
    0xda: (CPU cpu) {
      Register.D.value |= (1 << 3);
    },
    0xdb: (CPU cpu) {
      Register.E.value |= (1 << 3);
    },
    0xdc: (CPU cpu) {
      Register.H.value |= (1 << 3);
    },
    0xdd: (CPU cpu) {
      Register.L.value |= (1 << 3);
    },
    0xde: (CPU cpu) {
      ram[Register.HL.value] |= (1 << 3);
    },
    0xdf: (CPU cpu) {
      Register.A.value |= (1 << 3);
    },
    0xe0: (CPU cpu) {
      Register.B.value |= (1 << 4);
    },
    0xe1: (CPU cpu) {
      Register.C.value |= (1 << 4);
    },
    0xe2: (CPU cpu) {
      Register.D.value |= (1 << 4);
    },
    0xe3: (CPU cpu) {
      Register.E.value |= (1 << 4);
    },
    0xe4: (CPU cpu) {
      Register.H.value |= (1 << 4);
    },
    0xe5: (CPU cpu) {
      Register.L.value |= (1 << 4);
    },
    0xe6: (CPU cpu) {
      ram[Register.HL.value] |= (1 << 4);
    },
    0xe7: (CPU cpu) {
      Register.A.value |= (1 << 4);
    },
    0xe8: (CPU cpu) {
      Register.B.value |= (1 << 5);
    },
    0xe9: (CPU cpu) {
      Register.C.value |= (1 << 5);
    },
    0xea: (CPU cpu) {
      Register.D.value |= (1 << 5);
    },
    0xeb: (CPU cpu) {
      Register.E.value |= (1 << 5);
    },
    0xec: (CPU cpu) {
      Register.H.value |= (1 << 5);
    },
    0xed: (CPU cpu) {
      Register.L.value |= (1 << 5);
    },
    0xee: (CPU cpu) {
      ram[Register.HL.value] |= (1 << 5);
    },
    0xef: (CPU cpu) {
      Register.A.value |= (1 << 5);
    },
    0xf0: (CPU cpu) {
      Register.B.value |= (1 << 6);
    },
    0xf1: (CPU cpu) {
      Register.C.value |= (1 << 6);
    },
    0xf2: (CPU cpu) {
      Register.D.value |= (1 << 6);
    },
    0xf3: (CPU cpu) {
      Register.E.value |= (1 << 6);
    },
    0xf4: (CPU cpu) {
      Register.H.value |= (1 << 6);
    },
    0xf5: (CPU cpu) {
      Register.L.value |= (1 << 6);
    },
    0xf6: (CPU cpu) {
      ram[Register.HL.value] |= (1 << 6);
    },
    0xf7: (CPU cpu) {
      Register.A.value |= (1 << 6);
    },
    0xf8: (CPU cpu) {
      Register.B.value |= (1 << 7);
    },
    0xf9: (CPU cpu) {
      Register.C.value |= (1 << 7);
    },
    0xfa: (CPU cpu) {
      Register.D.value |= (1 << 7);
    },
    0xfb: (CPU cpu) {
      Register.E.value |= (1 << 7);
    },
    0xfc: (CPU cpu) {
      Register.H.value |= (1 << 7);
    },
    0xfd: (CPU cpu) {
      Register.L.value |= (1 << 7);
    },
    0xfe: (CPU cpu) {
      ram[Register.HL.value] |= (1 << 7);
    },
    0xff: (CPU cpu) {
      Register.A.value |= (1 << 7);
    },
  };
  static int addWithFlagAdjust(dynamic dest, int b) {
    late final int destBytes;
    late final int a;

    if (dest is Register) {
      destBytes = dest.toString().split('Register.')[1].length > 1 ? 2 : 1;
      a = dest.value;
    } else if (dest is int) {
      destBytes = 1;
      a = dest;
    } else {
      throw Exception('Unexpected operand: $dest');
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
      destBytes = 1;
      a = dest;
    } else {
      throw Exception('Unexpected operand: $dest');
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
}
