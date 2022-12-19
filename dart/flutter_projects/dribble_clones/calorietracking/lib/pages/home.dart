import 'package:flutter/material.dart';

import 'widgets/calories_left.dart';
import 'widgets/calories_today.dart';
import 'widgets/top_row.dart';
import 'widgets/view_stats.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  final caloriesToday = 1259;

  final bondFont = const TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 730,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Colors.orange,
                              Colors.yellow,
                              Colors.lightGreen,
                            ])),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TopRow(),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  child: Divider(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CaloriesToday(caloriesToday),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 40),
                                      child: CaloriesLeft(),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("200", style: bondFont),
                                        Text("400", style: bondFont),
                                        Text("600", style: bondFont),
                                        Text("800", style: bondFont),
                                        Text("1000", style: bondFont),
                                        Text("1200", style: bondFont),
                                        Text("1400", style: bondFont),
                                        Text("1600", style: bondFont),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ViewStats(),
          ],
        ),
      ),
    );
  }
}
