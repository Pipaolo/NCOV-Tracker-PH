import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdatedStatisticsCardWidget extends StatelessWidget {
  final String title;
  final int currentValue;
  final int prevValue;
  final int amountChanged;
  final Color increasedColor;
  final Color decreasedColor;
  const UpdatedStatisticsCardWidget({
    Key key,
    this.title,
    this.currentValue,
    this.prevValue,
    this.amountChanged,
    this.increasedColor,
    this.decreasedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(40),
              ),
            ),
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: <Widget>[
                Text.rich(
                  TextSpan(text: currentValue.toString(), children: [
                    TextSpan(
                      text: '\n$prevValue',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(30),
                        color: (amountChanged > 0)
                            ? increasedColor
                            : decreasedColor,
                      ),
                    ),
                  ]),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(55),
                  ),
                ),
                Positioned(
                  right: -50,
                  bottom: 23,
                  child: Row(
                    children: <Widget>[
                      FaIcon(
                        (amountChanged > 0)
                            ? FontAwesomeIcons.longArrowAltUp
                            : FontAwesomeIcons.longArrowAltDown,
                        size: ScreenUtil().setSp(50),
                      ),
                      Text(
                        (amountChanged > 0)
                            ? amountChanged.toString()
                            : (-1 * amountChanged).toString(),
                        style: GoogleFonts.montserrat(
                          color: (amountChanged > 0)
                              ? increasedColor
                              : decreasedColor,
                          fontSize: ScreenUtil().setSp(30),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
