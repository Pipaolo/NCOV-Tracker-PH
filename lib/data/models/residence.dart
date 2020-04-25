import 'package:freezed_annotation/freezed_annotation.dart';

part 'residence.freezed.dart';
part 'residence.g.dart';

@freezed
abstract class Residence with _$Residence {
  const factory Residence({
    String region,
    String province,
    String city,
  }) = _Residence;

  factory Residence.fromJson(Map<String, dynamic> json) =>
      _$ResidenceFromJson(json);
}
