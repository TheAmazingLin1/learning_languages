import 'package:flutter/material.dart';

const light = false;

final baseTheme = light
    ? ThemeData.light(useMaterial3: true)
    : ThemeData.dark(useMaterial3: true);

final colorScheme = baseTheme.colorScheme;

final customTheme = baseTheme.copyWith(
  colorScheme: colorScheme,
  textTheme: textTheme(light: light),
  checkboxTheme: checkBoxTheme(),
  inputDecorationTheme: inputDecorationTheme(),
);

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    border: OutlineInputBorder(),
  );
}

CheckboxThemeData checkBoxTheme() {
  return CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
    side: BorderSide(
      width: 1,
      color: colorScheme.background,
    ),
    fillColor: MaterialStateProperty.all(baseTheme.scaffoldBackgroundColor),
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
