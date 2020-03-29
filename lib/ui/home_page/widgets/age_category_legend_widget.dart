import 'package:flutter/material.dart';

class AgeCategoryLegendWidget extends StatelessWidget {
  final Color leftBarColor;
  final Color rightBarColor;
  const AgeCategoryLegendWidget(
      {Key key, this.leftBarColor, this.rightBarColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 10,
                    width: 10,
                    color: rightBarColor,
                  ),
                  Text('Male'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 10,
                  width: 10,
                  color: leftBarColor,
                ),
                Text('Female'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
