List<String> fizzBuzz(int lastValue) {
  final result = <String>[];

  for (int i = 1; i <= lastValue; i++) {
    final isDivisibleByThree = i % 3 == 0;
    final isDivisibleByFive = i % 5 == 0;
    if (isDivisibleByThree && isDivisibleByFive) {
      result.add("FizzBuzz");
    } else if (isDivisibleByThree) {
      result.add("Fizz");
    } else if (isDivisibleByFive) {
      result.add("Buzz");
    } else {
      result.add("$i");
    }
  }

  return result;
}
