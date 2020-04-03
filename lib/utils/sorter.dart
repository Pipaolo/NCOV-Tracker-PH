import 'package:ncov_tracker_ph/core/region_matcher.dart';
import 'package:ncov_tracker_ph/data/models/city.dart';
import 'package:ncov_tracker_ph/data/models/patient.dart';
import 'package:ncov_tracker_ph/data/models/region.dart';

Future<List<Region>> sortRegions(List<Patient> patients) async {
  List<Region> patientsGroupedByRegion = [];
  regions.forEach((region, provinces) {
    final List<City> citiesMatched = [];
    provinces.forEach((province) {
      final patientsMatched = patients
          .where((patient) =>
              patient.residenceProv.toLowerCase() == province.toLowerCase())
          .toList();
      if (patientsMatched.isNotEmpty) {
        citiesMatched.add(
          City(
            name: province,
            patients: patientsMatched,
            totalCount: patientsMatched.length,
          ),
        );
      }
    });
    citiesMatched.sort((a, b) => b.totalCount.compareTo(a.totalCount));
    patientsGroupedByRegion.add(Region(
      name: region,
      citiesInfected: citiesMatched,
      totalCount: citiesMatched.fold(0, (a, b) => a + b.totalCount),
    ));
  });

  patientsGroupedByRegion.removeWhere((region) => region.totalCount == 0);
  patientsGroupedByRegion.sort((a, b) => b.totalCount.compareTo(a.totalCount));
  return patientsGroupedByRegion;
}
