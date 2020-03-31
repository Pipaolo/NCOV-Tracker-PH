import 'package:auto_route/auto_route_annotations.dart';
import 'package:ncov_tracker_ph/ui/hospital_listings_page/hospital_listings_page.dart';
import 'package:ncov_tracker_ph/ui/hospital_page/hospital_page.dart';
import 'package:ncov_tracker_ph/ui/info_page/info_page.dart';
import 'package:ncov_tracker_ph/ui/map_page/map_page.dart';

import '../ui/cities_page/cities_page.dart';
import '../ui/home_page/home_page.dart';
import '../ui/introduction_page/introduction_page.dart';
import '../ui/ncov_cases_city_page/ncov_cases_city_page.dart';
import '../ui/splash_page/splash_page.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $Router {
  @initial
  SplashPage splashPageRoute;

  IntroductionPage introductionPageRoute;
  HomePage homePageRoute;
  MapPage mapPageRoute;
  CitiesPage citiesPageRoute;
  InfoPage infoPageRoute;
  HospitalListingsPage hospitalListingsPageRoute;
  HospitalPage hospitalPageRoute;
  NcovCasesCityPage ncovCasesCityPageRoute;
}
