import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html/parser.dart';

import '../../core/region_matcher.dart';
import '../models/age_category_statistic.dart';
import '../models/city.dart';
import '../models/hospital.dart';
import '../models/ncov_statistic_basic.dart';
import '../models/patient.dart';
import '../models/region.dart';

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
      final List<dynamic> rawPatientsList = await jsonDecode(await dioClient
          .get(
              'https://services5.arcgis.com/mnYJ21GiFTR97WFg/arcgis/rest/services/PH_masterlist/FeatureServer/0/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&orderByFields=sequ%20desc&resultOffset=0&resultRecordCount=1500&cacheHint=true')
          .then((response) => response.data))['features'];
      final List<Patient> patientsList = rawPatientsList.map((data) {
        final rawPatient = data['attributes'];
        int age = 0;
        try {
          age = int.parse(rawPatient['edad']);
        } catch (e) {
          age = rawPatient['edad'];
        }

        return Patient(
          fID: rawPatient['FID'],
          sequ: rawPatient['sequ'],
          phMasterList: rawPatient['PH_masterl'],
          age: age,
          gender: rawPatient['kasarian'],
          nationality: rawPatient['nationalit'],
          residence: rawPatient['residence'].replaceAll('�', 'n'),
          travelHistory: rawPatient['travel_hx'],
          symptoms: rawPatient['symptoms'],
          confirmed: rawPatient['confirmed'],
          facility: rawPatient['facility'],
          latitude: rawPatient['latitude'],
          longitude: rawPatient['longitude'],
          status: rawPatient['status'],
          date: rawPatient['petsa'],
        );
      }).toList();

      //Group Ncov Cities By Simalirities
      final List<Region> groupedByRegion = [];
      regions.forEach((region, provinces) {
        final List<City> citiesMatched = [];
        provinces.forEach((province) {
          final patientsGroupedByProvince = patientsList
              .where((patient) => patient.residence
                  .toLowerCase()
                  .contains(province.toLowerCase()))
              .toList();
          if (patientsGroupedByProvince.isNotEmpty) {
            citiesMatched.add(
              City(
                  name: province,
                  patients: patientsGroupedByProvince,
                  totalCount: patientsGroupedByProvince.length),
            );
          }
        });
        citiesMatched.sort((a, b) => b.totalCount.compareTo(a.totalCount));
        groupedByRegion.add(Region(
          name: region,
          citiesInfected: citiesMatched,
          totalCount: citiesMatched.fold(0, (a, b) => a + b.totalCount),
        ));
      });

      groupedByRegion.removeWhere((region) => region.totalCount == 0);
      groupedByRegion.sort((a, b) => b.totalCount.compareTo(a.totalCount));

      return groupedByRegion;
    } catch (e) {
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
      return hospitals;
    } catch (e) {
      throw SocketException('No Internet Connection');
    }
  }
}
