import 'package:freezed_annotation/freezed_annotation.dart';

import 'ncov_infected.dart';
part 'region.freezed.dart';

@freezed
abstract class Region with _$Region {
  const factory Region({
    int totalCount,
    List<Map<String, List<NcovInfected>>> citiesInfected,
  }) = _Region;
}
