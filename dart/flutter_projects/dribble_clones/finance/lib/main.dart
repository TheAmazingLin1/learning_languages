import 'package:finance/pages/home.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        textTheme: textTheme(light: false),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
      ),
      home: Home(),
    ),
  );
}

TextTheme textTheme({bool light = true}) {
  final color = light ? Colors.black : Colors.white;
  return TextTheme(
    displayLarge: TextStyle(color: color),
    displayMedium: TextStyle(color: color),
    displaySmall: TextStyle(color: color),
    headlineLarge: TextStyle(color: color),
    headlineMedium: TextStyle(color: color),
    headlineSmall: TextStyle(color: color),
    titleLarge: TextStyle(color: color),
    titleMedium: TextStyle(color: color),
    titleSmall: TextStyle(color: color),
    labelLarge: TextStyle(color: color),
    labelMedium: TextStyle(color: color),
    labelSmall: TextStyle(color: color),
    bodyLarge: TextStyle(color: color),
    bodyMedium: TextStyle(color: color),
    bodySmall: TextStyle(color: color),
  );
}
