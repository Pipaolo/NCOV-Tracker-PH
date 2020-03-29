import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ncov_tracker_ph/data/models/ncov_infected.dart';
import 'package:ncov_tracker_ph/routes/router.gr.dart';

class CityCardWidget extends StatelessWidget {
  final List<NcovInfected> ncovInfected;
  final String city;
  const CityCardWidget({Key key, this.ncovInfected, this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => ExtendedNavigator.rootNavigator.pushNcovCasesCityPageRoute(
          ncovInfecteds: ncovInfected,
          city: city,
        ),
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
                ncovInfected.length.toString(),
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
