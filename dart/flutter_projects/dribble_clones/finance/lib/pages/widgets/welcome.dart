import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome(this.name, {super.key});
  final String name;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello David",
          style: textTheme.headlineMedium,
        ),
        Text(
          "Welcome Back !",
          style: textTheme.labelMedium,
        ),
      ],
    );
  }
}
