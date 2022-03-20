import 'package:args/args.dart';
import 'package:emulator/emulator.dart';

void main(List<String> args) {
  final parsedArgs = parseArgs(args);

  Emulator(parsedArgs['rom_path']);
}

ArgResults parseArgs(List<String> args) {
  var parser = ArgParser();
  parser.addOption('rom_path', mandatory: true);
  return parser.parse(args);
}
