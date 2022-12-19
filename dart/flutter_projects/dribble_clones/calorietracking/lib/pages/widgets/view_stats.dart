import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ViewStats extends StatelessWidget {
  const ViewStats({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Color(0xffbdc3c7).withAlpha(100),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        elevation: MaterialStatePropertyAll(0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "View Stats",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
