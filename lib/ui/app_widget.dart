import 'package:auto_route/auto_route.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/bloc/connectivity_bloc.dart';
import '../data/repository/hive_repository.dart';
import '../data/repository/ncov_repository.dart';
import '../injection.dart';
import '../routes/router.gr.dart';
import 'cases_page/bloc/cases_page_bloc.dart';
import 'home_page/bloc/graph_bloc/graph_bloc.dart';
import 'home_page/bloc/home_page_bloc.dart';
import 'hospital_listings_page/bloc/hospital_bloc.dart';
import 'splash_page/bloc/splash_page_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityBloc>(
          create: (context) => ConnectivityBloc(
            connectivity: Connectivity(),
          ),
        ),
        BlocProvider<HomePageBloc>(
          create: (context) => HomePageBloc(
            ncovRepository: getIt<NcovRepository>(),
            connectivityBloc: BlocProvider.of<ConnectivityBloc>(context),
          )..add(DataFetched()),
        ),
        BlocProvider<CasesPageBloc>(
          create: (context) => CasesPageBloc(
            ncovRepository: getIt<NcovRepository>(),
            hiveRepository: getIt<HiveRepository>(),
          ),
        ),
        BlocProvider<GraphBloc>(
            create: (context) => GraphBloc(
                  ncovRepository: getIt<NcovRepository>(),
                )..add(StatisticsFetched())),
        BlocProvider<SplashPageBloc>(
          create: (context) => SplashPageBloc(
            hiveRepository: getIt<HiveRepository>(),
          )..add(
              AppStarted(),
            ),
        ),
        BlocProvider<HospitalBloc>(
          create: (context) => HospitalBloc(
            ncovRepository: getIt<NcovRepository>(),
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
    );
  }
}
