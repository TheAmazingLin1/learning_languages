int sumSquareDifference(int value) {
  return sumSquared(value) - squaredSum(value);
}

int squaredSum(int value) {
  int squaredSum = 0;
  for (int i = 1; i <= value; i++) {
    squaredSum += i*i;
  }
  return squaredSum;
}

int sumSquared(int value) {
  int sum = 0;
  for (int i = 1; i <= value; i++) {
    sum += i;
  }
  return sum * sum;
}
