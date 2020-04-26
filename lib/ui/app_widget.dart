import 'package:auto_route/auto_route.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncov_tracker_ph/data/repository/hive_repository.dart';
import 'package:ncov_tracker_ph/ui/cases_page/bloc/cases_page_bloc.dart';

import '../core/bloc/connectivity_bloc.dart';
import '../data/repository/ncov_repository.dart';
import '../routes/router.gr.dart';
import 'cities_page/bloc/search_bloc.dart';
import 'home_page/bloc/graph_bloc/graph_bloc.dart';
import 'home_page/bloc/home_page_bloc.dart';
import 'hospital_listings_page/bloc/hospital_bloc.dart';
import 'splash_page/bloc/splash_page_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<NcovRepository>(
          create: (context) => NcovRepository(dioClient: Dio()),
        ),
        RepositoryProvider<HiveRepository>(
          create: (context) => HiveRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ConnectivityBloc>(
            create: (context) => ConnectivityBloc(
              connectivity: Connectivity(),
            ),
          ),
          BlocProvider<HomePageBloc>(
            create: (context) => HomePageBloc(
              ncovRepository: RepositoryProvider.of<NcovRepository>(context),
              connectivityBloc: BlocProvider.of<ConnectivityBloc>(context),
            )..add(DataFetched()),
          ),
          BlocProvider<CasesPageBloc>(
            create: (context) => CasesPageBloc(
              ncovRepository: RepositoryProvider.of<NcovRepository>(context),
              hiveRepository: RepositoryProvider.of<HiveRepository>(context),
            )..add(CasesFetched()),
          ),
          BlocProvider<SearchBloc>(
            create: (context) => SearchBloc(
              casesPageBloc: BlocProvider.of<CasesPageBloc>(context),
            ),
          ),
          BlocProvider<GraphBloc>(
              create: (context) => GraphBloc(
                    ncovRepository:
                        RepositoryProvider.of<NcovRepository>(context),
                  )..add(StatisticsFetched())),
          BlocProvider<SplashPageBloc>(
            create: (context) => SplashPageBloc(
              hiveRepository: RepositoryProvider.of<HiveRepository>(context),
            )..add(
                AppStarted(),
              ),
          ),
          BlocProvider<HospitalBloc>(
            create: (context) => HospitalBloc(
              ncovRepository: RepositoryProvider.of<NcovRepository>(context),
              connectivityBloc: BlocProvider.of<ConnectivityBloc>(context),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: ExtendedNavigator<Router>(
            router: Router(),
            initialRoute: Routes.splashPageRoute,
          ),
        ),
      ),
    );
  }
}
