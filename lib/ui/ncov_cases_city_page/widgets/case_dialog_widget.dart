import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ncov_tracker_ph/data/models/patient.dart';

class CaseDialogWidget extends StatelessWidget {
  final Patient patient;
  const CaseDialogWidget({Key key, this.patient}) : super(key: key);

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
                      'Age: ${(patient.age == 0) ? 'For Validation' : patient.age}',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                      ),
                    ),
                    Text(
                      'Sex: ${patient.sex}',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Symptoms: ',
                          style: GoogleFonts.roboto(
                            fontSize: ScreenUtil().setSp(30),
                          ),
                        ),
                        Container(
                          child: Text(
                            patient.symptoms,
                            style: GoogleFonts.roboto(
                              fontSize: ScreenUtil().setSp(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Nationality: ${patient.nationality}',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                      ),
                    ),
                    Text(
                      'Residence: ${patient.residenceCity}',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                      ),
                    ),
                    Text(
                      'Travel History: ${patient.travelHistory}',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                      ),
                    ),
                    Text(
                      'Date Confirmation: ${patient.confirmedDate}',
                      style: GoogleFonts.roboto(
                        fontSize: ScreenUtil().setSp(30),
                      ),
                    ),
                    Text(
                      'Facility of Admission: ${patient.admittedTo}',
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
            patient.caseNumber,
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
