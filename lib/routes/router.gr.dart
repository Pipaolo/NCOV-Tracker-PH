// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ncov_tracker_ph/ui/splash_page/splash_page.dart';
import 'package:ncov_tracker_ph/ui/introduction_page/introduction_page.dart';
import 'package:ncov_tracker_ph/ui/home_page/home_page.dart';
import 'package:ncov_tracker_ph/ui/ncov_cases_city_page/ncov_cases_city_page.dart';
import 'package:ncov_tracker_ph/data/models/ncov_infected.dart';

abstract class Routes {
  static const splashPageRoute = '/';
  static const introductionPageRoute = '/introduction-page-route';
  static const homePageRoute = '/home-page-route';
  static const ncovCasesCityPageRoute = '/ncov-cases-city-page-route';
}

class Router extends RouterBase {
  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashPageRoute:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute<dynamic>(
          builder: (_) => SplashPage(key: typedArgs),
          settings: settings,
        );
      case Routes.introductionPageRoute:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute<dynamic>(
          builder: (_) => IntroductionPage(key: typedArgs),
          settings: settings,
        );
      case Routes.homePageRoute:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute<dynamic>(
          builder: (_) => HomePage(key: typedArgs),
          settings: settings,
        );
      case Routes.ncovCasesCityPageRoute:
        if (hasInvalidArgs<NcovCasesCityPageArguments>(args)) {
          return misTypedArgsRoute<NcovCasesCityPageArguments>(args);
        }
        final typedArgs =
            args as NcovCasesCityPageArguments ?? NcovCasesCityPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) => NcovCasesCityPage(
              key: typedArgs.key,
              ncovInfecteds: typedArgs.ncovInfecteds,
              city: typedArgs.city),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//NcovCasesCityPage arguments holder class
class NcovCasesCityPageArguments {
  final Key key;
  final List<NcovInfected> ncovInfecteds;
  final String city;
  NcovCasesCityPageArguments({this.key, this.ncovInfecteds, this.city});
}

//**************************************************************************
// Navigation helper methods extension
//***************************************************************************

extension RouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushSplashPageRoute({
    Key key,
  }) =>
      pushNamed(Routes.splashPageRoute, arguments: key);
  Future pushIntroductionPageRoute({
    Key key,
  }) =>
      pushNamed(Routes.introductionPageRoute, arguments: key);
  Future pushHomePageRoute({
    Key key,
  }) =>
      pushNamed(Routes.homePageRoute, arguments: key);
  Future pushNcovCasesCityPageRoute({
    Key key,
    List<NcovInfected> ncovInfecteds,
    String city,
  }) =>
      pushNamed(Routes.ncovCasesCityPageRoute,
          arguments: NcovCasesCityPageArguments(
              key: key, ncovInfecteds: ncovInfecteds, city: city));
}
