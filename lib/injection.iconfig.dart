// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:ncov_tracker_ph/core/injectable_module.dart';
import 'package:ncov_tracker_ph/data/repository/hive_repository.dart';
import 'package:ncov_tracker_ph/data/repository/ncov_repository.dart';
import 'package:ncov_tracker_ph/services/notification_service.dart';
import 'package:ncov_tracker_ph/ui/splash_page/bloc/splash_page_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final injectableModule = _$InjectableModule();
  g.registerLazySingleton<Dio>(() => injectableModule.dio);
  g.registerLazySingleton<HiveRepository>(() => HiveRepository());
  g.registerLazySingleton<NcovRepository>(
      () => NcovRepository(dioClient: g<Dio>()));
  g.registerFactory<NotificationService>(
      () => NotificationService(g<NcovRepository>()));
  g.registerFactory<SplashPageBloc>(
      () => SplashPageBloc(hiveRepository: g<HiveRepository>()));
}

class _$InjectableModule extends InjectableModule {}
