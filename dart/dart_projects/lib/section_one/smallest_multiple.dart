int smallestMultiple(int range) {
  for (int i = 1 ; i < 1000000000; i++) {
    for (int j = 1;j <= range; j++) {
      if (i % j != 0) break;
      if (j == range) return i;
    }
  }
  return -1;
}
