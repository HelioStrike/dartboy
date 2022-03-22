part 'instructions.g.dart';

class Instructions {
  static final Map<int, Function> opcodeToFunction = {0x00: _nop};

  static void _nop() {}
}
