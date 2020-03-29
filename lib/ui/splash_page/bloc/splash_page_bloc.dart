import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'splash_page_event.dart';
part 'splash_page_state.dart';

class SplashPageBloc extends Bloc<SplashPageEvent, SplashPageState> {
  @override
  SplashPageState get initialState => SplashPageInitial();

  @override
  Stream<SplashPageState> mapEventToState(
    SplashPageEvent event,
  ) async* {
    if (event is AppStarted) {
      final box = await Hive.openBox('app');
      final isOpenedOnce = box.get('app_opened_once');
      if (isOpenedOnce != null) {
        yield AppOpenedOnce();
      } else {
        yield AppNotOpenedOnce();
      }
    } else if (event is InstanceStored) {
      final box = await Hive.openBox('app');
      box.put('app_opened_once', true);
    }
  }
}
