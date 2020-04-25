import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:ncov_tracker_ph/data/models/region.dart';

import 'package:ncov_tracker_ph/data/repository/ncov_repository.dart';
import 'package:ncov_tracker_ph/utils/sorter.dart';

part 'cases_page_event.dart';
part 'cases_page_state.dart';

class CasesPageBloc extends Bloc<CasesPageEvent, CasesPageState> {
  final NcovRepository ncovRepository;
  CasesPageBloc({
    @required this.ncovRepository,
  });
  @override
  CasesPageState get initialState => CasesPageInitial();

  @override
  Stream<CasesPageState> mapEventToState(
    CasesPageEvent event,
  ) async* {
    if (event is CasesFetched) {
      yield CasesPageLoading();
      try {
        final patients = await ncovRepository.fetchPatients();
        final groupedPatientsByRegion = await sortRegions(patients);
        yield CasesPageSuccess(
          regions: groupedPatientsByRegion,
        );
      } catch (e) {
        yield CasesPageError(errorText: e.toString());
      }
    }
  }
}
