import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ncov_tracker_ph/data/models/patient.dart';
import '../../../routes/router.gr.dart';

class CityCardWidget extends StatelessWidget {
  final List<Patient> patients;
  final String city;
  final String region;
  const CityCardWidget({Key key, this.patients, this.city, this.region})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          return ExtendedNavigator.rootNavigator.pushNcovCasesCityPageRoute(
            patients: patients,
            city: city,
          );
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: AutoSizeText(
                  city,
                  style: GoogleFonts.montserrat(
                    fontSize: ScreenUtil().setSp(40),
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Center(
              child: AutoSizeText(
                patients.length.toString(),
                style: GoogleFonts.montserrat(
                  fontSize: ScreenUtil().setSp(70),
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
