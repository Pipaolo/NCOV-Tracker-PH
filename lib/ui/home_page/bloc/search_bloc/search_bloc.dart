import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ncov_tracker_ph/data/models/ncov_infected.dart';

import 'package:ncov_tracker_ph/ui/home_page/bloc/home_page_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final HomePageBloc homePageBloc;
  Map<String, dynamic> citiesInfected = {};
  SearchBloc({
    this.homePageBloc,
  }) {
    homePageBloc.listen((state) {
      if (state is HomePageSuccess) {
        citiesInfected =
            groupBy(state.ncovInfecteds, (NcovInfected obj) => obj.residence);
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
          final results = citiesInfected.keys
              .where((key) => key.toLowerCase().startsWith(
                    event.query.toLowerCase(),
                  ))
              .toList();

          final Map<String, List<NcovInfected>> filteredResults = {};
          results.forEach(
            (result) => filteredResults[result] = citiesInfected[result],
          );

          yield SearchSuccess(searchResults: filteredResults);
        } catch (e) {
          print(e);
        }
      } else {
        yield SearchSuccess(searchResults: citiesInfected);
      }
    }
  }
}
