// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
//ignore: non_constant_identifier_names
_$_Patient _$_$_PatientFromJson(Map<String, dynamic> json) {
  return _$_Patient(
    caseNumber: json['caseNumber'] as String,
    caseNumberInt: json['caseNumberInt'] as int,
    sex: json['sex'] as String,
    age: json['age'] as int,
    nationality: json['nationality'] as String,
    overseasTravel: json['overseasTravel'] as bool,
    countryVisited0: json['countryVisited0'] as String,
    countryVisited1: json['countryVisited1'] as String,
    countryVisited2: json['countryVisited2'] as String,
    exposure: json['exposure'] as String,
    onsetDate: json['onsetDate'] as String,
    admissionDate: json['admissionDate'] as String,
    labConfirmationDate: json['labConfirmationDate'] as String,
    admittedTo: json['admittedTo'] as String,
    residenceCityMun: json['residenceCityMun'] as String,
    cityMunPsgc: json['cityMunPsgc'] as String,
    residenceProv: json['residenceProv'] as String,
    provPsgc: json['provPsgc'] as String,
    status: json['status'] as String,
    deathDate: json['deathDate'] as String,
    deathCause: json['deathCause'] as String,
    remarks: json['remarks'] as String,
    exposureLink: json['exposureLink'] as List,
    symptoms: (json['symptoms'] as List)?.map((e) => e as String)?.toList(),
    transmission: json['transmission'] as String,
  );
}

//ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_PatientToJson(_$_Patient instance) =>
    <String, dynamic>{
      'caseNumber': instance.caseNumber,
      'caseNumberInt': instance.caseNumberInt,
      'sex': instance.sex,
      'age': instance.age,
      'nationality': instance.nationality,
      'overseasTravel': instance.overseasTravel,
      'countryVisited0': instance.countryVisited0,
      'countryVisited1': instance.countryVisited1,
      'countryVisited2': instance.countryVisited2,
      'exposure': instance.exposure,
      'onsetDate': instance.onsetDate,
      'admissionDate': instance.admissionDate,
      'labConfirmationDate': instance.labConfirmationDate,
      'admittedTo': instance.admittedTo,
      'residenceCityMun': instance.residenceCityMun,
      'cityMunPsgc': instance.cityMunPsgc,
      'residenceProv': instance.residenceProv,
      'provPsgc': instance.provPsgc,
      'status': instance.status,
      'deathDate': instance.deathDate,
      'deathCause': instance.deathCause,
      'remarks': instance.remarks,
      'exposureLink': instance.exposureLink,
      'symptoms': instance.symptoms,
      'transmission': instance.transmission,
    };
