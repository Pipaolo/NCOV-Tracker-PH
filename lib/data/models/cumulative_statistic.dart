import 'package:freezed_annotation/freezed_annotation.dart';

part 'cumulative_statistic.g.dart';
part 'cumulative_statistic.freezed.dart';

@freezed
abstract class CumulativeStatistic with _$CumulativeStatistic {
  const factory CumulativeStatistic(
    String date,
    int value,
  ) = _CumulativeStatistic;

  factory CumulativeStatistic.fromJson(Map<String, dynamic> json) =>
      _$CumulativeStatisticFromJson(json);
}
