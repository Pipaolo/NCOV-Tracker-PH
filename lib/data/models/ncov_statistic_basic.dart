import 'package:freezed_annotation/freezed_annotation.dart';
part 'ncov_statistic_basic.freezed.dart';

@freezed
abstract class NcovStatisticBasic with _$NcovStatisticBasic {
  const factory NcovStatisticBasic(
      {int totalDeaths,
      int totalRecovered,
      int totalTestsConducted,
      int totalPUMs,
      int totalPUIs,
      int totalInfected}) = _NcovStatisticBasic;
}
