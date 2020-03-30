import 'package:freezed_annotation/freezed_annotation.dart';
part 'hospital.freezed.dart';

@freezed
abstract class Hospital with _$Hospital {
  const factory Hospital({
    String name,
    String address,
    List<String> contactInfo,
    String type,
  }) = _Hospital;
}
