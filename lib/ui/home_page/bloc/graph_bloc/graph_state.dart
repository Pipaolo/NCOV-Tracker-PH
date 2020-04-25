part of 'graph_bloc.dart';

abstract class GraphState extends Equatable {
  const GraphState();
}

class GraphInitial extends GraphState {
  @override
  List<Object> get props => [];
}

class GraphLoading extends GraphState {
  @override
  List<Object> get props => [];
}

class GraphSuccess extends GraphState {
  final List<BarChartGroupData> barChartData;
  final List<PieChartSectionData> pieChartData;
  final Map<String, List<CumulativeStatistic>> rawCumulativeStats;
  final Map<String, LineChartBarData> lineChartData;

  GraphSuccess({
    @required this.barChartData,
    @required this.pieChartData,
    @required this.rawCumulativeStats,
    @required this.lineChartData,
  });
  @override
  List<Object> get props =>
      [barChartData, pieChartData, rawCumulativeStats, lineChartData];
}

class GraphError extends GraphState {
  final String errorText;
  GraphError({
    this.errorText,
  });
  @override
  List<Object> get props => [errorText];
}
