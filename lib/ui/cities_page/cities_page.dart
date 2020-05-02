import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/city.dart';
import 'bloc/search_bloc.dart';
import 'widgets/city_card_widget.dart';
import 'widgets/search_bar_widget.dart';

class CitiesPage extends StatelessWidget {
  final String regionName;
  final List<City> cities;
  const CitiesPage({Key key, this.cities, this.regionName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(regionName),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (cities.length > 1)
                SearchBarWidget(
                  region: regionName,
                ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchSuccess) {
                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, i) {
                        final city = cities[i];
                        return CityCardWidget(
                          city: city.name,
                          patients: state.searchResults[i].patients,
                          region: regionName,
                        );
                      },
                      itemCount: state.searchResults.length,
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
