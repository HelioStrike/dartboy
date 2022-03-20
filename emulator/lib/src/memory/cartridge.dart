import 'dart:typed_data';

class Cartridge {
  Cartridge(this.rom) {
    print(getBytes(0x0100, 0x0103));
    entryPoint = getBytes(0x0100, 0x0103);
    nintendoLogo = getBytes(0x0104, 0x0133);
    title = getBytes(0x0134, 0x0143);
    manufacturerCode = getBytes(0x013f, 0x0142);
    cgbFlag = getByte(0x0143);
    newLicenseeCode = getAsciiStringFromBytes(0x0144, 0x0145);
    sgbFlag = getByte(0x0146);
    cartridgeType = getByte(0x0147);
    romSize = getByte(0x0148);
    ramSize = getByte(0x0149);
    destinationCode = getByte(0x014A);
    oldLicenseeCode = getByte(0x014B);
    maskRomVersionNumber = getByte(0x014C);
    headerChecksum = getByte(0x014D);
    globalChecksum = getIntFromBytes(0x014E, 0x14F);
  }

  /// Contains the entire cartridge data.
  late final Uint8List rom;

  /// (0100 - 0104)
  /// After displaying the Nintendo logo, the boot procedure jumps to this
  /// address, which then jumps to the actual main program in the cartridge.
  ///
  /// This 4 byte area usually contains a nop instruction, followed by a
  /// `jp $0150`.
  late final Uint8List entryPoint;

  /// (0104 - 0133)
  /// These bytes define the bitmap of the Nintendo logo.
  ///
  /// This is verified by the Nintendo boot procedure.
  late final Uint8List nintendoLogo;

  /// (0134 - 0143)
  /// Title of the game in uppercase ASCII.
  late final Uint8List title;

  /// (013f - 0142)
  late final Uint8List manufacturerCode;

  /// (0143)
  /// Checks whether the cartridge supports CGB functions.
  late final int cgbFlag;

  /// (0144 - 0145)
  /// Two character ASCII license code.
  late final String newLicenseeCode;

  /// (0146)
  /// Checks whether the cartridge supports SGB functions.
  late final int sgbFlag;

  /// (0147)
  /// Specifies which Memory Bank Controller (if any) is used in the cartridge,
  /// and if further external hardware exists.
  late final int cartridgeType;

  /// (0148)
  /// Specifies the ROM size of the cartridge.
  late final int romSize;

  /// (0149)
  /// Specifies the RAM size of the cartridge (if any).
  late final int ramSize;

  /// (014a)
  /// Specifies if this version of the game is supposed to be sold in Japan(00),
  /// or anywhere else(01).
  late final int destinationCode;

  /// (014b)
  /// Specifies thee game publisher code.
  ///
  /// [newLicenseeCode] must bee used if this value is $33.
  late final int oldLicenseeCode;

  /// (014c)
  /// Specifies the version number of thee game.
  late final int maskRomVersionNumber;

  /// (014d)
  /// Contains an 8 bit checksum across the cartridge header bytes (0134-014c).
  late final int headerChecksum;

  /// (014e - 014f)
  /// Contains a 16 bit checksum (upper byte first) across the whole cartridge
  /// ROM.
  late final int globalChecksum;

  int getByte(int pointer) => rom[pointer];

  Uint8List getBytes(int startPointer, endPointer) =>
      rom.sublist(startPointer, endPointer + 1);

  int getIntFromBytes(int startPointer, endPointer) {
    final bytes = getBytes(startPointer, endPointer);
    int ret = 0;
    for (final byte in bytes) {
      ret *= (1 << 8);
      ret += byte;
    }
    return ret;
  }

  String getAsciiStringFromBytes(int startPointer, endPointer) {
    return getBytes(startPointer, endPointer)
        .map((byte) => String.fromCharCode(byte))
        .join('');
  }
}
