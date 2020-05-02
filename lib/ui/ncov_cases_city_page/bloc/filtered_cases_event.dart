part of 'filtered_cases_bloc.dart';

abstract class FilteredCasesEvent extends Equatable {
  const FilteredCasesEvent();
}

class CasesFilteredByRecovery extends FilteredCasesEvent {
  @override
  List<Object> get props => [];
}

class CasesFilteredByDeath extends FilteredCasesEvent {
  @override
  List<Object> get props => [];
}

class CasesFilteredByGeneral extends FilteredCasesEvent {
  @override
  List<Object> get props => [];
}
