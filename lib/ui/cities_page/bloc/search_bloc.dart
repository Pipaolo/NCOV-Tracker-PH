import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ncov_tracker_ph/data/models/city.dart';

import 'package:ncov_tracker_ph/data/models/region.dart';
import 'package:ncov_tracker_ph/ui/home_page/bloc/home_page_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final HomePageBloc homePageBloc;
  List<Region> regions = [];
  List<City> cities = [];
  SearchBloc({
    this.homePageBloc,
  }) {
    homePageBloc.listen((state) {
      if (state is HomePageSuccess) {
        regions = state.patientsGroupedByRegion;
        add(CitiesSearched(query: ''));
      }
    });
  }

  @override
  SearchState get initialState => SearchInitial();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is CitiesSearched) {
      if (event.query.isNotEmpty) {
        try {
          final listOfInfectedInRegion = regions
              .where((region) => region.name
                  .toLowerCase()
                  .contains(event.region.toLowerCase()))
              .first
              .citiesInfected;

          final searchResults = listOfInfectedInRegion
              .where((city) => city.name.toLowerCase().startsWith(
                    event.query.toLowerCase(),
                  ))
              .toList();

          yield SearchSuccess(searchResults: searchResults);
        } catch (e) {
          print(e);
        }
      } else {
        yield SearchSuccess(searchResults: cities);
      }
    } else if (event is RegionPressed) {
      cities = regions
          .where((region) =>
              region.name.toLowerCase().contains(event.region.toLowerCase()))
          .first
          .citiesInfected;
      yield SearchSuccess(searchResults: cities);
    }
  }
}
