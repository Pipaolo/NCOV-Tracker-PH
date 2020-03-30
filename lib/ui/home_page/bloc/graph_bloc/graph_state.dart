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

  GraphSuccess({this.barChartData, this.pieChartData});
  @override
  List<Object> get props => [barChartData, this.pieChartData];
}

class GraphError extends GraphState {
  final String errorText;
  GraphError({
    this.errorText,
  });
  @override
  List<Object> get props => [errorText];
}
