import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html/parser.dart';
import 'package:ncov_tracker_ph/data/models/hospital.dart';

import '../../core/region_matcher.dart';
import '../../interceptors/ncov_retry_interceptors.dart';
import '../../retriers/dio_connectivity_request_trier.dart';
import '../models/age_category_statistic.dart';
import '../models/ncov_infected.dart';
import '../models/ncov_statistic_basic.dart';
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
    return await jsonDecode(await dioClient
            .get(url)
            .then((response) => response.data))['features'][0]['attributes']
        ['value'];
  }

  Future<NcovStatisticBasic> fetchBasicStatistics() async {
    dioClient.interceptors.add(
      NcovRetryOnConnectionChangeInterceptors(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: dioClient,
          connectivity: Connectivity(),
        ),
      ),
    );
    final deaths =
        await fetchBasicStatisticalData(basicStatisticsUrl['death_url']);
    final recovered =
        await fetchBasicStatisticalData(basicStatisticsUrl['recovered_url']);
    final numberOfTestsConducted = await fetchBasicStatisticalData(
        basicStatisticsUrl['tests_conducted_url']);
    final numberOfPUMs =
        await fetchBasicStatisticalData(basicStatisticsUrl['pums_url']);
    final numberOfPUIs =
        await fetchBasicStatisticalData(basicStatisticsUrl['pui']);
    final numberOfInfected =
        await fetchBasicStatisticalData(basicStatisticsUrl['infected']);
    return NcovStatisticBasic(
      totalDeaths: deaths,
      totalRecovered: recovered,
      totalInfected: numberOfInfected,
      totalPUIs: numberOfPUIs,
      totalPUMs: numberOfPUMs,
      totalTestsConducted: numberOfTestsConducted,
    );
  }

  Future<Map<String, dynamic>> fetchedAgeData() async {
    dioClient.interceptors.add(
      NcovRetryOnConnectionChangeInterceptors(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: dioClient,
          connectivity: Connectivity(),
        ),
      ),
    );
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
  }

  Future<Map<String, Region>> fetchInfectedByCities() async {
    final List<dynamic> rawListOfCities = await jsonDecode(await dioClient
        .get(
            'https://services5.arcgis.com/mnYJ21GiFTR97WFg/arcgis/rest/services/PH_masterlist/FeatureServer/0/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&orderByFields=sequ%20desc&resultOffset=0&resultRecordCount=1500&cacheHint=true')
        .then((response) => response.data))['features'];
    final List<NcovInfected> convertedCities =
        rawListOfCities.map((rawInfected) {
      final infected = rawInfected['attributes'];
      int rawAge = 0;
      try {
        rawAge = int.parse(infected['edad']);
      } catch (e) {
        rawAge = infected['edad'];
      }
      return NcovInfected(
          fID: infected['FID'],
          sequ: infected['sequ'],
          phMasterList: infected['PH_masterl'],
          age: rawAge ?? 0,
          gender: infected['kasarian'],
          nationality: infected['nationalit'],
          residence: infected['residence'].replaceAll('�', 'n'),
          travelHistory: infected['travel_hx'],
          symptoms: infected['symptoms'],
          confirmed: infected['confirmed'],
          facility: infected['facility'],
          latitude: infected['latitude'],
          longitude: infected['longitude'],
          status: infected['status'],
          date: infected['petsa']);
    }).toList();

    //Group Ncov Cities By Simalirities
    final groupedResult = groupBy(convertedCities, (obj) => obj.residence);
    final Map<String, Region> groupedByRegion = {};
    regions.forEach((k, v) {
      List<Map<String, List<NcovInfected>>> filteredResults = [];
      int totalCountPerRegion = 0;
      v.forEach((province) {
        groupedResult.keys.forEach((key) {
          if (key.toString().toLowerCase().contains(province.toLowerCase())) {
            filteredResults.add({
              key: groupedResult[key],
            });
            totalCountPerRegion += groupedResult[key].length;
          }
        });
      });
      groupedByRegion[k] = Region(
        totalCount: totalCountPerRegion,
        citiesInfected: filteredResults,
      );
    });
    groupedByRegion.removeWhere((k, v) {
      return v.totalCount == 0;
    });
    return groupedByRegion;
  }

  Future<List<Hospital>> fetchHospitals() async {
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
  }
}
