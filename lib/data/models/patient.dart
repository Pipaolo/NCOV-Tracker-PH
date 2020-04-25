import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ncov_tracker_ph/data/models/residence.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
abstract class Patient with _$Patient {
  const factory Patient({
    String caseNumber,
    String sex,
    int age,
    String dateDeath,
    String dateRecovery,
    String dateReportConfirmed,
    String dateReportRemoved,
    bool admitted,
    String healthStatus,
    String removalType,
    Residence residence,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}
