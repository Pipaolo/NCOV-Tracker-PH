part of 'cases_page_bloc.dart';

abstract class CasesPageEvent extends Equatable {
  const CasesPageEvent();
}

class CasesFetched extends CasesPageEvent {
  @override
  List<Object> get props => [];
}
