part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class CitiesSearched extends SearchEvent {
  final String query;

  CitiesSearched({this.query});
  @override
  List<Object> get props => [query];
}
