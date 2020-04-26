import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/bloc/connectivity_bloc.dart';
import '../../../data/models/ncov_statistic_basic.dart';
import '../../../data/repository/ncov_repository.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

@injectable
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final NcovRepository ncovRepository;
  final ConnectivityBloc connectivityBloc;

  HomePageBloc({
    @required this.ncovRepository,
    @required this.connectivityBloc,
  }) {
    connectivityBloc.listen((state) {
      if (state == ConnectivityState.hasInternet) {
        add(DataFetched());
      }
    });
  }
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
        yield HomePageSuccess(
          ncovStatisticBasic: ncovStatisticBasic,
        );
      } catch (e) {
        print(e);
        yield HomePageError(
          errorText: e.toString(),
        );
      }
    }
  }
}
