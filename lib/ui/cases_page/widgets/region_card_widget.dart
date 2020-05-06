import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/city.dart';
import '../../../routes/router.gr.dart';

class RegionCardWidget extends StatelessWidget {
  final String region;
  final int totalCount;
  final List<City> cities;
  const RegionCardWidget({Key key, this.region, this.totalCount, this.cities})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () async {
          if (region == 'For Validation') {
            return ExtendedNavigator.of(context).pushNamed(
              Routes.ncovCasesCityPageRoute,
              arguments: NcovCasesCityPageArguments(
                city: cities.first.name,
                patients: cities.first.patients,
              ),
            );
          } else if (region == 'Unknown') {
            return ExtendedNavigator.of(context).pushNamed(
              Routes.ncovCasesCityPageRoute,
              arguments: NcovCasesCityPageArguments(
                city: cities.first.name,
                patients: cities.first.patients,
              ),
            );
          } else {
            return ExtendedNavigator.of(context).pushNamed(
              Routes.citiesPageRoute,
              arguments: CitiesPageArguments(
                cities: cities,
                regionName: region ?? 'Not Defined',
              ),
            );
          }
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
                  region ?? 'Not Defined',
                  style: GoogleFonts.montserrat(
                    fontSize: ScreenUtil().setSp(35),
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Center(
              child: AutoSizeText(
                totalCount.toString(),
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(50),
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
