import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CaseInformationWidget extends StatelessWidget {
  final String content;
  const CaseInformationWidget({
    Key key,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: GoogleFonts.roboto(
        fontSize: ScreenUtil().setSp(30),
      ),
    );
  }
}
