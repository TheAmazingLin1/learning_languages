import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/game.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GameProvider())],
      child: MaterialApp(home: Game()),
    ),
  );
}

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

final darkGreen = Color(0xff27ae60);
final lightGreen = Color(0xff2ecc71);

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final gridWidth = width < 400 ? 300.0 : 600.0;
    return Scaffold(
      backgroundColor: darkGreen,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Container(
                width: gridWidth,
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Player: ${provider.playerScore}",
                      style: gridWidth == 300
                          ? Theme.of(context).textTheme.headline4
                          : Theme.of(context).textTheme.headline2,
                    ),
                    Text(
                      "CPU: ${provider.cpuScore}",
                      style: gridWidth == 300
                          ? Theme.of(context).textTheme.headline4
                          : Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ),
              Container(
                width: gridWidth,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    int x = 0;
                    if (index >= 3) x = 1;
                    if (index >= 6) x = 2;
                    return Piece(x, index - 3 * x);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Piece extends StatefulWidget {
  const Piece(this.x, this.y, {super.key});
  final int x;
  final int y;

  @override
  State<Piece> createState() => _PieceState();
}

class _PieceState extends State<Piece> {
  getStr(PosState state) {
    switch (state) {
      case PosState.o:
        return "O";
      case PosState.x:
        return "X";
      case PosState.unpressed:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);
    final state = provider.getState(widget.x, widget.y);
    final isPlayerTurn = provider.isPlayerTurn;

    final width = MediaQuery.of(context).size.width;
    final textStyle = width < 400
        ? Theme.of(context).textTheme.headline3
        : Theme.of(context).textTheme.headline3;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          if (!isPlayerTurn) return;
          if (state == PosState.unpressed) {
            provider.playMove(widget.x, widget.y, PosState.x);
          }
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: lightGreen,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Text(
            "${getStr(state)}",
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
