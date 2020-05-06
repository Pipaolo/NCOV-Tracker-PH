part of 'cities_search_bloc.dart';

abstract class CitiesSearchEvent extends Equatable {
  const CitiesSearchEvent();
}

class CitiesSearched extends CitiesSearchEvent {
  final String queryName;
  CitiesSearched({
    @required this.queryName,
  });
  @override
  List<Object> get props => [queryName];
}
