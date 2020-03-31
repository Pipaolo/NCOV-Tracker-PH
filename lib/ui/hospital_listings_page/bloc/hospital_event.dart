part of 'hospital_bloc.dart';

abstract class HospitalEvent extends Equatable {
  const HospitalEvent();
}

class HospitalListingsPressed extends HospitalEvent {
  @override
  List<Object> get props => [];
}

class HospitalDirectoryLoadedMore extends HospitalEvent {
  @override
  List<Object> get props => [];
}

class HospitalSearched extends HospitalEvent {
  final String query;

  HospitalSearched({this.query});
  @override
  List<Object> get props => [query];
}
