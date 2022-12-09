List<int> smallerNumbersThanCurrent(List<int> nums) {
    final sortedArray = [...nums];
    sortedArray.sort();

    final numbersSmaller = <int, int>{};
    for (int i = 0; i < sortedArray.length; i++) {
        if (i != 0 && sortedArray[i] == sortedArray[i - 1]) continue;
        numbersSmaller[sortedArray[i]] = i;
    }

    return [for (int i = 0; i < nums.length; i++) numbersSmaller[nums[i]] ?? 0];
}
