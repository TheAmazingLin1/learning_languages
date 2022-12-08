import 'package:test/test.dart';
import 'package:dart_projects/section_two/running_sum_of_array.dart';

void main() {
  test('normal integer array', () async {
    expect(runningSum([1,2,3,4]), [1,3,6,10]);
  });
}
