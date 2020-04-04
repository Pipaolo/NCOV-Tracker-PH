import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ncov_tracker_ph/data/models/city.dart';

part 'region.freezed.dart';
part 'region.g.dart';

@freezed
abstract class Region with _$Region {
  const factory Region({
    int totalCount,
    String name,
    List<City> citiesInfected,
  }) = _Region;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
}
