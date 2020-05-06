part of 'cities_search_bloc.dart';

abstract class CitiesSearchState extends Equatable {
  const CitiesSearchState();
}

class CitiesSearchInitial extends CitiesSearchState {
  @override
  List<Object> get props => [];
}

class CitiesSearchLoading extends CitiesSearchState {
  @override
  List<Object> get props => [];
}

class CitiesSearchResultsLoaded extends CitiesSearchState {
  final List<City> cities;
  CitiesSearchResultsLoaded({
    @required this.cities,
  });
  @override
  List<Object> get props => [cities];
}
