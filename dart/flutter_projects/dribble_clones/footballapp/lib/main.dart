// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    ),
  );
}

const darkGrey = Color(0xff2f3542);
const lightGrey = Color(0xff57606f);
const lighterGrey = Color(0xff747d8c);
const bayernImageUrl =
    "https://img.fcbayern.com/image/upload/q_auto,f_auto/cms/public/images/fcbayern-com/logos/bundesliga/480px-logo_fc_bayern_munchen.svg.png";
const germanyImageUrl =
    "https://flagpoles.co.uk/wp-content/uploads/2019/06/Germany.png";

class Team {
  final String name;
  final String imageUrl;
  const Team(this.name, this.imageUrl);
}

final teams = <Team>[
  Team("Barcelona",
      "https://logos-world.net/wp-content/uploads/2020/04/Barcelona-Logo.png"),
  Team("Dortmund",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Borussia_Dortmund_logo.svg/1200px-Borussia_Dortmund_logo.svg.png")
];

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrey,
      body: Column(
        children: [
          Flexible(
            flex: 4,
            child: Following(),
          ),
          TeamCardRow(),
          TextRow(),
          SuggestedRow(),
        ],
      ),
    );
  }
}

class Following extends StatelessWidget {
  const Following({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightGrey,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Edit",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 10),
              Icon(
                color: Colors.white,
                Icons.add,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Following",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: FollowingButton("Teams")),
              SizedBox(width: 10),
              Expanded(child: FollowingButton("Players")),
            ],
          ),
        ],
      ),
    );
  }
}

class FollowingButton extends StatelessWidget {
  const FollowingButton(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(lighterGrey),
        elevation: MaterialStatePropertyAll(0),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text("Teams"),
      ),
    );
  }
}

class TeamCard extends StatelessWidget {
  const TeamCard(this.name, this.imageUrl, this.against, this.date,
      {super.key});
  final String imageUrl;
  final String name;
  final String against;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              child: Image.network(imageUrl),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Flexible(child: Container()),
              ],
            ),
            SizedBox(height: 8),
            Text(against),
            SizedBox(height: 5),
            Text(date),
          ],
        ),
      ),
    );
  }
}

class TeamCardRow extends StatelessWidget {
  const TeamCardRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Flexible(
        flex: 5,
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: TeamCard(
                  "Bayern Munchen",
                  bayernImageUrl,
                  "Salzburg",
                  "Fri, 13 Jan, 15:00",
                ),
              ),
              Expanded(
                child: TeamCard(
                  "Germany",
                  germanyImageUrl,
                  "Unknown",
                  "Unknown",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  const TextRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "SUGGESTED",
            style: TextStyle(color: Colors.yellow),
          ),
          Text(
            "Dont show again",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class SuggestedRow extends StatelessWidget {
  const SuggestedRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 12,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  for (final team in teams)
                    Column(
                      children: [
                        SuggestedCard(team.name, team.imageUrl),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SuggestedCard extends StatelessWidget {
  const SuggestedCard(this.name, this.imageUrl, {super.key});
  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                child: Image.network(imageUrl),
              ),
              SizedBox(width: 10),
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStatePropertyAll(0),
                backgroundColor: MaterialStatePropertyAll(lighterGrey),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Follow",
                  style: TextStyle(color: Colors.yellow),
                ),
              ))
        ],
      ),
    );
  }
}
