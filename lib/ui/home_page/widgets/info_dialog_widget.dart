import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoDialogWidget extends StatelessWidget {
  const InfoDialogWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(700),
      width: ScreenUtil().setWidth(600),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Text(
            'About Me',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(40),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Made by Paolo Matthew G. Tolentino',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Purpose: This app was made for those people who do not own televisions but has access to the internet.',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'References: \nDepartment of Health NCOV Tracker Website: https://ncovtracker.doh.gov.ph/\nENDCOV PH Website: https://endcov.ph/\n\nThe Icons are from icons8.com and flaticons.com special thanks to them for creating beautiful icons.',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '* I do not own nor claim the data at hand *',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
