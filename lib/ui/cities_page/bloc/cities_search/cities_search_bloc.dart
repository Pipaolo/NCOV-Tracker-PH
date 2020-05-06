import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:ncov_tracker_ph/data/models/city.dart';

part 'cities_search_event.dart';
part 'cities_search_state.dart';

class CitiesSearchBloc extends Bloc<CitiesSearchEvent, CitiesSearchState> {
  final List<City> cities;

  CitiesSearchBloc({
    @required this.cities,
  });

  @override
  CitiesSearchState get initialState =>
      CitiesSearchResultsLoaded(cities: cities);

  @override
  Stream<CitiesSearchState> mapEventToState(
    CitiesSearchEvent event,
  ) async* {
    if (event is CitiesSearched) {
      yield CitiesSearchResultsLoaded(
          cities: cities
              .where((element) => element.name
                  .toLowerCase()
                  .contains(event.queryName.toLowerCase()))
              .toList());
    }
  }
}
