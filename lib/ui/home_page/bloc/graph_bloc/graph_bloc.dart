import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/gender_statistic.dart';
import '../../../../data/repository/ncov_repository.dart';
import '../home_page_bloc.dart';

part 'graph_event.dart';
part 'graph_state.dart';

class GraphBloc extends Bloc<GraphEvent, GraphState> {
  final HomePageBloc homePageBloc;
  final NcovRepository ncovRepository;

  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);

  GraphBloc({
    @required this.homePageBloc,
    @required this.ncovRepository,
  }) {
    homePageBloc.listen((state) {
      if (state is HomePageSuccess) {
        add(StatisticsFetched());
      }
    });
  }

  @override
  GraphState get initialState => GraphInitial();

  @override
  Stream<GraphState> mapEventToState(
    GraphEvent event,
  ) async* {
    if (event is StatisticsFetched) {
      yield GraphLoading();

      final ageData = await ncovRepository.fetchedAgeData();
      final List<GenderStatistic> genderData =
          await ncovRepository.fetchGenderStatistics(ageData);
      final List<BarChartGroupData> chartData = _generateBarData(ageData);
      final List<PieChartSectionData> pieChartData = _generatePieChartData(
          groupBy(genderData, (GenderStatistic gender) => gender.gender));
      yield GraphSuccess(barChartData: chartData, pieChartData: pieChartData);
    }
  }

  List<PieChartSectionData> _generatePieChartData(
      Map<String, List<GenderStatistic>> genderData) {
    return genderData.entries.map((data) {
      final value = data.value.fold(0, (prev, curr) => prev + curr.value);
      return PieChartSectionData(
        color: (data.key.contains('Female')) ? leftBarColor : rightBarColor,
        value: value.toDouble(),
        radius: 60,
        title: value.toString(),
      );
    }).toList();
  }

  List<BarChartGroupData> _generateBarData(Map<String, dynamic> ageData) {
    return ageData.entries.map((data) {
      return BarChartGroupData(x: 0, barsSpace: 10, barRods: [
        BarChartRodData(
          y: data.value[0].value.toDouble() ?? 0.0,
          color: leftBarColor,
          borderRadius: BorderRadius.circular(10),
          width: ScreenUtil().setWidth(20),
        ),
        BarChartRodData(
          y: (data.value.length > 1) ? data.value[1].value.toDouble() : 0.0,
          color: rightBarColor,
          borderRadius: BorderRadius.circular(10),
          width: ScreenUtil().setWidth(20),
        )
      ]);
    }).toList();
  }
}
