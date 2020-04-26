import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:ncov_tracker_ph/data/repository/hive_repository.dart';

part 'splash_page_event.dart';
part 'splash_page_state.dart';

@injectable
class SplashPageBloc extends Bloc<SplashPageEvent, SplashPageState> {
  final HiveRepository hiveRepository;
  SplashPageBloc({
    @required this.hiveRepository,
  });
  @override
  SplashPageState get initialState => SplashPageInitial();

  @override
  Stream<SplashPageState> mapEventToState(
    SplashPageEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool isOpenedOnce = await hiveRepository.fetchAppState();
      if (isOpenedOnce) {
        yield AppOpenedOnce();
      } else {
        yield AppNotOpenedOnce();
      }
    } else if (event is InstanceStored) {
      await hiveRepository.storeAppState();
    }
  }
}
