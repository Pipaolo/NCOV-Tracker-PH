import 'package:freezed_annotation/freezed_annotation.dart';

part 'age_category_statistic.freezed.dart';

@freezed
abstract class AgeCategoryStatistic with _$AgeCategoryStatistic {
  const factory AgeCategoryStatistic({
    final String category,
    final int value,
    final String sex,
  }) = _AgeCategoryStatistic;
}
