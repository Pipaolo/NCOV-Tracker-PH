import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/age_category_statistic.dart';
import '../../../../data/models/cumulative_statistic.dart';
import '../../../../data/models/gender_statistic.dart';
import '../../../../data/repository/ncov_repository.dart';

part 'graph_event.dart';
part 'graph_state.dart';

class GraphBloc extends Bloc<GraphEvent, GraphState> {
  final NcovRepository ncovRepository;

  static Color leftBarColor = const Color(0xff53fdd7);
  static Color rightBarColor = const Color(0xffff5182);
  static List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  GraphBloc({
    @required this.ncovRepository,
  });

  @override
  GraphState get initialState => GraphInitial();

  @override
  Stream<GraphState> mapEventToState(
    GraphEvent event,
  ) async* {
    if (event is StatisticsFetched) {
      yield GraphLoading();
      final List<GenderStatistic> genderData =
          await ncovRepository.fetchGenderStatistics();
      final ageData = await ncovRepository.fetchedAgeData();
      final cumulativeStatistics =
          await ncovRepository.fetchCumulativeStatistics();
      final Map<String, LineChartBarData> lineChartData =
          _generateLineChartData(cumulativeStatistics);
      final List<BarChartGroupData> chartData = _generateBarData(ageData);
      final List<PieChartSectionData> pieChartData =
          _generatePieChartData(genderData);
      yield GraphSuccess(
        barChartData: chartData,
        pieChartData: pieChartData,
        rawCumulativeStats: cumulativeStatistics,
        lineChartData: lineChartData,
      );
    }
  }

  LineChartBarData _generateLineChartDataSingle(
      List<CumulativeStatistic> rawCumulativeStats) {
    return LineChartBarData(
        colors: gradientColors,
        spots: rawCumulativeStats
            .map((e) => FlSpot(
                rawCumulativeStats.indexOf(e).toDouble(), e.value.toDouble()))
            .toList(),
        isCurved: true,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((e) => e.withOpacity(0.3)).toList()));
  }

  Map<String, LineChartBarData> _generateLineChartData(
      Map<String, List<CumulativeStatistic>> rawCumulativeStats) {
    final testsConductedDataPoints =
        _generateLineChartDataSingle(rawCumulativeStats['testsConducted']);
    final recoveriesDataPoints =
        _generateLineChartDataSingle(rawCumulativeStats['recoveries']);
    final deathsDataPoints =
        _generateLineChartDataSingle(rawCumulativeStats['deaths']);
    final infectedDataPoints =
        _generateLineChartDataSingle(rawCumulativeStats['confirmed']);

    return {
      'testsConducted': testsConductedDataPoints,
      'recoveries': recoveriesDataPoints,
      'deaths': deathsDataPoints,
      'confirmed': infectedDataPoints
    };
  }

  List<PieChartSectionData> _generatePieChartData(
      List<GenderStatistic> genderData) {
    return genderData.map((data) {
      return PieChartSectionData(
        color: (data.gender.contains('Female')) ? leftBarColor : rightBarColor,
        value: data.value.toDouble(),
        radius: 60,
        title: data.value.toString(),
      );
    }).toList();
  }

  List<BarChartGroupData> _generateBarData(List<AgeCategoryStatistic> ageData) {
    final List<BarChartGroupData> dataPoints = [];

    int counter = 0;
    for (final data in ageData) {
      dataPoints.add(
        BarChartGroupData(
          x: counter,
          barsSpace: 1,
          barRods: [
            BarChartRodData(
              y: data.female.value.toDouble() ?? 0.0,
              color: leftBarColor,
              borderRadius: BorderRadius.circular(10),
              width: ScreenUtil().setWidth(12),
            ),
            BarChartRodData(
              y: data.male.value.toDouble() ?? 0.0,
              color: rightBarColor,
              borderRadius: BorderRadius.circular(10),
              width: ScreenUtil().setWidth(12),
            )
          ],
        ),
      );
      counter++;
    }
    return dataPoints;
  }
}
