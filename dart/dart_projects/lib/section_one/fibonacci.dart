int fibonacci(int value) {
  if (value <= 0) return 0;
  if (value == 1 || value == 2) return 1;
  var prevPrev = 1;
  var prev = 1;

  for (int i = 3; i <= value; i++) {
    var curr = prevPrev + prev;
    prevPrev = prev;
    prev = curr;
  }
  return prev;
}
