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
  final List<BarChartGroupData> chartData;

  GraphSuccess({this.chartData});
  @override
  List<Object> get props => [chartData];
}

class GraphError extends GraphState {
  final String errorText;
  GraphError({
    this.errorText,
  });
  @override
  List<Object> get props => [errorText];
}
