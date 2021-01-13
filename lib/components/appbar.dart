import 'package:expensee/constants.dart';
import 'package:flutter/material.dart';

class NotsoAppbarish extends StatelessWidget {
  const NotsoAppbarish({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,',
              style: TextStyle(color: kDarkColor, fontSize: 18),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'Johnie',
              style: TextStyle(
                  color: kDarkColor, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.history),
          onPressed: null,
          color: kDarkerGreyColor,
          iconSize: 35,
        )
      ],
    );
  }
}
