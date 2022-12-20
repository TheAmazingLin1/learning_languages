import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/pages/widgets/todo_page.dart';

import 'providers/todo_provider.dart';

void main(List<String> args) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => TodoPage(),
        },
        initialRoute: '/',
      ),
    ),
  );
}
