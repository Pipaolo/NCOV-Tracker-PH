import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncov_tracker_ph/data/models/ncov_infected.dart';
import 'package:ncov_tracker_ph/ui/cities_page/bloc/search_bloc.dart';
import 'package:ncov_tracker_ph/ui/cities_page/widgets/city_card_widget.dart';
import 'package:ncov_tracker_ph/ui/cities_page/widgets/search_bar_widget.dart';

class CitiesPage extends StatelessWidget {
  final String regionName;
  final List<Map<String, List<NcovInfected>>> citiesInfected;
  const CitiesPage({Key key, this.citiesInfected, this.regionName})
      : super(key: key);

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
              if (citiesInfected.length > 1)
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
                        final cityTitle = state.searchResults[i].keys.first;
                        return CityCardWidget(
                          city: cityTitle,
                          ncovInfected: state.searchResults[i][cityTitle],
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
