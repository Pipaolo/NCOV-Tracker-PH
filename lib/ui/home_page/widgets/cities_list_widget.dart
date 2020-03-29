import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/ncov_infected.dart';
import '../bloc/search_bloc/search_bloc.dart';
import 'city_card_widget.dart';

class CitiesListWidget extends StatelessWidget {
  final List<NcovInfected> ncovInfecteds;
  const CitiesListWidget({Key key, this.ncovInfecteds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return _buildList(state.searchResults);
        }
        return SliverToBoxAdapter(child: Container());
      },
    );
  }

  _buildList(Map<String, dynamic> groupedInfected) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          String key = groupedInfected.keys.elementAt(i);
          return CityCardWidget(
            city: key,
            ncovInfected: groupedInfected[key],
          );
        },
        childCount: groupedInfected.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }
}
