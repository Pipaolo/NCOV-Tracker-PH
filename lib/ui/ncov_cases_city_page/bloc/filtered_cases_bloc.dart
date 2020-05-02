import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../data/models/patient.dart';

part 'filtered_cases_event.dart';
part 'filtered_cases_state.dart';

class FilteredCasesBloc extends Bloc<FilteredCasesEvent, FilteredCasesState> {
  final List<Patient> cases;
  FilteredCasesBloc({
    @required this.cases,
  });
  @override
  FilteredCasesState get initialState =>
      FilteredCasesLoaded(filteredCases: cases);

  @override
  Stream<FilteredCasesState> mapEventToState(
    FilteredCasesEvent event,
  ) async* {
    if (event is CasesFilteredByRecovery) {
      yield FilteredCasesLoaded(
        filteredCases: cases
            .where(
                (element) => element.removalType.toLowerCase() == 'recovered')
            .toList(),
      );
    } else if (event is CasesFilteredByDeath) {
      yield FilteredCasesLoaded(
        filteredCases: cases
            .where((element) => element.removalType.toLowerCase() == 'died')
            .toList(),
      );
    } else if (event is CasesFilteredByGeneral) {
      yield FilteredCasesLoaded(
        filteredCases: cases,
      );
    }
  }
}
