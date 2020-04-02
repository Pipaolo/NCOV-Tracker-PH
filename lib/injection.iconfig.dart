// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:ncov_tracker_ph/core/injectable_module.dart';
import 'package:ncov_tracker_ph/data/repository/ncov_repository.dart';
import 'package:ncov_tracker_ph/services/notification_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final injectableModule = _$InjectableModule();
  g.registerLazySingleton<Dio>(() => injectableModule.dio);
  g.registerLazySingleton<NcovRepository>(
      () => NcovRepository(dioClient: g<Dio>()));
  g.registerFactory<NotificationService>(
      () => NotificationService(g<NcovRepository>()));
}

class _$InjectableModule extends InjectableModule {}
