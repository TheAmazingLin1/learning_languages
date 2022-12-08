import 'package:test/test.dart';
import 'package:dart_projects/section_two/shuffle_array.dart';

void main() {
  test('', () async {
    expect(shuffleArray([2,5,1,3,4,7], 3),[2,3,5,4,1,7]);
  });
  test('', () async {
    expect(shuffleArray([1,2,3,4,4,3,2,1], 4),[1,4,2,3,3,2,4,1]);
  });
}
