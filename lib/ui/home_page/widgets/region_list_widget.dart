import 'package:flutter/material.dart';

import '../../../data/models/region.dart';
import 'region_card_widget.dart';

class RegionListWidget extends StatelessWidget {
  final List<Region> patientsGroupedByRegion;
  const RegionListWidget({Key key, this.patientsGroupedByRegion})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          final region = patientsGroupedByRegion[i];
          return RegionCardWidget(
            region: region.name,
            cities: region.citiesInfected,
            totalCount: region.totalCount,
          );
        },
        childCount: patientsGroupedByRegion.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }
}
