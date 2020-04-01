import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
abstract class Patient with _$Patient {
  //ignore: non_constant_identifier_names
  const factory Patient({
    //ignore: non_constant_identifier_names
    String caseNumber,
    //ignore: non_constant_identifier_names
    int caseNumberInt,
    String sex,
    int age,
    String nationality,
    //ignore: non_constant_identifier_names
    bool overseasTravel,
    //ignore: non_constant_identifier_names
    String countryVisited0,
    //ignore: non_constant_identifier_names
    String countryVisited1,
    //ignore: non_constant_identifier_names
    String countryVisited2,
    //ignore: non_constant_identifier_names
    String exposure,
    //ignore: non_constant_identifier_names
    String onsetDate,
    //ignore: non_constant_identifier_names
    String admissionDate,
    //ignore: non_constant_identifier_names
    String labConfirmationDate,
    //ignore: non_constant_identifier_names
    String admittedTo,
    //ignore: non_constant_identifier_names
    String residenceCityMun,
    //ignore: non_constant_identifier_names
    String cityMunPsgc, //ignore: non_constant_identifier_names
    //ignore: non_constant_identifier_names
    String residenceProv,
    //ignore: non_constant_identifier_names
    String provPsgc,
    //ignore: non_constant_identifier_names
    String status,
    //ignore: non_constant_identifier_names
    String deathDate,
    //ignore: non_constant_identifier_names
    String deathCause, //ignore: non_constant_identifier_names

    String remarks,
    //ignore: non_constant_identifier_names
    List<dynamic> exposureLink,
    List<String> symptoms,
    String transmission,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}
