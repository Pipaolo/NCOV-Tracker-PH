import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:ncov_tracker_ph/data/models/patient.dart';
import 'package:ncov_tracker_ph/ui/ncov_cases_city_page/widgets/case_information_widget.dart';

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
                    CaseInformationWidget(
                      content:
                          'Age: ${(patient.age == 0) ? 'For Validation' : patient.age}',
                    ),
                    CaseInformationWidget(
                      content: 'Sex: ${patient.sex}',
                    ),
                    CaseInformationWidget(
                      content: 'Residence: ${patient.residence.city}',
                    ),
                    CaseInformationWidget(
                      content:
                          'Date Confirmation: ${DateFormat('MMM dd, yyyy').format(DateTime.parse(patient.dateReportConfirmed))}',
                    ),
                    CaseInformationWidget(
                      content:
                          'Is admitted: ${(patient.admitted) ? 'yes' : 'no'}',
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
