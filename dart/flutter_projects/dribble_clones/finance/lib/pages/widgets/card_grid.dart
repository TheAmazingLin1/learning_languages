import 'package:finance/pages/widgets/sale_card.dart';
import 'package:flutter/material.dart';

class CardGrid extends StatelessWidget {
  const CardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SaleCard(
              Icons.point_of_sale,
              "200K",
              "Sales",
              Colors.red.shade100,
            ),
            SizedBox(width: 20),
            SaleCard(
              Icons.account_circle_sharp,
              "8.549K",
              "Customers",
              Colors.green.shade100,
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            SaleCard(
              Icons.point_of_sale,
              "1.423K",
              "Products",
              Colors.yellow.shade100,
            ),
            SizedBox(width: 20),
            SaleCard(
              Icons.point_of_sale,
              "\$8745",
              "Revenue",
              Colors.orange.shade100,
            ),
          ],
        ),
      ],
    );
  }
}
