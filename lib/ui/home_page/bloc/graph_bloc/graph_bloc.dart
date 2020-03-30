import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta/meta.dart';

import '../../../../data/repository/ncov_repository.dart';
import '../home_page_bloc.dart';

part 'graph_event.dart';
part 'graph_state.dart';

class GraphBloc extends Bloc<GraphEvent, GraphState> {
  final HomePageBloc homePageBloc;
  final NcovRepository ncovRepository;

  GraphBloc({
    @required this.homePageBloc,
    @required this.ncovRepository,
  }) {
    homePageBloc.listen((state) {
      if (state is HomePageSuccess) {
        add(AgeStatisticsDataFetched());
      }
    });
  }

  @override
  GraphState get initialState => GraphInitial();

  @override
  Stream<GraphState> mapEventToState(
    GraphEvent event,
  ) async* {
    if (event is AgeStatisticsDataFetched) {
      yield GraphLoading();

      final Color leftBarColor = const Color(0xff53fdd7);
      final Color rightBarColor = const Color(0xffff5182);
      final ageData = await ncovRepository.fetchedAgeData();
      final List<BarChartGroupData> chartData = [];
      int index = 0;
      ageData.forEach((k, v) {
        chartData.add(BarChartGroupData(
            x: index,
            barsSpace: ScreenUtil().setWidth(10),
            barRods: [
              BarChartRodData(
                y: v[0].value.toDouble() ?? 0.0,
                color: leftBarColor,
                borderRadius: BorderRadius.circular(10),
                width: ScreenUtil().setWidth(20),
              ),
              BarChartRodData(
                y: (v.length > 1) ? v[1].value.toDouble() : 0.0,
                color: rightBarColor,
                borderRadius: BorderRadius.circular(10),
                width: ScreenUtil().setWidth(20),
              )
            ]));
      });

      yield GraphSuccess(chartData: chartData);
    }
  }
}
