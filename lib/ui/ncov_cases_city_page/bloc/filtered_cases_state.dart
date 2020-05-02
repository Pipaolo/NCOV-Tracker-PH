part of 'filtered_cases_bloc.dart';

abstract class FilteredCasesState extends Equatable {
  const FilteredCasesState();
}

class FilteredCasesInitial extends FilteredCasesState {
  @override
  List<Object> get props => [];
}

class FilteredCasesError extends FilteredCasesState {
  final String errorText;
  FilteredCasesError({
    @required this.errorText,
  });
  @override
  List<Object> get props => [errorText];
}

class FilteredCasesLoaded extends FilteredCasesState {
  final List<Patient> filteredCases;

  FilteredCasesLoaded({this.filteredCases});
  @override
  List<Object> get props => [filteredCases];
}
