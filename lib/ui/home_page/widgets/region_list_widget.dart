import 'package:flutter/material.dart';

import '../../../data/models/region.dart';
import 'region_card_widget.dart';

class RegionListWidget extends StatelessWidget {
  final Map<String, Region> ncovInfecteds;
  const RegionListWidget({Key key, this.ncovInfecteds}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          String key = ncovInfecteds.keys.elementAt(i);
          return RegionCardWidget(
            region: key,
            citiesInfected: ncovInfecteds[key].citiesInfected,
            totalCount: ncovInfecteds[key].totalCount,
          );
        },
        childCount: ncovInfecteds.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }
}
