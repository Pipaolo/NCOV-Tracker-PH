import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ncov_tracker_ph/data/models/ncov_infected.dart';
import 'package:ncov_tracker_ph/data/models/ncov_statistic_basic.dart';
import 'package:ncov_tracker_ph/data/repository/ncov_repository.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final NcovRepository ncovRepository;

  HomePageBloc({
    @required this.ncovRepository,
  });
  @override
  HomePageState get initialState => HomePageLoading();

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if (event is DataFetched) {
      yield HomePageLoading();
      try {
        final ncovStatisticBasic = await ncovRepository.fetchBasicStatistics();
        final ncovInfecteds = await ncovRepository.fetchInfectedByCities();
        yield HomePageSuccess(
          ncovInfecteds: ncovInfecteds,
          ncovStatisticBasic: ncovStatisticBasic,
        );
      } catch (e) {
        yield HomePageError(
          errorText: e.toString(),
        );
      }
    }
  }
}
