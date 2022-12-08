import 'package:dart_projects/section_one/binary_to_decimal.dart';
import 'package:test/test.dart';

void main() {
  test('0x13', () async {
    expect(binaryToDecimal("00010011"),"0x13");
  });
  test('0xFF', () async {
    expect(binaryToDecimal("11111111"),"0xFF");
  });
  test('0xF0', () async {
    expect(binaryToDecimal("11110000"),"0xF0");
  });
  test('0xAB', () async {
    expect(binaryToDecimal("10101011"),"0xAB");
  });
}
