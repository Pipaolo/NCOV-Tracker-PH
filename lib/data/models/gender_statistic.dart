import 'package:freezed_annotation/freezed_annotation.dart';
part 'gender_statistic.freezed.dart';

@freezed
abstract class GenderStatistic with _$GenderStatistic {
  const factory GenderStatistic({
    int value,
    String gender,
  }) = _GenderStatistic;
}
