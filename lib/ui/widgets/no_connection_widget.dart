import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/images/error.svg',
              height: 150,
            ),
            Text(
              'You have no internet connection, the app will automatically refresh itself once it detects a stable connection.',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(35),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
