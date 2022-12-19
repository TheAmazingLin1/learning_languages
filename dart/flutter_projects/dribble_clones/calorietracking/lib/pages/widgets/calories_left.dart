import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CaloriesLeft extends StatelessWidget {
  const CaloriesLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "341",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          "calories left",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black.withOpacity(0.6)),
        ),
      ],
    );
  }
}
