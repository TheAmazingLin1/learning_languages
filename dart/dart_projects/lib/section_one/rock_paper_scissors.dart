import 'dart:math';
import 'dart:io';

int playerScore = 0;
int cpuScore = 0;

void main() {

  while(true) {
    print("Score: Cpu $cpuScore - $playerScore Player");
    final cpuChoice = getCpuChoice();
    print("Please pick r, p, s");
    final playerChoice = stdin.readLineSync() ?? "";

    if (!validPlayerChoice(playerChoice)) {
      print("Invalid choice");
      continue;
    }
    play(playerChoice, cpuChoice);
  }
}

play(String playerChoice, String cpuChoice) {
    switch (playerChoice) {
      case "r":
        if (cpuChoice == "r") {
          print("Tie");
          playerScore++;
          cpuScore++;
        } else if (cpuChoice == "p") {
          print("CPU chose paper you lose");
          cpuScore++;
        } else if (cpuChoice == "s") {
          print("CPU chose scissors you win");
          playerScore++;
        }
        break;
      case "p":
        if (cpuChoice == "p") {
          print("Tie");
          playerScore++;
          cpuScore++;
        } else if (cpuChoice == "r") {
          print("CPU chose rock you win");
          playerScore++;
        } else if (cpuChoice == "s") {
          print("CPU chose scissors you lose");
          cpuScore++;
        }
        break;
      case "s":
        if (cpuChoice == "s") {
          print("Tie");
          playerScore++;
          cpuScore++;
        } else if (cpuChoice == "r") {
          print("CPU chose rock you lose");
          cpuScore++;
        } else if (cpuChoice == "p") {
          print("CPU chose scissors you win");
          playerScore++;
        }
        break;
    }
}


bool validPlayerChoice(String choice) {
  return choice == "r" || choice == "p" || choice == "s";
}

String getCpuChoice() {
  int choice = Random().nextInt(3);

  switch(choice) {
    case 0:
      return "r";
    case 1:
      return "p";
    case 2:
      return "s";
  }

  return "";
}
