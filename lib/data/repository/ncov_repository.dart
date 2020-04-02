import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html/parser.dart';
import 'package:injectable/injectable.dart';
import 'package:ncov_tracker_ph/core/region_matcher.dart';
import 'package:ncov_tracker_ph/data/models/city.dart';
import 'package:ncov_tracker_ph/data/models/patient.dart';

import '../models/age_category_statistic.dart';
import '../models/hospital.dart';
import '../models/ncov_statistic_basic.dart';
import '../models/region.dart';

@injectable
@lazySingleton
class NcovRepository {
  final basicStatisticsUrl = {
    'death_url':
        'https://services5.arcgis.com/mnYJ21GiFTR97WFg/arcgis/rest/services/slide_fig/FeatureServer/0/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&outStatistics=%5B%7B%22statisticType%22%3A%22sum%22%2C%22onStatisticField%22%3A%22deaths%22%2C%22outStatisticFieldName%22%3A%22value%22%7D%5D&cacheHint=true',
    'recovered_url':
        'https://services5.arcgis.com/mnYJ21GiFTR97WFg/arcgis/rest/services/slide_fig/FeatureServer/0/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&outStatistics=%5B%7B%22statisticType%22%3A%22sum%22%2C%22onStatisticField%22%3A%22recovered%22%2C%22outStatisticFieldName%22%3A%22value%22%7D%5D&cacheHint=true',
    'tests_conducted_url':
        'https://services5.arcgis.com/mnYJ21GiFTR97WFg/arcgis/rest/services/slide_fig/FeatureServer/0/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&outStatistics=%5B%7B%22statisticType%22%3A%22sum%22%2C%22onStatisticField%22%3A%22tests%22%2C%22outStatisticFieldName%22%3A%22value%22%7D%5D&cacheHint=true',
    'pums_url':
        'https://services5.arcgis.com/mnYJ21GiFTR97WFg/arcgis/rest/services/slide_fig/FeatureServer/0/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&outStatistics=%5B%7B%22statisticType%22%3A%22sum%22%2C%22onStatisticField%22%3A%22PUMs%22%2C%22outStatisticFieldName%22%3A%22value%22%7D%5D&cacheHint=true',
    'pui':
        'https://services5.arcgis.com/mnYJ21GiFTR97WFg/arcgis/rest/services/slide_fig/FeatureServer/0/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&outStatistics=%5B%7B%22statisticType%22%3A%22sum%22%2C%22onStatisticField%22%3A%22PUIs%22%2C%22outStatisticFieldName%22%3A%22value%22%7D%5D&cacheHint=true',
    'infected':
        'https://services5.arcgis.com/mnYJ21GiFTR97WFg/arcgis/rest/services/slide_fig/FeatureServer/0/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&outStatistics=%5B%7B%22statisticType%22%3A%22sum%22%2C%22onStatisticField%22%3A%22confirmed%22%2C%22outStatisticFieldName%22%3A%22value%22%7D%5D&cacheHint=true'
  };

  final Dio dioClient;
  NcovRepository({this.dioClient});

  Future<int> fetchBasicStatisticalData(String url) async {
    try {
      return await jsonDecode(await dioClient
              .get(url)
              .then((response) => response.data))['features'][0]['attributes']
          ['value'];
    } catch (e) {
      throw SocketException('No Internet Connection');
    }
  }

  Future<int> fetchTotalCases() async {
    return await fetchBasicStatisticalData(
        'https://services5.arcgis.com/mnYJ21GiFTR97WFg/arcgis/rest/services/slide_fig/FeatureServer/0/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&outStatistics=%5B%7B%22statisticType%22%3A%22sum%22%2C%22onStatisticField%22%3A%22confirmed%22%2C%22outStatisticFieldName%22%3A%22value%22%7D%5D&cacheHint=true');
  }

  Future<NcovStatisticBasic> fetchBasicStatistics() async {
    try {
      final responses = await Future.wait(basicStatisticsUrl.entries
          .map((link) async => await fetchBasicStatisticalData(link.value))
          .toList());

      final deaths = responses[0];
      final recovered = responses[1];
      final numberOfTestsConducted = responses[2];
      final numberOfPUMs = responses[3];
      final numberOfPUIs = responses[4];
      final numberOfInfected = responses[5];

      return NcovStatisticBasic(
        totalDeaths: deaths,
        totalRecovered: recovered,
        totalInfected: numberOfInfected,
        totalPUIs: numberOfPUIs,
        totalPUMs: numberOfPUMs,
        totalTestsConducted: numberOfTestsConducted,
      );
    } catch (e) {
      throw SocketException('No Internet Connection');
    }
  }

