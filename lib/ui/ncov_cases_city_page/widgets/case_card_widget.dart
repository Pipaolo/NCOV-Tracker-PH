import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ncov_tracker_ph/data/models/patient.dart';

import 'case_dialog_widget.dart';

class CaseCardWidget extends StatelessWidget {
  final Patient patient;
  const CaseCardWidget({
    Key key,
    @required this.patient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  child: CaseDialogWidget(patient: patient),
                );
              });
        },
        child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Case ID: ',
                  style: GoogleFonts.raleway(
                    fontSize: ScreenUtil().setSp(30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AutoSizeText(
                    patient.caseNumber,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(60),
                    ),
                    maxLines: 1,
                  ),
                ),
                Chip(
                  label: Text(
                    (patient.removalType == 'For Validation')
                        ? 'ACTIVE CASE'
                        : patient.removalType,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  backgroundColor: patient.removalType.contains('DIED')
                      ? Colors.red
                      : (patient.removalType == 'For Validation')
                          ? Colors.blue
                          : Colors.green,
                ),
              ],
            )),
      ),
    );
  }
}
