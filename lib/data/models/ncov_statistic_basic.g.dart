// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ncov_statistic_basic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NcovStatisticBasic _$_$_NcovStatisticBasicFromJson(
    Map<String, dynamic> json) {
  return _$_NcovStatisticBasic(
    totalDeaths: json['totalDeaths'] as int,
    totalRecovered: json['totalRecovered'] as int,
    totalTestsConducted: json['totalTestsConducted'] as int,
    totalPUMs: json['totalPUMs'] as int,
    totalPUIs: json['totalPUIs'] as int,
    totalInfected: json['totalInfected'] as int,
  );
}

Map<String, dynamic> _$_$_NcovStatisticBasicToJson(
        _$_NcovStatisticBasic instance) =>
    <String, dynamic>{
      'totalDeaths': instance.totalDeaths,
      'totalRecovered': instance.totalRecovered,
      'totalTestsConducted': instance.totalTestsConducted,
      'totalPUMs': instance.totalPUMs,
      'totalPUIs': instance.totalPUIs,
      'totalInfected': instance.totalInfected,
    };
