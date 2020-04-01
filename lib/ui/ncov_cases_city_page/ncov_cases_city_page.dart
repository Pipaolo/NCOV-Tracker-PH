import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ncov_tracker_ph/data/models/patient.dart';
import 'package:ncov_tracker_ph/ui/ncov_cases_city_page/widgets/case_dialog_widget.dart';

class NcovCasesCityPage extends StatelessWidget {
  final List<Patient> patients;
  final String city;
  const NcovCasesCityPage({Key key, this.patients, this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(city),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: patients.length,
        itemBuilder: (context, i) {
          final Patient patient = patients[i];
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
                      Text(
                        patient.caseNumber,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(60),
                        ),
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
