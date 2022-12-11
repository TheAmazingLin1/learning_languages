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
  int _centiSeconds = 0;
  int _seconds = 0;
  int _minutes = 0;
  int _hours = 0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (!_isRunning) return;
      setState(() {
        _centiSeconds++;
        if (_centiSeconds == 100) {
          _centiSeconds = 0;
          _seconds++;
        }
        if (_seconds == 60) {
          _seconds = 0;
          _minutes++;
        }
        if (_minutes == 60) {
          _minutes = 0;
          _hours++;
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
                "${_alwaysTwoDigits(_hours)}:${_alwaysTwoDigits(_minutes)}:${_alwaysTwoDigits(_seconds)}:${_alwaysTwoDigits(_centiSeconds)}",
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
                  _button(Colors.green, "Start", () {
                    setState(() {
                      _isRunning = true;
                    });
                  }),
                  const SizedBox(width: 10),
                  _button(Colors.red, "Stop", () {
                    setState(() {
                      _isRunning = false;
                    });
                  }),
                  const SizedBox(width: 10),
                  _button(Colors.blue, "Reset", () {
                    setState(() {
                      _centiSeconds = 0;
                      _hours = 0;
                      _minutes = 0;
                      _seconds = 0;
                    });
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
