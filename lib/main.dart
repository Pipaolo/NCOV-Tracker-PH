import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'core/bloc/notification_bloc/notification_bloc.dart';
import 'injection.dart';
import 'services/notification_service.dart';
import 'ui/app_widget.dart';

final FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();

  Hive.init(appDocumentDir.path);
  configureInjection();
  getIt<NotificationService>().configureNotificationService();

  runApp(
    BlocProvider<NotificationBloc>(
      create: (context) => NotificationBloc()
        ..add(
          NotificationConfigured(),
        ),
      child: AppWidget(),
    ),
  );
}
