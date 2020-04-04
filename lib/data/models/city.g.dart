// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_City _$_$_CityFromJson(Map<String, dynamic> json) {
  return _$_City(
    name: json['name'] as String,
    patients: (json['patients'] as List)
        ?.map((e) =>
            e == null ? null : Patient.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalCount: json['totalCount'] as int,
  );
}

Map<String, dynamic> _$_$_CityToJson(_$_City instance) => <String, dynamic>{
      'name': instance.name,
      'patients': instance.patients,
      'totalCount': instance.totalCount,
    };
