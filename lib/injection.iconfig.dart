// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:ncov_tracker_ph/core/injectable_module.dart';
import 'package:ncov_tracker_ph/data/repository/hive_repository.dart';
import 'package:ncov_tracker_ph/data/repository/ncov_repository.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:ncov_tracker_ph/services/firebase_remote_config_service.dart';
import 'package:ncov_tracker_ph/services/notification_service.dart';
import 'package:ncov_tracker_ph/ui/cases_page/bloc/cases_page_bloc.dart';
import 'package:ncov_tracker_ph/ui/cities_page/bloc/search_bloc.dart';
import 'package:ncov_tracker_ph/ui/home_page/bloc/graph_bloc/graph_bloc.dart';
import 'package:ncov_tracker_ph/ui/home_page/bloc/home_page_bloc.dart';
import 'package:ncov_tracker_ph/core/bloc/connectivity_bloc.dart';
import 'package:ncov_tracker_ph/ui/hospital_listings_page/bloc/hospital_bloc.dart';
import 'package:ncov_tracker_ph/ui/splash_page/bloc/splash_page_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final injectableModule = _$InjectableModule();
  final iFirebaseRemoteService = _$IFirebaseRemoteService();
  g.registerLazySingleton<Dio>(() => injectableModule.dio);
  g.registerLazySingleton<HiveRepository>(() => HiveRepository());
  g.registerLazySingleton<NcovRepository>(
      () => NcovRepository(dioClient: g<Dio>()));
  g.registerFactoryAsync<RemoteConfig>(
      () => iFirebaseRemoteService.remoteConfig);
  g.registerFactory<IFirebaseRemoteService>(() => FirebaseRemoteService());
  g.registerFactory<NotificationService>(() =>
      NotificationService(g<NcovRepository>(), g<IFirebaseRemoteService>()));
  g.registerFactory<CasesPageBloc>(() => CasesPageBloc(
      ncovRepository: g<NcovRepository>(),
      hiveRepository: g<HiveRepository>()));
  g.registerFactory<SearchBloc>(
      () => SearchBloc(casesPageBloc: g<CasesPageBloc>()));
  g.registerFactory<GraphBloc>(
      () => GraphBloc(ncovRepository: g<NcovRepository>()));
  g.registerFactory<HomePageBloc>(() => HomePageBloc(
      ncovRepository: g<NcovRepository>(),
      connectivityBloc: g<ConnectivityBloc>()));
  g.registerFactory<HospitalBloc>(() => HospitalBloc(
      ncovRepository: g<NcovRepository>(),
      connectivityBloc: g<ConnectivityBloc>()));
  g.registerFactory<SplashPageBloc>(
      () => SplashPageBloc(hiveRepository: g<HiveRepository>()));
}

class _$InjectableModule extends InjectableModule {}

class _$IFirebaseRemoteService extends IFirebaseRemoteService {}
