import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ncov_tracker_ph/core/bloc/connectivity_bloc.dart';

import '../../../data/models/hospital.dart';
import '../../../data/repository/ncov_repository.dart';

part 'hospital_event.dart';
part 'hospital_state.dart';

class HospitalBloc extends Bloc<HospitalEvent, HospitalState> {
  final NcovRepository ncovRepository;
  final ConnectivityBloc connectivityBloc;
  List<Hospital> hospitals = [];

  HospitalBloc({
    @required this.ncovRepository,
    @required this.connectivityBloc,
  }) {
    connectivityBloc.listen((state) {
      if (state == ConnectivityState.hasInternet) {
        add(HospitalListingsPressed());
      }
    });
  }

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
