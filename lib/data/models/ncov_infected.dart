import 'package:freezed_annotation/freezed_annotation.dart';

part 'ncov_infected.freezed.dart';

@freezed
abstract class NcovInfected with _$NcovInfected {
  const factory NcovInfected({
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
  }) = _NcovInfected;
}