  Future<Map<String, int>> fetchGenderStatistics() async {
    try {
      final response = await dioClient.get('https://endcov.ph/dashboard/');
      final elements = parse(response.data);
      final genderStatisticsRaw = elements.getElementById('agesex-data').text;
      final json = jsonDecode(genderStatisticsRaw);
      final genderStatistic = {
        'Male': json['sex'][1][0] as int,
        'Female': json['sex'][1][1] as int,
      };
      return genderStatistic;
    } catch (e) {
      throw SocketException('No Internet Connection');
    }
  }

  Future<Map<String, dynamic>> fetchedAgeData() async {
    try {
      final ageData = await jsonDecode(
        await dioClient
            .get(
                'https://services5.arcgis.com/mnYJ21GiFTR97WFg/arcgis/rest/services/age_group/FeatureServer/0/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&groupByFieldsForStatistics=age_categ%2Csex&outStatistics=%5B%7B%22statisticType%22%3A%22count%22%2C%22onStatisticField%22%3A%22FID%22%2C%22outStatisticFieldName%22%3A%22value%22%7D%5D&outSR=102100&cacheHint=true')
            .then((response) => response.data),
      )['features'];

      final List<dynamic> ageDataConverted = ageData.map((raw) {
        final attr = raw['attributes'];
        return AgeCategoryStatistic(
          value: attr['value'],
          category: attr['age_categ'],
          sex: attr['sex'],
        );
      }).toList();
      return groupBy(ageDataConverted, (obj) => obj.category);
    } catch (e) {
      throw SocketException('No Internet Connection');
    }
  }

  Future<List<Region>> fetchPatients() async {
    try {
      final responseBody = await dioClient
          .get('https://endcov.ph/cases/')
          .then((rawData) => rawData.data);
      final element = parse(responseBody);
      final Map<String, dynamic> rawPatientList =
          await jsonDecode(element.getElementById('patients-data').text);
      final List<Patient> patients = rawPatientList.entries.map((rawPatient) {
        String province = '';

        if (rawPatient.value['residence_prov'] == 'NA' ||
            rawPatient.value['residence_prov'] == ' ' ||
            rawPatient.value['residence_prov'] == null) {
          province = 'For Validation';
        } else if (rawPatient.value['residence_prov'] == 'Metro Manila') {
          province = (rawPatient.value['residence_city_mun'].startsWith('City'))
              ? rawPatient.value['residence_city_mun']
                      .replaceAll('City of', '')
                      .trim() +
                  ' City'
              : rawPatient.value['residence_city_mun'];
        } else {
          province = rawPatient.value['residence_prov'];
        }

        return Patient(
          caseNumber: rawPatient.value['case_number'],
          caseNumberInt: rawPatient.value['case_number_int'],
          admissionDate: rawPatient.value['admission_date'],
          admittedTo: rawPatient.value['admitted_to'],
          age: rawPatient.value['age'],
          sex: rawPatient.value['sex'],
          cityMunPsgc: rawPatient.value['city_mun_psgc'],
          countryVisited0: rawPatient.value['country_visited_0'],
          countryVisited1: rawPatient.value['country_visited_1'],
          countryVisited2: rawPatient.value['country_visited_2'],
          deathCause: rawPatient.value['death_cause'],
          deathDate: rawPatient.value['death_date'],
          exposure: rawPatient.value['exposure'],
          exposureLink: rawPatient.value['exposure_link'],
          labConfirmationDate: rawPatient.value['lab_confirmation_date'],
          nationality: rawPatient.value['nationality'],
          onsetDate: rawPatient.value['onset_date'],
          overseasTravel: rawPatient.value['overseas_travel'],
          provPsgc: rawPatient.value['prov_psgc'],
          remarks: rawPatient.value['remarks'],
          residenceCityMun: (rawPatient.value['residence_city_mun'] == 'NA')
              ? 'For Validation'
              : rawPatient.value['residence_city_mun'],
          residenceProv: province,
          status: (rawPatient.value['residence_status'] == null)
              ? 'For Validation'
              : rawPatient.value['residence_status'],
          symptoms: List<String>.from(rawPatient.value['symptoms']),
          transmission: rawPatient.value['transmission'],
        );
      }).toList();

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
      patientsGroupedByRegion
          .sort((a, b) => b.totalCount.compareTo(a.totalCount));
      return patientsGroupedByRegion;
    } catch (e) {
      print(e);
      throw SocketException('No Internet Connection');
    }
  }

  Future<List<Hospital>> fetchHospitals() async {
    try {
      final response = await dioClient.get('https://endcov.ph/hospitals/');
      final elements = parse(response.data);
      final hospitalRaw = elements.getElementsByTagName('tbody').first.children;
      final hospitals = hospitalRaw.map((e) {
        return Hospital(
            name: e.children[0].text.trim(),
            address: e.children[1].text.trim(),
            contactInfo: e.children[2].text.split(' / '),
            type: e.children.last.text.trim());
      }).toList();

      return hospitals.toSet().toList();
    } catch (e) {
      throw SocketException('No Internet Connection');
    }
  }
}
