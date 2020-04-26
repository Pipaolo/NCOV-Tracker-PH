import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:ncov_tracker_ph/data/models/region.dart';
import 'package:ncov_tracker_ph/data/repository/hive_repository.dart';

import 'package:ncov_tracker_ph/data/repository/ncov_repository.dart';
import 'package:ncov_tracker_ph/utils/sorter.dart';

part 'cases_page_event.dart';
part 'cases_page_state.dart';

@injectable
class CasesPageBloc extends Bloc<CasesPageEvent, CasesPageState> {
  final NcovRepository ncovRepository;
  final HiveRepository hiveRepository;
  CasesPageBloc({
    @required this.ncovRepository,
    @required this.hiveRepository,
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
        final isNewCasesUpdated = await ncovRepository.isNewCasesAdded();
        final isStorageEmpty = await hiveRepository.isLocalStorageEmpty();

        if (!isStorageEmpty) {
          if (isNewCasesUpdated) {
            final patientsFromNetwork = await ncovRepository.fetchPatients();
            //After fetching the current cases from the internet store it in the local storage
            await hiveRepository.storeCurrentCases(patientsFromNetwork);
          }
        } else {
          final patientsFromNetwork = await ncovRepository.fetchPatients();
          //After fetching the current cases from the internet store it in the local storage
          await hiveRepository.storeCurrentCases(patientsFromNetwork);
        }

        final patientsFromStorage =
            await hiveRepository.fetchCurrentCasesFromLocal();
        final groupedPatientsByRegion = await sortRegions(patientsFromStorage);
        yield CasesPageSuccess(
          regions: groupedPatientsByRegion,
        );
      } catch (e) {
        yield CasesPageError(errorText: e.toString());
      }
    }
  }
}
