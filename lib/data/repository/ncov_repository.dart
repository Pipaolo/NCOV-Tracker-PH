import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:injectable/injectable.dart';

import '../../interceptors/ncov_retry_interceptors.dart';
import '../../retriers/dio_connectivity_request_trier.dart';
import '../models/age_category_statistic.dart';
import '../models/gender_statistic.dart';
import '../models/hospital.dart';
import '../models/ncov_statistic_basic.dart';
import '../models/region.dart';

@injectable
@lazySingleton
class NcovRepository {
  final Dio dioClient;
  NcovRepository({this.dioClient}) {
    dioClient.interceptors.add(NcovRetryOnConnectionChangeInterceptors(
      requestRetrier: DioConnectivityRequestRetrier(
          connectivity: Connectivity(), dio: dioClient),
    ));
  }

  Future<NcovStatisticBasic> fetchBasicStatistics() async {
    try {
      final basicStatistics = await dioClient
          .get('https://ncov-tracker-ph-api.herokuapp.com/basic_stats')
          .then((value) => value.data);

      return NcovStatisticBasic.fromJson(basicStatistics);
    } on DioError catch (e) {
      throw SocketException(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<GenderStatistic>> fetchGenderStatistics() async {
    final genderStatistic = await dioClient
        .get('https://ncov-tracker-ph-api.herokuapp.com/gender_stats')
        .then((value) => value.data);

    return List<GenderStatistic>.from(
        genderStatistic.map((data) => GenderStatistic.fromJson(data)).toList());
  }

  Future<Map<String, List<AgeCategoryStatistic>>> fetchedAgeData() async {
    try {
      final List<dynamic> rawAgeData = await dioClient
          .get('https://ncov-tracker-ph-api.herokuapp.com/age_stats')
          .then((value) => value.data);

      final Map<String, List<AgeCategoryStatistic>> ageData = Map.fromIterable(
        rawAgeData,
        key: (data) => data.keys.first,
        value: (data) {
          final List<AgeCategoryStatistic> ageCateg = [];
          for (var rawAge in data.values) {
            List<AgeCategoryStatistic> ageCategStats =
                List<AgeCategoryStatistic>.from(rawAge
                    .map((f) => AgeCategoryStatistic(
                          category: f['category'],
                          sex: f['sex'],
                          value: f['value'],
                        ))
                    .toList());
            ageCateg.addAll(ageCategStats);
          }
          return ageCateg;
        },
      ).map((key, value) => MapEntry(key, value));

      return ageData;
    } on DioError catch (e) {
      throw SocketException(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Region>> fetchPatientsDOH(int totalInfected) async {
    //Calculate how many iteration will be done to fetch data
    // due to the limitation of 2000 records per query or request
    final List<dynamic> dataFromApi = await dioClient
        .get('https://ncov-tracker-ph-api.herokuapp.com/patients')
        .then((value) => value.data);
    final patients = dataFromApi.map((e) => Region.fromJson(e)).toList();

    return patients;
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
