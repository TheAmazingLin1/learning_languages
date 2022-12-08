import 'dart:math';
import 'dart:io';

void main() {
  final randomNumber = Random().nextInt(100);
  bool gameOver = false;
  int numberOfGuesses = 0;
  print("Input a number from 1 - 100");
  while(true) {
    final input = stdin.readLineSync();
    numberOfGuesses++;
    try {
      final parsedString = int.parse(input ?? "");
      if (parsedString <= 0 || parsedString > 100) {
        print("Enter a number between 1 and 100");
        continue;
      }
      if (parsedString < randomNumber) {
        print("Lower");
      } else if (parsedString > randomNumber) {
        print("Higher");
      } else {
        print("Congragulations the number was $randomNumber it took you $numberOfGuesses turns");
        return;
      }
    } catch (e) {
      print("input a valid number");
      continue;
    }
  }
}


