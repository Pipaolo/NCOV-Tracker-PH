import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ncov_tracker_ph/data/models/hospital.dart';
import 'package:ncov_tracker_ph/routes/router.gr.dart';

class HospitalListingsCardWidget extends StatelessWidget {
  final Hospital hospital;
  const HospitalListingsCardWidget({Key key, this.hospital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          ExtendedNavigator.of(context).pushNamed(
            Routes.hospitalPageRoute,
            arguments: HospitalPageArguments(
              hospital: hospital,
            ),
          );
        },
        child: Container(
          height: ScreenUtil().setHeight(200),
          child: Stack(
            children: <Widget>[
              Center(
                child: Text(
                  hospital.name,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(25),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
