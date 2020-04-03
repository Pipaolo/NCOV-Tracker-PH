import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
abstract class Patient with _$Patient {
  const factory Patient({
    String caseNumber,
    int caseNumberInt,
    String sex,
    int age,
    String nationality,
    String travelHistory,
    String confirmedDate,
    String admittedTo,
    String residenceCity,
    String residenceProv,
    String status,
    String symptoms,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}
