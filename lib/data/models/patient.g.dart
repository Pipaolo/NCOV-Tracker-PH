// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';
//ignore_for_file:non_constant_identifier_names
// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Patient _$_$_PatientFromJson(Map<String, dynamic> json) {
  return _$_Patient(
    caseNumber: json['caseNumber'] as String,
    sex: json['sex'] as String,
    age: json['age'] as int,
    dateDeath: json['dateDeath'] as String,
    dateRecovery: json['dateRecovery'] as String,
    dateReportConfirmed: json['dateReportConfirmed'] as String,
    dateReportRemoved: json['dateReportRemoved'] as String,
    admitted: json['admitted'] as bool,
    healthStatus: json['healthStatus'] as String,
    removalType: json['removalType'] as String,
    residence: json['residence'] == null
        ? null
        : Residence.fromJson(json['residence'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PatientToJson(_$_Patient instance) =>
    <String, dynamic>{
      'caseNumber': instance.caseNumber,
      'sex': instance.sex,
      'age': instance.age,
      'dateDeath': instance.dateDeath,
      'dateRecovery': instance.dateRecovery,
      'dateReportConfirmed': instance.dateReportConfirmed,
      'dateReportRemoved': instance.dateReportRemoved,
      'admitted': instance.admitted,
      'healthStatus': instance.healthStatus,
      'removalType': instance.removalType,
      'residence': instance.residence,
    };
