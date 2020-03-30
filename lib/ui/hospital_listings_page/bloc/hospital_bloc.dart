import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/hospital.dart';
import '../../../data/repository/ncov_repository.dart';

part 'hospital_event.dart';
part 'hospital_state.dart';

class HospitalBloc extends Bloc<HospitalEvent, HospitalState> {
  final NcovRepository ncovRepository;
  List<Hospital> hospitals = [];

  HospitalBloc({this.ncovRepository});

  @override
  HospitalState get initialState => HospitalLoading();

  @override
  Stream<HospitalState> mapEventToState(
    HospitalEvent event,
  ) async* {
    if (event is HospitalListingsPressed) {
      yield HospitalLoading();
      try {
        hospitals = await ncovRepository.fetchHospitals();
        yield HospitalSuccess(hospitalListings: hospitals);
      } catch (e) {
        yield HospitalError(errorText: e.toString());
      }
    } else if (event is HospitalSearched) {
      if (event.query.isNotEmpty) {
        yield HospitalSuccess(
            hospitalListings: hospitals
                .where((element) =>
                    element.name.toLowerCase().contains(event.query))
                .toList());
      } else {
        yield HospitalSuccess(hospitalListings: hospitals);
      }
    }
  }
}
