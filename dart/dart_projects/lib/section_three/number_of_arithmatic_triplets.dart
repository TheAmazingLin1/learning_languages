int arithmeticTriplets(List<int> nums, int diff) {
    final numsSet = nums.toSet();
    int triplets = 0;
      for (int i = 0; i < nums.length; i++) {
          if (numsSet.contains(nums[i] + diff) && numsSet.contains(nums[i] + diff + diff)) triplets++;
      }
      return triplets;
}
