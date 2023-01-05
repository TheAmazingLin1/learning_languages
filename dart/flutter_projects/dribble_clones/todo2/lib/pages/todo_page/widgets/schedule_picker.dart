import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SchedulePicker extends StatelessWidget {
  const SchedulePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        padding: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Day"),
            Text("Week"),
            Text("Month"),
            Text("Year"),
          ],
        ),
      ),
    );
  }
}
