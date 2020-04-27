import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../data/models/ncov_statistic_basic.dart';
import '../../../main.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  @override
  NotificationState get initialState => NotificationIdleState();

  @override
  Stream<NotificationState> mapEventToState(
    NotificationEvent event,
  ) async* {
    if (event is NotificationPressed) {
      final currentStatistic =
          NcovStatisticBasic.fromJson(jsonDecode(event.updatedStatistics));

      yield NotificationShownState(
        currentStatistic: currentStatistic,
      );

      await Future.delayed(Duration(seconds: 10));
      yield NotificationIdleState();
    } else if (event is NotificationConfigured) {
      final initializationSettingsAndroid =
          AndroidInitializationSettings('launcher_icon');
      final initializationSettings =
          InitializationSettings(initializationSettingsAndroid, null);

      await notificationsPlugin.initialize(
        initializationSettings,
        onSelectNotification: (payload) async {
          if (payload != null) {
            add(NotificationPressed(updatedStatistics: payload));
          }
        },
      );
    }
  }
}
