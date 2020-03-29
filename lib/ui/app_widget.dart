import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncov_tracker_ph/data/repository/ncov_repository.dart';
import 'package:ncov_tracker_ph/routes/router.gr.dart';
import 'package:ncov_tracker_ph/ui/home_page/bloc/graph_bloc/graph_bloc.dart';
import 'package:ncov_tracker_ph/ui/home_page/bloc/search_bloc/search_bloc.dart';

import 'home_page/bloc/home_page_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<NcovRepository>(
      create: (context) => NcovRepository(dioClient: Dio()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomePageBloc>(
            create: (context) => HomePageBloc(
              ncovRepository: RepositoryProvider.of<NcovRepository>(context),
            )..add(DataFetched()),
          ),
          BlocProvider<SearchBloc>(
            create: (context) => SearchBloc(
              homePageBloc: BlocProvider.of<HomePageBloc>(context),
            ),
          ),
          BlocProvider<GraphBloc>(
            create: (context) => GraphBloc(
              homePageBloc: BlocProvider.of<HomePageBloc>(context),
              ncovRepository: RepositoryProvider.of<NcovRepository>(context),
            ),
          )
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
