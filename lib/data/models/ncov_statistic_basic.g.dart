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
    totalInfected: json['totalInfected'] as int,
    prevDeaths: json['prevDeaths'] as int,
    prevRecovered: json['prevRecovered'] as int,
    prevTestsConducted: json['prevTestsConducted'] as int,
    prevInfected: json['prevInfected'] as int,
  );
}

Map<String, dynamic> _$_$_NcovStatisticBasicToJson(
        _$_NcovStatisticBasic instance) =>
    <String, dynamic>{
      'totalDeaths': instance.totalDeaths,
      'totalRecovered': instance.totalRecovered,
      'totalTestsConducted': instance.totalTestsConducted,
      'totalInfected': instance.totalInfected,
      'prevDeaths': instance.prevDeaths,
      'prevRecovered': instance.prevRecovered,
      'prevTestsConducted': instance.prevTestsConducted,
      'prevInfected': instance.prevInfected,
    };
