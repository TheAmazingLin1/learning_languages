import 'package:flutter/material.dart';

class CaloriesToday extends StatelessWidget {
  const CaloriesToday(this.caloriesToday, {super.key});
  final int caloriesToday;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$caloriesToday",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "CALORIES TODAY",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size(120, 120)),
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            elevation: MaterialStatePropertyAll(20),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          child: Center(
            child: Icon(
              Icons.add,
              size: 40,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
