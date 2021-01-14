import 'package:expensee/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StiffFeature extends StatefulWidget {
  @override
  _StiffFeatureState createState() => _StiffFeatureState();
}

class _StiffFeatureState extends State<StiffFeature> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Expenses on',
          style: TextStyle(color: Colors.blueGrey, fontSize: 16),
        ),
        Container(
          height: 30,
          width: 50,
          decoration: BoxDecoration(
            color: kDarkerGreyColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: FittedBox(
              child: Text(
                DateFormat.MEd().format(now).substring(0, 3),
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
