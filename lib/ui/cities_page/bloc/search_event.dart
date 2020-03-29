part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class CitiesSearched extends SearchEvent {
  final String region;
  final String query;

  CitiesSearched({this.region, this.query});
  @override
  List<Object> get props => [query, region];
}

class RegionPressed extends SearchEvent {
  final String region;

  RegionPressed({this.region});

  @override
  List<Object> get props => [region];
}
