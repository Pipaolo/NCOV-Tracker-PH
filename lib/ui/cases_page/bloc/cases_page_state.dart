part of 'cases_page_bloc.dart';

abstract class CasesPageState extends Equatable {
  const CasesPageState();
}

class CasesPageInitial extends CasesPageState {
  @override
  List<Object> get props => [];
}

class CasesPageLoading extends CasesPageState {
  @override
  List<Object> get props => [];
}

class CasesPageSuccess extends CasesPageState {
  final List<Region> regions;
  CasesPageSuccess({
    @required this.regions,
  });
  @override
  List<Object> get props => [regions];
}

class CasesPageError extends CasesPageState {
  final String errorText;
  CasesPageError({
    @required this.errorText,
  });
  @override
  List<Object> get props => [errorText];
}
