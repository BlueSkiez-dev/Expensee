import 'package:expensee/constants.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double totalSpending;

  ChartBar(this.label, this.spendingAmount, this.totalSpending);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text(
              '\$${spendingAmount.toStringAsFixed(0)}',
              style: TextStyle(color: Colors.blueGrey, fontSize: 8),
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 90,
          width: 20,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: kDarkerGreyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: totalSpending,
                child: Container(
                  decoration: BoxDecoration(
                    color: kprimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.blueGrey),
        ),
      ],
    );
  }
}
