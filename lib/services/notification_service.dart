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
import '../main.dart';
import 'firebase_remote_config_service.dart';

@injectable
class NotificationService {
  final IFirebaseRemoteService firebaseRemoteService;
  final NcovRepository ncovRepository;
  NotificationService(this.ncovRepository, this.firebaseRemoteService);
  static void showNotification(
    NcovStatisticBasic currentStatistic,
  ) async {
    final dataToBePassed = jsonEncode(currentStatistic.toJson());
    final totalInfectedAdded =
        currentStatistic.totalInfected - currentStatistic.prevInfected;
    final androidChannelSpecifics = AndroidNotificationDetails(
      '0',
      'ncov_tracker_ph',
      'increase number of infecteds',
      visibility: NotificationVisibility.Public,
      enableVibration: true,
      importance: Importance.High,
      priority: Priority.High,
      enableLights: true,
      styleInformation: BigTextStyleInformation(
        'The number of cases in the Philippines has increase by: $totalInfectedAdded',
        contentTitle: '<b>NOTICE:</b>',
        htmlFormatBigText: true,
        htmlFormatTitle: true,
        htmlFormatContentTitle: true,
      ),
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
      print('NCOV TRACKER PH: Checking if cases changed.');
      final currStatistics = await ncovRepository.fetchBasicStatistics();
      final prevStatisticsRaw = box.get('currentStatistics');

      //Check if the current value is the same or not
      if (prevStatisticsRaw != null) {
        final NcovStatisticBasic prevStatistics = NcovStatisticBasic(
          totalDeaths: prevStatisticsRaw['totalDeaths'],
          totalInfected: prevStatisticsRaw['totalInfected'],
          totalRecovered: prevStatisticsRaw['totalRecovered'],
          totalTestsConducted: prevStatisticsRaw['totalTestsConducted'],
          prevTestsConducted: prevStatisticsRaw['prevTestsConducted'],
          prevDeaths: prevStatisticsRaw['prevDeaths'],
          prevInfected: prevStatisticsRaw['prevInfected'],
          prevRecovered: prevStatisticsRaw['prevRecovered'],
        );

        if (currStatistics.totalInfected != prevStatistics.totalInfected) {
          box.put('currentStatistics', currStatistics.toJson());
          box.put('prevStatistics', prevStatistics.toJson());
          showNotification(currStatistics);
        }
      } else {
        box.put('currentStatistics', currStatistics.toJson());
      }
    } on SocketException catch (e) {
      print(e);
      print('No Internet Connection, cannot fetch current statistics');
    } catch (e) {
      print('NCOV Tracker PH ERROR: $e');
    }
  }

  Future<void> configureNotificationService() async {
    await AndroidAlarmManager.initialize();
    await AndroidAlarmManager.periodic(
      Duration(hours: 1),
      0,
      sendCurrentCases,
      exact: true,
      rescheduleOnReboot: true,
      wakeup: true,
    );
  }
}
