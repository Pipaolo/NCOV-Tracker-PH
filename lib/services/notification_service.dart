import 'dart:convert';
import 'dart:io';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../data/models/ncov_statistic_basic.dart';
import '../data/repository/ncov_repository.dart';
import '../injection.dart';
import '../main.dart';
import 'firebase_remote_config_service.dart';

@injectable
class NotificationService {
  final IFirebaseRemoteService firebaseRemoteService;
  final NcovRepository ncovRepository;
  NotificationService(this.ncovRepository, this.firebaseRemoteService);
  static void showNotification(NcovStatisticBasic currentStatistic,
      NcovStatisticBasic prevStatistic) async {
    final dataToBePassed =
        jsonEncode([currentStatistic.toJson(), prevStatistic.toJson()]);

    final totalInfectedAdded =
        currentStatistic.totalInfected - prevStatistic.totalInfected;
    final androidChannelSpecifics = AndroidNotificationDetails(
      '0',
      'ncov_tracker_ph',
      'increase number of infecteds',
      visibility: NotificationVisibility.Public,
      enableVibration: true,
      importance: Importance.High,
      priority: Priority.High,
      enableLights: true,
      style: AndroidNotificationStyle.BigText,
      styleInformation: BigTextStyleInformation(
          'The number of cases in the Philippines has increase by: $totalInfectedAdded',
          contentTitle: '<b>NOTICE:</b>',
          htmlFormatBigText: true,
          htmlFormatTitle: true,
          htmlFormatContentTitle: true),
      category: 'status',
    );
    final platformChannelSpecifics =
        NotificationDetails(androidChannelSpecifics, null);
    await notificationsPlugin.show(
        0,
        'NOTICE:',
        'The number of cases in the Philippines has increase by: $totalInfectedAdded',
        platformChannelSpecifics,
        payload: dataToBePassed);
  }

  static void sendCurrentCases() async {
    try {
      final NcovRepository ncovRepository = NcovRepository(dioClient: Dio());
      final appDocumentDir = await getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);
      Box box = await Hive.openBox('app');

      //Fetch Current Statistics
      print('NCOV TRACKER PH: Checking if cases');
      final statistics = await ncovRepository.fetchBasicStatistics();

      //Check if the current value is the same or not
      if (box.get('currentStatistics') != null) {
        final rawData = box.get('currentStatistics');
        final NcovStatisticBasic currentStatistics = NcovStatisticBasic(
          totalDeaths: rawData['totalDeaths'],
          totalInfected: rawData['totalInfected'],
          totalPUIs: rawData['totalPUIs'],
          totalPUMs: rawData['totalPUMs'],
          totalRecovered: rawData['totalRecovered'],
          totalTestsConducted: rawData['totalTestsConducted'],
        );

        if (currentStatistics.totalInfected != statistics.totalInfected) {
          box.put('currentStatistics', statistics.toJson());
          box.put('prevStatistics', currentStatistics.toJson());
          showNotification(statistics, currentStatistics);
        }
      } else {
        box.put('currentStatistics', statistics.toJson());
      }
    } on SocketException catch (e) {
      print(e);
      print('No Internet Connection, cannot fetch current statistics');
    } catch (e) {
      print('NCOV Tracker PH ERROR: ${e.toString()}');
    }
  }

  Future<void> configureNotificationService() async {
    final remoteService = await getIt<IFirebaseRemoteService>().remoteConfig;
    final int repeatEveryHours =
        int.tryParse(remoteService.getString('notificationDurationTimer')) ?? 6;
    await AndroidAlarmManager.initialize();
    await AndroidAlarmManager.periodic(
      Duration(hours: repeatEveryHours),
      0,
      sendCurrentCases,
      exact: true,
      rescheduleOnReboot: true,
      wakeup: true,
    );
  }
}
