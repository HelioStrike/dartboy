export 'io/cartridge_reader.dart';

import 'package:emulator/src/io/cartridge_reader.dart';

class Emulator {
  Emulator(String romPath) {
    CartridgeReader().read(romPath);
  }
}
