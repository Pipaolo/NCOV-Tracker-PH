import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicDataCardWidget extends StatelessWidget {
  final String title;
  final String svgPath;
  final String value;
  final Color color;
  const BasicDataCardWidget({
    Key key,
    @required this.title,
    @required this.svgPath,
    @required this.value,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 400.w,
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  value,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(70),
                    color: color ?? Colors.black,
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
