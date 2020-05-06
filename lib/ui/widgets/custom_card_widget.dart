import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget childTitle;
  final Widget child;
  final Function overviewPressed;
  const CustomCardWidget({
    Key key,
    @required this.childTitle,
    @required this.child,
    this.overviewPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          childTitle,
          const SizedBox(
            height: 20,
          ),
          child,
          SizedBox(
            height: (overviewPressed != null) ? 10 : 20,
          ),
          if (overviewPressed != null) _buildButton()
        ],
      ),
    );
  }

  _buildButton() {
    return Column(
      children: <Widget>[
        Center(
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.blue,
            child: Text(
              'More Information',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
