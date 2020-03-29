import 'package:auto_route/auto_route_annotations.dart';
import 'package:ncov_tracker_ph/ui/home_page/home_page.dart';
import 'package:ncov_tracker_ph/ui/ncov_cases_city_page/ncov_cases_city_page.dart';
import 'package:ncov_tracker_ph/ui/splash_page/splash_page.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $Router {
  @initial
  SplashPage splashPageRoute;

  HomePage homePageRoute;
  NcovCasesCityPage ncovCasesCityPageRoute;
}
