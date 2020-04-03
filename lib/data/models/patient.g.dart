// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Patient _$_$_PatientFromJson(Map<String, dynamic> json) {
  return _$_Patient(
    caseNumber: json['caseNumber'] as String,
    caseNumberInt: json['caseNumberInt'] as int,
    sex: json['sex'] as String,
    age: json['age'] as int,
    nationality: json['nationality'] as String,
    travelHistory: json['travelHistory'] as String,
    confirmedDate: json['confirmedDate'] as String,
    admittedTo: json['admittedTo'] as String,
    residenceCity: json['residenceCity'] as String,
    residenceProv: json['residenceProv'] as String,
    status: json['status'] as String,
    symptoms: json['symptoms'] as String,
  );
}

Map<String, dynamic> _$_$_PatientToJson(_$_Patient instance) =>
    <String, dynamic>{
      'caseNumber': instance.caseNumber,
      'caseNumberInt': instance.caseNumberInt,
      'sex': instance.sex,
      'age': instance.age,
      'nationality': instance.nationality,
      'travelHistory': instance.travelHistory,
      'confirmedDate': instance.confirmedDate,
      'admittedTo': instance.admittedTo,
      'residenceCity': instance.residenceCity,
      'residenceProv': instance.residenceProv,
      'status': instance.status,
      'symptoms': instance.symptoms,
    };
