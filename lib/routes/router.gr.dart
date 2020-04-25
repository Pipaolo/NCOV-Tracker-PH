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
import 'package:ncov_tracker_ph/ui/map_page/map_page.dart';
import 'package:ncov_tracker_ph/ui/cases_page/cases_page.dart';
import 'package:ncov_tracker_ph/ui/cities_page/cities_page.dart';
import 'package:ncov_tracker_ph/data/models/city.dart';
import 'package:ncov_tracker_ph/ui/info_page/info_page.dart';
import 'package:ncov_tracker_ph/ui/hospital_listings_page/hospital_listings_page.dart';
import 'package:ncov_tracker_ph/ui/hospital_page/hospital_page.dart';
import 'package:ncov_tracker_ph/data/models/hospital.dart';
import 'package:ncov_tracker_ph/ui/ncov_cases_city_page/ncov_cases_city_page.dart';
import 'package:ncov_tracker_ph/data/models/patient.dart';

abstract class Routes {
  static const splashPageRoute = '/';
  static const introductionPageRoute = '/introduction-page-route';
  static const homePageRoute = '/home-page-route';
  static const mapPageRoute = '/map-page-route';
  static const casesPageRoute = '/cases-page-route';
  static const citiesPageRoute = '/cities-page-route';
  static const infoPageRoute = '/info-page-route';
  static const hospitalListingsPageRoute = '/hospital-listings-page-route';
  static const hospitalPageRoute = '/hospital-page-route';
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
        return MaterialPageRoute<dynamic>(
          builder: (_) => HomePage(),
          settings: settings,
        );
      case Routes.mapPageRoute:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute<dynamic>(
          builder: (_) => MapPage(key: typedArgs),
          settings: settings,
        );
      case Routes.casesPageRoute:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute<dynamic>(
          builder: (_) => CasesPage(key: typedArgs),
          settings: settings,
        );
      case Routes.citiesPageRoute:
        if (hasInvalidArgs<CitiesPageArguments>(args)) {
          return misTypedArgsRoute<CitiesPageArguments>(args);
        }
        final typedArgs = args as CitiesPageArguments ?? CitiesPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) => CitiesPage(
              key: typedArgs.key,
              cities: typedArgs.cities,
              regionName: typedArgs.regionName),
          settings: settings,
        );
      case Routes.infoPageRoute:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute<dynamic>(
          builder: (_) => InfoPage(key: typedArgs),
          settings: settings,
        );
      case Routes.hospitalListingsPageRoute:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute<dynamic>(
          builder: (_) => HospitalListingsPage(key: typedArgs),
          settings: settings,
        );
      case Routes.hospitalPageRoute:
        if (hasInvalidArgs<HospitalPageArguments>(args)) {
          return misTypedArgsRoute<HospitalPageArguments>(args);
        }
        final typedArgs =
            args as HospitalPageArguments ?? HospitalPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) =>
              HospitalPage(key: typedArgs.key, hospital: typedArgs.hospital),
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
              patients: typedArgs.patients,
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

//CitiesPage arguments holder class
class CitiesPageArguments {
  final Key key;
  final List<City> cities;
  final String regionName;
  CitiesPageArguments({this.key, this.cities, this.regionName});
}

//HospitalPage arguments holder class
class HospitalPageArguments {
  final Key key;
  final Hospital hospital;
  HospitalPageArguments({this.key, this.hospital});
}

//NcovCasesCityPage arguments holder class
class NcovCasesCityPageArguments {
  final Key key;
  final List<Patient> patients;
  final String city;
  NcovCasesCityPageArguments({this.key, this.patients, this.city});
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
  Future pushHomePageRoute() => pushNamed(Routes.homePageRoute);
  Future pushMapPageRoute({
    Key key,
  }) =>
      pushNamed(Routes.mapPageRoute, arguments: key);
  Future pushCasesPageRoute({
    Key key,
  }) =>
      pushNamed(Routes.casesPageRoute, arguments: key);
  Future pushCitiesPageRoute({
    Key key,
    List<City> cities,
    String regionName,
  }) =>
      pushNamed(Routes.citiesPageRoute,
          arguments: CitiesPageArguments(
              key: key, cities: cities, regionName: regionName));
  Future pushInfoPageRoute({
    Key key,
  }) =>
      pushNamed(Routes.infoPageRoute, arguments: key);
  Future pushHospitalListingsPageRoute({
    Key key,
  }) =>
      pushNamed(Routes.hospitalListingsPageRoute, arguments: key);
  Future pushHospitalPageRoute({
    Key key,
    Hospital hospital,
  }) =>
      pushNamed(Routes.hospitalPageRoute,
          arguments: HospitalPageArguments(key: key, hospital: hospital));
  Future pushNcovCasesCityPageRoute({
    Key key,
    List<Patient> patients,
    String city,
  }) =>
      pushNamed(Routes.ncovCasesCityPageRoute,
          arguments: NcovCasesCityPageArguments(
              key: key, patients: patients, city: city));
}
