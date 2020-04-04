import 'package:freezed_annotation/freezed_annotation.dart';
part 'gender_statistic.freezed.dart';
part 'gender_statistic.g.dart';

@freezed
abstract class GenderStatistic with _$GenderStatistic {
  const factory GenderStatistic({
    int value,
    String gender,
  }) = _GenderStatistic;

  factory GenderStatistic.fromJson(Map<String, dynamic> json) =>
      _$GenderStatisticFromJson(json);
}
