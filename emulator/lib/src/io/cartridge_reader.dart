import 'dart:io';

import 'package:emulator/src/memory/cartridge.dart';

/// Reads the game cartridge.
class CartridgeReader {
  CartridgeReader();

  Cartridge read(String romPath) {
    return Cartridge(File(romPath).readAsBytesSync());
  }
}
