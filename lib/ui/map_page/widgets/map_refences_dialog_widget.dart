import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MapReferencesDialogWidget extends StatelessWidget {
  const MapReferencesDialogWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(600),
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
            'Reference',
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
                      'The data that is shown here is from https://endcov.ph a webapp that tracks the current situation in the Philippines. They provide realtime updates in the country so please check their website for more information.',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'I do not claim nor own the data at hand.',
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
