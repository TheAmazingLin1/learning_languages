import 'package:dart_projects/section_one/fizz_buzz.dart';
import 'package:test/test.dart';

void main() {
  test('5', () async {
    expect(fizzBuzz(5), ["1", "2", "Fizz", "4", "Buzz"]);
  });
  test('15', () async {
    expect(fizzBuzz(15), [
      "1",
      "2",
      "Fizz",
      "4",
      "Buzz",
      "Fizz",
      "7",
      "8",
      "Fizz",
      "Buzz",
      "11",
      "Fizz",
      "13",
      "14",
      "FizzBuzz"
    ]);
  });
}
