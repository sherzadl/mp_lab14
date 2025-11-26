import 'package:flutter_test/flutter_test.dart';
import 'package:mp_lab14/calculator.dart';

void main() {
  group('Calculator.add()', () {
    final calculator = Calculator();

    test('adds numbers correctly', () {
      expect(calculator.add(2, 3), 5);
      expect(calculator.add(-4, -6), -10);
      expect(calculator.add(10, -7), 3);
      expect(calculator.add(9, 0), 9);
      expect(calculator.add(0, 0), 0);
    });
  });
}
