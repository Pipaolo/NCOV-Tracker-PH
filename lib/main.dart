import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ncov_tracker_ph/ui/app_widget.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  runApp(AppWidget());
}
