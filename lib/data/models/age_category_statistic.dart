import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ncov_tracker_ph/data/models/gender_statistic.dart';

part 'age_category_statistic.freezed.dart';

@freezed
abstract class AgeCategoryStatistic with _$AgeCategoryStatistic {
  const factory AgeCategoryStatistic({
    final String ageGroup,
    final GenderStatistic male,
    final GenderStatistic female,
  }) = _AgeCategoryStatistic;
}
