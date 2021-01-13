import 'package:expensee/constants.dart';
import 'package:flutter/material.dart';

class StiffFeature extends StatelessWidget {
  const StiffFeature({
    Key key,
  }) : super(key: key);

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
            child: Text(
              'Feb 12',
              style: TextStyle(color: Colors.blueGrey),
            ),
          ),
        ),
      ],
    );
  }
}
