import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/city.dart';
import '../data/models/patient.dart';
import '../data/models/region.dart';

Future<List<Region>> sortRegions(List<Patient> patients) async {
  final grouped =
      groupBy(patients, (Patient patient) => patient.residence.region);

  final regions = grouped.entries.map((e) {
    final cities = groupBy(e.value, (Patient patient) => patient.residence.city)
        .entries
        .map((e) => City(
            name: e.value.first.residence.city,
            totalCount: e.value.length,
            patients: e.value))
        .toList();
    cities.sort((a, b) => b.totalCount.compareTo(a.totalCount));

    return Region(
        totalCount: e.value.length, name: e.key, citiesInfected: cities);
  }).toList();

  regions.sort((a, b) => b.totalCount.compareTo(a.totalCount));
  return regions;
}
