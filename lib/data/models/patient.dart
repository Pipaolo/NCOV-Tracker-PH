import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';

@freezed
abstract class Patient with _$Patient {
  const factory Patient({
    int fID,
    int sequ,
    String phMasterList,
    int age,
    String gender,
    String nationality,
    String residence,
    String travelHistory,
    String symptoms,
    String confirmed,
    String facility,
    double latitude,
    double longitude,
    String status,
    String date,
  }) = _Patient;
}
