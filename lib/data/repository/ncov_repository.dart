import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html/parser.dart';
import 'package:injectable/injectable.dart';

import '../../interceptors/ncov_retry_interceptors.dart';
import '../../retriers/dio_connectivity_request_trier.dart';
import '../../utils/sorter.dart';
import '../models/age_category_statistic.dart';
import '../models/gender_statistic.dart';
import '../models/hospital.dart';
import '../models/ncov_statistic_basic.dart';
import '../models/patient.dart';
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
        'https://services5.arcgis.com/mnYJ21GiFTR97WFg/arcgis/rest/services/slide_fig/FeatureServer/0/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&outStatistics=%5B%7B%22statisticType%22%3A%22sum%22%2C%22onStatisticField%22%3A%22confirmed%22%2C%22outStatisticFieldName%22%3A%22value%22%7D%5D&cacheHint=true',
    'puis_tested':
        'https://services5.arcgis.com/mnYJ21GiFTR97WFg/arcgis/rest/services/slide_fig/FeatureServer/0/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&outStatistics=%5B%7B%22statisticType%22%3A%22sum%22%2C%22onStatisticField%22%3A%22tests%22%2C%22outStatisticFieldName%22%3A%22value%22%7D%5D&outSR=102100&cacheHint=true',
  };

  final Dio dioClient;
  NcovRepository({this.dioClient}) {
    dioClient.interceptors.add(NcovRetryOnConnectionChangeInterceptors(
      requestRetrier: DioConnectivityRequestRetrier(
          connectivity: Connectivity(), dio: dioClient),
    ));
  }

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
      final numberOfPUIsTested = responses[6];
      final numberOfInfected = responses[5];

      return NcovStatisticBasic(
        totalDeaths: deaths,
        totalRecovered: recovered,
        totalInfected: numberOfInfected,
        totalPUIs: numberOfPUIs,
        totalPUMs: numberOfPUMs,
        totalTestsConducted: numberOfTestsConducted,
        totalPUIsTested: numberOfPUIsTested,
      );
    } on DioError catch (e) {
      throw SocketException(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<GenderStatistic>> fetchGenderStatistics(
      Map<String, dynamic> rawAgeData) async {
    final genderSplit = rawAgeData.entries.map((e) => e.value).toList();
    final List<GenderStatistic> genderData = [];
    for (final list in genderSplit) {
      final genderStatistics = List<GenderStatistic>.from(
        list.map(
          (ageCategStats) {
            return GenderStatistic(
              gender: ageCategStats.sex,
              value: ageCategStats.value,
            );
          },
        ).toList(),
      );
      genderData.addAll(genderStatistics);
    }
    return genderData;
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
    } on DioError catch (e) {
      throw SocketException(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Patient>> convertDataToPatients(
      List<dynamic> rawPatientList) async {
    return rawPatientList.map((data) {
      final rawPatient = data['attributes'];
      final rawResidenceData =
          rawPatient['residence'].trim().replaceAll('�', 'n').split(',');
      String city;
      String province;
      int age;

      try {
        age = (rawPatient['edad'].contains('For Verification'))
            ? 0
            : int.parse(rawPatient['edad']);
      } catch (e) {
        age = rawPatient['edad'];
      }

      if (rawResidenceData.length == 1) {
        city = rawResidenceData[0];
        province = rawResidenceData[0];
      } else if (rawResidenceData.contains('NCR')) {
        city = rawPatient['residence'];
        province = rawPatient['residence'];
      } else {
        city = rawResidenceData[0].trim();
        province = rawResidenceData[1].trim();
      }

      return Patient(
        caseNumberInt: rawPatient['sequ'],
        caseNumber: rawPatient['PH_masterl'],
        age: age,
        sex: rawPatient['kasarian'],
        nationality: rawPatient['nationalit'],
        residenceProv: province,
        residenceCity: city,
        travelHistory: rawPatient['travel_hx'],
        symptoms: rawPatient['symptoms'],
        confirmedDate: rawPatient['confirmed'],
        admittedTo: rawPatient['facility'],
        status: rawPatient['status'],
      );
    }).toList();
  }

  Future<List<Region>> fetchPatientsDOH(int totalInfected) async {
    //Calculate how many iteration will be done to fetch data
    // due to the limitation of 2000 records per query or request
    const int limit = 2000;
    final totalIterations = totalInfected ~/ limit;
    final remaining = totalInfected % limit;
    List<Patient> patients = [];
    for (int i = 0; i < totalIterations; i++) {
      final List<dynamic> rawPatientList = await jsonDecode(await dioClient
          .get(
              'https://services5.arcgis.com/mnYJ21GiFTR97WFg/arcgis/rest/services/PH_masterlist/FeatureServer/0/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&orderByFields=sequ%20desc&resultOffset=${limit * i}&resultRecordCount=$limit&cacheHint=true')
          .then((value) => value.data))['features'];
      patients.addAll(await convertDataToPatients(rawPatientList));
    }
    //Fetch Remaining Patients
    final String remainingUrl =
        'https://services5.arcgis.com/mnYJ21GiFTR97WFg/arcgis/rest/services/PH_masterlist/FeatureServer/0/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&orderByFields=sequ%20desc&resultOffset=${totalIterations * limit}&resultRecordCount=$remaining&cacheHint=true';
    final List<dynamic> rawPatientListRemaining = await jsonDecode(
        await dioClient
            .get(remainingUrl)
            .then((value) => value.data))['features'];

    patients.addAll(await convertDataToPatients(rawPatientListRemaining));

    //Group Patients By Region

    return await compute(sortRegions, patients);
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
    } on DioError catch (e) {
      throw SocketException(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
