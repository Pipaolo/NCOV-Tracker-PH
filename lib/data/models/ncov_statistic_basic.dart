import 'package:freezed_annotation/freezed_annotation.dart';

part 'ncov_statistic_basic.freezed.dart';
part 'ncov_statistic_basic.g.dart';

@freezed
abstract class NcovStatisticBasic with _$NcovStatisticBasic {
  const factory NcovStatisticBasic({
    @required int totalDeaths,
    @required int totalRecovered,
    @required int totalTestsConducted,
    @required int totalInfected,
    @required int prevDeaths,
    @required int prevRecovered,
    @required int prevTestsConducted,
    @required int prevInfected,
  }) = _NcovStatisticBasic;

  factory NcovStatisticBasic.fromJson(Map<String, dynamic> json) =>
      _$NcovStatisticBasicFromJson(json);
}
