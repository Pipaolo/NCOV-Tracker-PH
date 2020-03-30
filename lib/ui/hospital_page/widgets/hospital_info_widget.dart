import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HospitalInfoWidget extends StatelessWidget {
  final String infoType;
  final String infoContents;
  const HospitalInfoWidget({
    Key key,
    @required this.infoType,
    @required this.infoContents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            infoType,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(40),
              color: Colors.white,
            ),
          ),
        ),
        Center(
          child: Text(
            infoContents,
            style: GoogleFonts.montserrat(
              fontSize: ScreenUtil().setSp(30),
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
