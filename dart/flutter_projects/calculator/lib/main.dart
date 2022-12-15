import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CalculatorProvider())
      ],
      child: MaterialApp(
        home: Calculator(),
      ),
    ),
  );
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.white, width: 10)),
          child: Column(
            children: [
              Flexible(
                child: Display(),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: NumPad(),
                    ),
                    Flexible(
                      child: Operators(),
                    )
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Provider.of<CalculatorProvider>(context).clear();
                  },
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: Text("Clear"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Operators extends StatelessWidget {
  const Operators({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Flexible(child: Dial("/", Colors.orange)),
      Flexible(child: Dial("+", Colors.orange)),
      Flexible(child: Dial("x", Colors.orange)),
      Flexible(child: Dial("-", Colors.orange)),
    ]);
  }
}

class NumPad extends StatelessWidget {
  const NumPad({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: 300,
        child: GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.78,
          ),
          children: [
            InkWell(
              onTap: () {},
              child: Dial("7", Colors.white),
            ),
            Dial("8", Colors.white),
            Dial("9", Colors.white),
            Dial("4", Colors.white),
            Dial("5", Colors.white),
            Dial("6", Colors.white),
            Dial("1", Colors.white),
            Dial("2", Colors.white),
            Dial("3", Colors.white),
            Dial(".", Colors.white),
            Dial("1", Colors.white),
            Dial("=", Colors.white),
          ],
        ),
      );
    });
  }
}

class Dial extends StatelessWidget {
  const Dial(this.text, this.color, {super.key});
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);
    return InkWell(
      onTap: () {
        provider.keyPress(text);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 0.2),
          color: color,
        ),
        child: Text(text),
      ),
    );
  }
}

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(8),
      alignment: Alignment.centerRight,
      child: Text(
        "${provider.current}",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
