import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:injectable/injectable.dart';

import '../../interceptors/ncov_retry_interceptors.dart';
import '../../retriers/dio_connectivity_request_trier.dart';
import '../models/age_category_statistic.dart';
import '../models/cumulative_statistic.dart';
import '../models/gender_statistic.dart';
import '../models/hospital.dart';
import '../models/ncov_statistic_basic.dart';
import '../models/patient.dart';

@injectable
@lazySingleton
class NcovRepository {
  final Dio dioClient;

  static const String baseUrl = 'https://ncovph.com/graphql';

  NcovRepository({this.dioClient}) {
    dioClient.interceptors.add(NcovRetryOnConnectionChangeInterceptors(
      requestRetrier: DioConnectivityRequestRetrier(
          connectivity: Connectivity(), dio: dioClient),
    ));
  }

  Future<Map<String, List<CumulativeStatistic>>>
      fetchCumulativeStatistics() async {
    final response = await dioClient.post(baseUrl, data: {
      'query': '''{cases {
            
              cumulativeConfirmed{
                date   
                  value
                }
              cumulativeDeaths{
                date        
                  value
                }
              cumulativeRecoveries{ 
                date       
                  value
                }
              },
              testing {
                cumulativeTestsConducted{   
                  date          
                  value
                }
              }
              }''',
    });
    final body = response.data;

    final List<CumulativeStatistic> cumulativeDeaths =
        (body['data']['cases']['cumulativeDeaths'] as List<dynamic>)
            .map((e) => CumulativeStatistic.fromJson(e))
            .toList();
    final List<CumulativeStatistic> cumulativeConfirmed =
        (body['data']['cases']['cumulativeConfirmed'] as List<dynamic>)
            .map((e) => CumulativeStatistic.fromJson(e))
            .toList();
    final List<CumulativeStatistic> cumulativeRecoveries =
        (body['data']['cases']['cumulativeRecoveries'] as List<dynamic>)
            .map((e) => CumulativeStatistic.fromJson(e))
            .toList();
    final List<CumulativeStatistic> cumulativeTestsConducted =
        (body['data']['testing']['cumulativeTestsConducted'] as List<dynamic>)
            .map((e) => CumulativeStatistic.fromJson(e))
            .toList();
    return {
      'deaths': cumulativeDeaths,
      'confirmed': cumulativeConfirmed,
      'recoveries': cumulativeRecoveries,
      'testsConducted': cumulativeTestsConducted,
    };
  }

  Future<bool> isNewCasesAdded() async {
    final response = await dioClient.post(baseUrl, data: {
      'query': '''{
        cases
        {countConfirmedCases 
        cumulativeConfirmed
        {value}
        }
        }'''
    });
    final List<dynamic> prevCasesRaw =
        response.data['data']['cases']['cumulativeConfirmed'];
    final int currCases = response.data['data']['cases']['countConfirmedCases'];
    final int prevCases = prevCasesRaw[prevCasesRaw.length - 2]['value'];
    return (currCases != prevCases) ? true : false;
  }

  Future<NcovStatisticBasic> fetchBasicStatistics() async {
    try {
      final response = await dioClient.post(baseUrl, data: {
        "query": '''{cases {
              countDeaths, 
              countAdmitted, 
              countRecoveries, 
              countConfirmedCases
              cumulativeConfirmed{   
                  value
                }
              cumulativeDeaths{        
                  value
                }
              cumulativeRecoveries{         
                  value
                }
              },
              testing {
                countTestsConducted
                cumulativeTestsConducted{                
                  value
                }
              }
              }''',
      });

      final body = response.data;
      final List<dynamic> cumulativeDeaths =
          body['data']['cases']['cumulativeDeaths'];
      final List<dynamic> cumulativeConfirmed =
          body['data']['cases']['cumulativeConfirmed'];
      final List<dynamic> cumulativeRecoveries =
          body['data']['cases']['cumulativeRecoveries'];
      final List<dynamic> cumulativeTestsConducted =
          body['data']['testing']['cumulativeTestsConducted'];

      return NcovStatisticBasic(
        totalDeaths: body['data']['cases']['countDeaths'],
        totalTestsConducted: body['data']['testing']['countTestsConducted'],
        totalRecovered: body['data']['cases']['countRecoveries'],
        totalInfected: body['data']['cases']['countConfirmedCases'],
        prevDeaths: cumulativeDeaths[cumulativeDeaths.length - 2]['value'],
        prevTestsConducted:
            cumulativeTestsConducted[cumulativeTestsConducted.length - 2]
                ['value'],
        prevInfected: cumulativeConfirmed[cumulativeConfirmed.length - 2]
            ['value'],
        prevRecovered: cumulativeRecoveries[cumulativeRecoveries.length - 2]
            ['value'],
      );
    } on DioError catch (e) {
      throw SocketException(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<GenderStatistic>> fetchGenderStatistics() async {
    final response = await dioClient
        .post(baseUrl, data: {"query": "{cases{countPerSex{female male}}}"});
    final body = response.data;

    final genderStatistics = [
      GenderStatistic(
        gender: 'Female',
        value: body['data']['cases']['countPerSex']['female'],
      ),
      GenderStatistic(
        gender: 'Male',
        value: body['data']['cases']['countPerSex']['male'],
      ),
    ];
    return genderStatistics;
  }

  Future<List<AgeCategoryStatistic>> fetchedAgeData() async {
    try {
      final response = await dioClient.post(baseUrl, data: {
        "query":
            "{cases{distribAgeGroupSexConfirmedCases{ageGroup male female}}}"
      });
      final body = response.data;

      final List<dynamic> rawAgeData =
          body['data']['cases']['distribAgeGroupSexConfirmedCases'];
      return rawAgeData
          .map(
            (e) => AgeCategoryStatistic(
              ageGroup: e['ageGroup'],
              male: GenderStatistic(
                gender: 'Male',
                value: e['male'],
              ),
              female: GenderStatistic(
                gender: 'Female',
                value: e['female'],
              ),
            ),
          )
          .toList();
    } on DioError catch (e) {
      throw SocketException(e.toString());
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  Future<List<Patient>> fetchPatients() async {
    //First we need to get the total amount of infected in the Philippines
    final totalConfirmedCountResponse = await dioClient.post(baseUrl, data: {
      "query": '''{
        cases{countConfirmedCases
          }}''',
    });
    final int totalConfirmedCount = totalConfirmedCountResponse.data['data']
        ['cases']['countConfirmedCases'];
    final int numberOfIterations = totalConfirmedCount ~/ 500;
    final List<Patient> patients = [];

    for (int i = 0; i < numberOfIterations; i++) {
      final response = await dioClient.post(baseUrl, data: {
        "query": '''{cases
      {
        confirmedCases(limit:500 offset:${i * 500}){
          caseNumber
          sex
          age
          dateDeath
          dateRecovery
          dateReportConfirmed
          dateReportRemoved
          admitted
          healthStatus
          removalType
          residence{
            region
            province
            city
          }
        }
        }
        }'''
      });
      final List<dynamic> body =
          response.data['data']['cases']['confirmedCases'];
      final List<Patient> patientsConverted =
          body.map((e) => Patient.fromJson(e)).toList();
      patients.addAll(patientsConverted);
    }
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
