import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ncov_tracker_ph/data/models/ncov_infected.dart';
import 'package:ncov_tracker_ph/data/models/region.dart';
import 'package:ncov_tracker_ph/ui/home_page/bloc/home_page_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final HomePageBloc homePageBloc;
  Map<String, Region> regionsInfected = {};
  List<Map<String, List<NcovInfected>>> citiesInfected = [];
  SearchBloc({
    this.homePageBloc,
  }) {
    homePageBloc.listen((state) {
      if (state is HomePageSuccess) {
        regionsInfected = state.ncovInfecteds;
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
          final listOfInfectedInRegion =
              regionsInfected[event.region].citiesInfected;
          final searchResults = listOfInfectedInRegion
              .where((city) => city.keys.first.toLowerCase().startsWith(
                    event.query.toLowerCase(),
                  ))
              .toList();

          yield SearchSuccess(searchResults: searchResults);
        } catch (e) {
          print(e);
        }
      } else {
        yield SearchSuccess(searchResults: citiesInfected);
      }
    } else if (event is RegionPressed) {
      citiesInfected = regionsInfected[event.region].citiesInfected;
      yield SearchSuccess(searchResults: citiesInfected);
    }
  }
}
