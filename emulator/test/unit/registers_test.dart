import 'package:emulator/src/cpu/registers.dart';
import 'package:test/test.dart';

void main() {
  group('Register', () {
    test('.value getters and setters work for 8-bit registers.', () {
      Register.A.value = 10;
      expect(Register.A.value, 10);
      Register.B.value = 10;
      expect(Register.B.value, 10);
    });

    test(
        '.value getters and setters for 16-bit registers modify comprising '
        '8-bit registers, and vice versa.', () {
      final val = 1111;
      Register.BC.value = val;

      // 4*256 + 87 = 1111
      expect(Register.BC.value, val);
      expect(Register.B.value, 4);
      expect(Register.C.value, 87);

      // 100*256 + 87 = 25687
      Register.B.value = 100;
      expect(Register.BC.value, 25687);
    });
  });
}
