import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo2/utils/date_time_helper.dart';

class DayPicker extends StatelessWidget {
  const DayPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.background;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: secondaryColor,
            size: 20,
          ),
        ),
        SizedBox(width: 30),
        Column(
          children: [
            Text(
              "${getWeekday()}",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              "${getDateString()}",
              style: TextStyle(
                color: secondaryColor,
              ),
            )
          ],
        ),
        SizedBox(width: 30),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_ios,
            color: secondaryColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
