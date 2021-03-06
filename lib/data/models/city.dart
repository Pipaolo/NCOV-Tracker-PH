import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ncov_tracker_ph/data/models/patient.dart';
part 'city.freezed.dart';
part 'city.g.dart';

@freezed
abstract class City with _$City {
  const factory City({
    String name,
    List<Patient> patients,
    int totalCount,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
