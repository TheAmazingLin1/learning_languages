import 'package:test/test.dart';
import 'package:dart_projects/section_one/smallest_multiple.dart';

void main() {
  test('10', () async {
    expect(smallestMultiple(10), 2520);
  });

  test('20', () async {
    expect(smallestMultiple(20), 232792560);
  });
}


