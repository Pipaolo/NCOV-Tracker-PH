import 'package:freezed_annotation/freezed_annotation.dart';

part 'ncov_statistic_basic.freezed.dart';
part 'ncov_statistic_basic.g.dart';

@freezed
abstract class NcovStatisticBasic with _$NcovStatisticBasic {
  const factory NcovStatisticBasic({
    int totalDeaths,
    int totalRecovered,
    int totalTestsConducted,
    int totalPUMs,
    int totalPUIs,
    int totalInfected,
    int totalPUIsTested,
  }) = _NcovStatisticBasic;

  factory NcovStatisticBasic.fromJson(Map<String, dynamic> json) =>
      _$NcovStatisticBasicFromJson(json);
}
