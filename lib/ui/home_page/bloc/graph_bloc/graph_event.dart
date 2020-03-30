part of 'graph_bloc.dart';

abstract class GraphEvent extends Equatable {
  const GraphEvent();
}

class StatisticsFetched extends GraphEvent {
  @override
  List<Object> get props => [];
}
