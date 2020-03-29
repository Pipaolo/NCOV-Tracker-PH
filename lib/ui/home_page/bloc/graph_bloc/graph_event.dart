part of 'graph_bloc.dart';

abstract class GraphEvent extends Equatable {
  const GraphEvent();
}

class AgeStatisticsDataFetched extends GraphEvent {
  @override
  List<Object> get props => [];
}
