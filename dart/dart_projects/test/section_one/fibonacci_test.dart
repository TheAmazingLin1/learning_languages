import 'package:test/test.dart';
import 'package:dart_projects/section_one/fibonacci.dart';

void main() {
  test('3', () async {
    expect(fibonacci(3), 2);
  });

  test('10', () async {
    expect(fibonacci(10), 55);
  });

  test('0', () async {
    expect(fibonacci(0), 0);
  });

  test('-1', () async {
    expect(fibonacci(-1), 0);
  });
}
