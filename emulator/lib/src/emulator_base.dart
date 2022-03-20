export 'io/cartridge_reader.dart';

import 'package:emulator/src/io/cartridge_reader.dart';

import 'cpu/cpu.dart';

class Emulator {
  Emulator(String romPath) {
    final cartridge = CartridgeReader().read(romPath);
    CPU(cartridge).run();
  }
}
