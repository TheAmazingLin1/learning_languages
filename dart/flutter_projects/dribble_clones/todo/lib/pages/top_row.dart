import 'package:flutter/material.dart';

class TopRow extends StatelessWidget {
  const TopRow({super.key});

  static const month = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  static const day = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "${today.day}",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(width: 5),
            Column(
              children: [
                Text("${month[today.month - 1]}"),
                Text(
                  "${today.year}",
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ],
        ),
        Text(
          "${day[today.weekday - 1]}".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(.6),
          ),
        ),
      ],
    );
  }
}
