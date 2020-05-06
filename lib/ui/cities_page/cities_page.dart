import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncov_tracker_ph/ui/cities_page/bloc/cities_search/cities_search_bloc.dart';

import '../../data/models/city.dart';
import 'widgets/city_card_widget.dart';
import 'widgets/search_bar_widget.dart';

class CitiesPage extends StatelessWidget implements AutoRouteWrapper {
  final String regionName;
  final List<City> cities;
  const CitiesPage({Key key, this.cities, this.regionName}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<CitiesSearchBloc>(
        create: (context) => CitiesSearchBloc(cities: cities),
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(regionName),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (cities.length > 1) SearchBarWidget(),
            BlocBuilder<CitiesSearchBloc, CitiesSearchState>(
              builder: (context, state) {
                if (state is CitiesSearchResultsLoaded) {
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, i) {
                      final city = state.cities[i];
                      return CityCardWidget(
                        city: city.name,
                        patients: state.cities[i].patients,
                        region: regionName,
                      );
                    },
                    itemCount: state.cities.length,
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
