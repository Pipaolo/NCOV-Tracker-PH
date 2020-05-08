import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/ncov_statistic_basic.dart';
import '../../../data/models/region.dart';
import '../../../data/repository/hive_repository.dart';
import '../../../data/repository/ncov_repository.dart';
import '../../../utils/sorter.dart';

part 'cases_page_event.dart';
part 'cases_page_state.dart';

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
        //Fetch Both statistics from local and web
        final currentStatisticFromApi =
            await ncovRepository.fetchBasicStatistics();
        final isStorageEmpty = await hiveRepository.isLocalStorageEmpty();

        //Check if there are differences in the results
        if (!isStorageEmpty) {
          //If there are no stored currentstatistics then store then compare.

          final isCasesUpdated =
              await isNewCasesUpdated(currentStatisticFromApi);
          if (isCasesUpdated) {
            final patientsFromNetwork = await ncovRepository.fetchPatients();
            //After fetching the current cases from the internet store it in the local storage
            await hiveRepository.storeCurrentCases(patientsFromNetwork);
            //Update the currentStatistic that is stored locally
            await hiveRepository
                .storeCurrentStatistics(currentStatisticFromApi);
          }
        } else {
          //If the storage is currently empty then store the current patients
          await hiveRepository.storeCurrentStatistics(currentStatisticFromApi);
          final patientsFromNetwork = await ncovRepository.fetchPatients();

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

  Future<bool> isNewCasesUpdated(
      NcovStatisticBasic currentStatisticFromApi) async {
    final currentStatisticFromLocal =
        await hiveRepository.fetchCurrentStatisticsLocal();

    if (currentStatisticFromApi.totalInfected !=
            currentStatisticFromLocal.totalInfected &&
        currentStatisticFromApi.totalDeaths !=
            currentStatisticFromLocal.totalDeaths &&
        currentStatisticFromApi.totalRecovered !=
            currentStatisticFromLocal.totalRecovered &&
        currentStatisticFromApi.totalTestsConducted !=
            currentStatisticFromLocal.totalTestsConducted) {
      return true;
    } else {
      return false;
    }
  }
}
