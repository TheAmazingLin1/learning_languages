import 'package:finance/pages/widgets/card_grid.dart';
import 'package:finance/pages/widgets/sale_card.dart';
import 'package:finance/pages/widgets/top_row.dart';
import 'package:finance/pages/widgets/welcome.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onPrimary = theme.colorScheme.onPrimary;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: ""),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopRow(),
            const SizedBox(height: 80),
            const Welcome("David"),
            SizedBox(height: 100),
            Expanded(child: CardGrid()),
          ],
        ),
      ),
    );
  }
}
