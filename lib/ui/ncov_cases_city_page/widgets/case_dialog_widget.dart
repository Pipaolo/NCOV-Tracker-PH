import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ncov_tracker_ph/data/models/ncov_infected.dart';

class CaseDialogWidget extends StatelessWidget {
  final NcovInfected ncovInfected;
  const CaseDialogWidget({Key key, this.ncovInfected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(625),
      width: ScreenUtil().setWidth(600),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: ScreenUtil().setHeight(450),
              width: ScreenUtil().setWidth(600),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Age: ${ncovInfected.age}',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                      ),
                    ),
                    Text(
                      'Sex: ${ncovInfected.gender}',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                      ),
                    ),
                    Text(
                      'Nationality: ${ncovInfected.nationality}',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                      ),
                    ),
                    Text(
                      'Residence: ${ncovInfected.residence}',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                      ),
                    ),
                    Text(
                      'Travel History: ${ncovInfected.travelHistory}',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                      ),
                    ),
                    Text(
                      'Date Confirmation: ${(ncovInfected.date.replaceAll(' ', '').isEmpty) ? 'For Validation' : ncovInfected.date}',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                      ),
                    ),
                    Text(
                      'Facility of Admission: ${ncovInfected.facility}',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildHeader(),
        ],
      ),
    );
  }

  _buildHeader() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: ScreenUtil().setHeight(180),
        width: ScreenUtil().setWidth(180),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueAccent,
        ),
        child: Center(
          child: Text(
            ncovInfected.phMasterList,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(35),
            ),
          ),
        ),
      ),
    );
  }
}
