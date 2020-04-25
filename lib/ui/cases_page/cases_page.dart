import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/connectivity_bloc.dart';
import '../../data/models/region.dart';
import '../widgets/no_connection_widget.dart';
import 'bloc/cases_page_bloc.dart';
import 'widgets/region_list_widget.dart';

class CasesPage extends StatelessWidget {
  const CasesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
      switch (state) {
        case ConnectivityState.hasInternet:
          return _buildHasConnection();
          break;
        case ConnectivityState.noInternet:
          return _buildNoConnection(context);
          break;
      }
      return Container();
    });
  }

  _buildNoConnection(BuildContext context) {
    return Scaffold(
      body: NoConnectionWidget(),
    );
  }

  _buildHasConnection() {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Cases'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: BlocBuilder<CasesPageBloc, CasesPageState>(
              builder: (context, state) {
            if (state is CasesPageLoading) {
              return _buildLoading();
            } else if (state is CasesPageSuccess) {
              return _buildSuccess(state.regions);
            } else if (state is CasesPageError) {
              return _buildError(state.errorText);
            }
            return Container();
          }),
        ),
      ),
    );
  }

  _buildLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          const SizedBox(height: 10),
          Text(
            'Fetching cases, please wait... \nThis may take while.',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  _buildSuccess(List<Region> regions) {
    return RegionListWidget(
      patientsGroupedByRegion: regions,
    );
  }

  _buildError(String errorText) {
    return Center(
      child: Text('Woops something bad happened! $errorText'),
    );
  }
}
