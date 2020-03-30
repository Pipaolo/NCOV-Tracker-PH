part of 'hospital_bloc.dart';

abstract class HospitalState extends Equatable {
  const HospitalState();
}

class HospitalInitial extends HospitalState {
  @override
  List<Object> get props => [];
}

class HospitalLoading extends HospitalState {
  @override
  List<Object> get props => [];
}

class HospitalSuccess extends HospitalState {
  final List<Hospital> hospitalListings;
  HospitalSuccess({
    this.hospitalListings,
  });
  @override
  List<Object> get props => [hospitalListings];
}

class HospitalError extends HospitalState {
  final String errorText;

  HospitalError({this.errorText});
  @override
  List<Object> get props => [errorText];
}
