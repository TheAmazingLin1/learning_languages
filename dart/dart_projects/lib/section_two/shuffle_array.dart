List<int> shuffleArray(List<int> array, int n) {
  return [for (int i = 0; i < n; i++) ...[array[i], array[i+n]]];
}
