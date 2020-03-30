part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();
}

class HomePageInitial extends HomePageState {
  @override
  List<Object> get props => [];
}

class HomePageLoading extends HomePageState {
  @override
  List<Object> get props => [];
}

class HomePageSuccess extends HomePageState {
  final NcovStatisticBasic ncovStatisticBasic;
  final List<Region> patientsGroupedByRegion;
  HomePageSuccess({
    this.ncovStatisticBasic,
    this.patientsGroupedByRegion,
  });
  @override
  List<Object> get props => [
        ncovStatisticBasic,
        patientsGroupedByRegion,
      ];
}

class HomePageError extends HomePageState {
  final String errorText;
  HomePageError({
    this.errorText,
  });
  @override
  List<Object> get props => [errorText];
}
