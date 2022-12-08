import 'package:test/test.dart';
import 'package:dart_projects/section_two/build_array_from_permutation.dart';

void main() {
  test('first case', () async {
    expect(buildArray([0,2,1,5,3,4]), [0,1,2,4,5,3]);
  });
  test('second case', () async {
    expect(buildArray([5,0,1,2,3,4]), [4,5,0,1,2,3]);
  });
}
