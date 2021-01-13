import 'package:expensee/constants.dart';
import 'package:flutter/material.dart';

class ColoredDistinguishers extends StatelessWidget {
  const ColoredDistinguishers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: kDarkerGreyColor,
                ),
              ),
              Text(
                'Balance',
                style: TextStyle(color: Colors.blueGrey),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: kprimaryColor,
                ),
              ),
              Text(
                'Spending',
                style: TextStyle(color: Colors.blueGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
