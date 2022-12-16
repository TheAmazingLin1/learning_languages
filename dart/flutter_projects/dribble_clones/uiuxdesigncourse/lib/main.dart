import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

const lightBlue = const Color(0xff63cdda);
const darkBlue = const Color(0xff3dc1d3);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: lightBlue,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(children: [
              Expanded(
                child: ButtonRow(),
              ),
              Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "UI/UX Design Course",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      )
                    ],
                  )),
              Flexible(flex: 6, child: CardContainer())
            ]),
          ),
        ),
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Button(Icons.arrow_back_outlined),
          Row(
            children: [
              Button(Icons.calendar_month),
              SizedBox(
                width: 10,
              ),
              Button(Icons.notifications),
            ],
          )
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button(this.icon, {super.key, this.color = darkBlue});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(CircleBorder()),
          backgroundColor: MaterialStatePropertyAll(color.withAlpha(100))),
      child: Container(
        alignment: Alignment.center,
        child: Icon(
          icon,
        ),
      ),
    );
  }
}

class CardContainer extends StatelessWidget {
  const CardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Column(
        children: [
          Expanded(child: Card(1, "UI/UX Design", "32 Minutes - 12 Dec")),
          Expanded(child: Card(1, "UI/UX Design", "32 Minutes - 12 Dec")),
          Expanded(child: Card(1, "UI/UX Design", "32 Minutes - 12 Dec")),
          Expanded(child: Card(1, "UI/UX Design", "32 Minutes - 12 Dec")),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card(this.number, this.title, this.subtitle, {super.key});
  final int number;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          "0$number",
        )),
        SizedBox(width: 10),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 5),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
        Expanded(
            child: Button(
          Icons.play_arrow,
          color: Color(0xffdfe4ea),
        )),
      ],
    );
  }
}
