import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DOHEmergencyDialogWidget extends StatelessWidget {
  const DOHEmergencyDialogWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(400),
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
            'Emergency Hotline',
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text.rich(
                      TextSpan(
                        text: 'Nationwide Callers',
                        children: [
                          TextSpan(
                            text: '\n02-894-26843',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(50),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(30),
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text.rich(
                      TextSpan(
                        text: '\nFor PLDT, SMART, SUN, and TNT Subscribers',
                        children: [
                          TextSpan(
                            text: '\n1555'.toUpperCase(),
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(50),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(30),
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
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
