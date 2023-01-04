import 'package:flutter/material.dart';

class SaleCard extends StatelessWidget {
  const SaleCard(this.icon, this.amount, this.description, this.color,
      {super.key});
  final IconData icon;
  final String amount;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onPrimary = theme.colorScheme.onPrimaryContainer;
    return Expanded(
      child: Container(
        height: 200,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: onPrimary,
              size: 30,
            ),
            SizedBox(height: 10),
            Text(
              amount,
              style: theme.textTheme.displaySmall?.copyWith(color: onPrimary),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: theme.textTheme.bodyMedium?.copyWith(color: onPrimary),
            )
          ],
        ),
      ),
    );
  }
}
