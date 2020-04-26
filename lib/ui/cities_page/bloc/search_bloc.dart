import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/city.dart';
import '../../../data/models/region.dart';
import '../../cases_page/bloc/cases_page_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final CasesPageBloc casesPageBloc;
  List<Region> regions = [];
  List<City> cities = [];
  SearchBloc({
    this.casesPageBloc,
  }) {
    casesPageBloc.listen((state) {
      if (state is CasesPageSuccess) {
        regions = state.regions;
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
          cities.sort((a, b) => b.totalCount.compareTo(a.totalCount));
          yield SearchSuccess(searchResults: searchResults);
        } catch (e) {
          print(e);
        }
      } else {
        cities.sort((a, b) => b.totalCount.compareTo(a.totalCount));
        yield SearchSuccess(searchResults: cities);
      }
    } else if (event is RegionPressed) {
      cities = regions
          .where((region) =>
              region.name.toLowerCase() == event.region.toLowerCase())
          .first
          .citiesInfected;
      cities.sort((a, b) => b.totalCount.compareTo(a.totalCount));
      yield SearchSuccess(searchResults: cities);
    }
  }
}
