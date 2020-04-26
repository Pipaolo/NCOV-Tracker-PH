import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicDataCardWidget extends StatelessWidget {
  final String title;
  final String svgPath;
  final int currentValue;
  final int prevValue;
  final Color color;
  const BasicDataCardWidget({
    Key key,
    @required this.title,
    @required this.svgPath,
    @required this.currentValue,
    @required this.prevValue,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percentageIncreased = (prevValue != 0)
        ? (((currentValue - prevValue) / (prevValue)) * 100).toStringAsFixed(2)
        : 0;
    final valueIncreased = (prevValue != 0) ? currentValue - prevValue : 0;

    return Card(
      child: Container(
        width: 400.w,
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: AutoSizeText(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: ScreenUtil().setSp(70),
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  svgPath,
                  width: 50,
                ),
                const SizedBox(
                  width: 10,
                ),
                AutoSizeText(
                  currentValue.toString(),
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(70),
                    color: color ?? Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AutoSizeText(
                  "+ $valueIncreased ( $percentageIncreased )",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setSp(30),
                    color: (title.contains('Recovered'))
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
