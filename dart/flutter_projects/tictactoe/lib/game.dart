import 'dart:math';

import 'package:flutter/material.dart';

enum PosState {
  x,
  o,
  unpressed,
}

class GameProvider extends ChangeNotifier {
  var _game = <List<PosState>>[
    for (int i = 0; i < 3; i++)
      [
        PosState.unpressed,
        PosState.unpressed,
        PosState.unpressed,
      ]
  ];
  var _isPlayerTurn = true;
  var _cpuScore = 0;
  var _playerScore = 0;
  var _emptyPositions = 9;

  bool get isPlayerTurn => _isPlayerTurn;
  int get cpuScore => _cpuScore;
  int get playerScore => _playerScore;

  resetBoard() {
    _emptyPositions = 9;
    _game = [
      for (int i = 0; i < 3; i++)
        [
          PosState.unpressed,
          PosState.unpressed,
          PosState.unpressed,
        ]
    ];
    notifyListeners();
  }

  playMove(int x, int y, PosState state) {
    _game[x][y] = state;
    _emptyPositions--;
    if (checkIfWon(state)) {
      _playerScore++;
      resetBoard();
      notifyListeners();
      return;
    }
    // If there are no moves left it's a draw
    if (_emptyPositions == 0) {
      resetBoard();
      notifyListeners();
      return;
    }

    playMoveCpu();
    // if CPU won
    if (checkIfWon(PosState.o)) {
      _cpuScore++;
      resetBoard();
      notifyListeners();
      return;
    }

    notifyListeners();
  }

  playMoveCpu() {
    while (true) {
      int x = Random().nextInt(3);
      int y = Random().nextInt(3);
      if (_game[x][y] != PosState.unpressed) continue;
      _game[x][y] = PosState.o;
      _emptyPositions--;
      notifyListeners();
      break;
    }
  }

  bool checkIfWon(PosState state) {
    // Check left to right
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (_game[i][j] != state) break;
        if (j == 2) return true;
      }
    }
    // Check up and down
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (_game[j][i] != state) break;
        if (j == 2) {
          return true;
        }
      }
    }
    if (_game[1][1] != state) return false;
    if (_game[0][0] == state && _game[2][2] == state) return true;
    if (_game[0][2] == state && _game[2][0] == state) return true;
    return false;
  }

  PosState getState(int x, int y) {
    return _game[x][y];
  }
}
