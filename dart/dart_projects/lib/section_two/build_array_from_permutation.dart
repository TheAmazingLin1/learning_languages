List<int> buildArray(List<int> nums) {
  final res = <int>[];
  for (int i = 0; i < nums.length; i++) {
      res.add(nums[nums[i]]);
  }
  return res;
}
