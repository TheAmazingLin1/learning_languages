import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int centiSeconds = 0;
  int seconds = 0;
  int minutes = 0;
  int hours = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        centiSeconds++;
        if (centiSeconds == 100) {
          centiSeconds = 0;
          seconds++;
        }
        if (seconds == 60) {
          seconds = 0;
          minutes++;
        }
        if (minutes == 60) {
          minutes = 0;
          hours++;
        }
      });
    });
  }

  String _alwaysTwoDigits(int number) {
    return number < 9 ? "0$number" : "$number";
  }

  TextButton _button(
      Color backgroundColor, String text, Function()? onPressed) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "${_alwaysTwoDigits(hours)}:${_alwaysTwoDigits(minutes)}:${_alwaysTwoDigits(seconds)}:${_alwaysTwoDigits(centiSeconds)}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _button(Colors.green, "Start", () {}),
                  const SizedBox(width: 10),
                  _button(Colors.red, "Stop", () {}),
                  const SizedBox(width: 10),
                  _button(Colors.blue, "Reset", () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
