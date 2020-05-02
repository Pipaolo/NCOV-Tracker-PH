// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Region _$_$_RegionFromJson(Map<String, dynamic> json) {
  return _$_Region(
    totalCount: json['totalCount'] as int,
    name: json['name'] as String,
    citiesInfected: (json['citiesInfected'] as List)
        ?.map(
            (e) => e == null ? null : City.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_RegionToJson(_$_Region instance) => <String, dynamic>{
      'totalCount': instance.totalCount,
      'name': instance.name,
      'citiesInfected': instance.citiesInfected,
    };
