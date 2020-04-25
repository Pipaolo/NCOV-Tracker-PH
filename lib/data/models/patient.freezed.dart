// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Patient _$PatientFromJson(Map<String, dynamic> json) {
  return _Patient.fromJson(json);
}

class _$PatientTearOff {
  const _$PatientTearOff();

  _Patient call(
      {String caseNumber,
      String sex,
      int age,
      String dateDeath,
      String dateRecovery,
      String dateReportConfirmed,
      String dateReportRemoved,
      bool admitted,
      String healthStatus,
      String removalType,
      Residence residence}) {
    return _Patient(
      caseNumber: caseNumber,
      sex: sex,
      age: age,
      dateDeath: dateDeath,
      dateRecovery: dateRecovery,
      dateReportConfirmed: dateReportConfirmed,
      dateReportRemoved: dateReportRemoved,
      admitted: admitted,
      healthStatus: healthStatus,
      removalType: removalType,
      residence: residence,
    );
  }
}

// ignore: unused_element
const $Patient = _$PatientTearOff();

mixin _$Patient {
  String get caseNumber;
  String get sex;
  int get age;
  String get dateDeath;
  String get dateRecovery;
  String get dateReportConfirmed;
  String get dateReportRemoved;
  bool get admitted;
  String get healthStatus;
  String get removalType;
  Residence get residence;

  Map<String, dynamic> toJson();
  $PatientCopyWith<Patient> get copyWith;
}

abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res>;
  $Res call(
      {String caseNumber,
      String sex,
      int age,
      String dateDeath,
      String dateRecovery,
      String dateReportConfirmed,
      String dateReportRemoved,
      bool admitted,
      String healthStatus,
      String removalType,
      Residence residence});

  $ResidenceCopyWith<$Res> get residence;
}

class _$PatientCopyWithImpl<$Res> implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  final Patient _value;
  // ignore: unused_field
  final $Res Function(Patient) _then;

  @override
  $Res call({
    Object caseNumber = freezed,
    Object sex = freezed,
    Object age = freezed,
    Object dateDeath = freezed,
    Object dateRecovery = freezed,
    Object dateReportConfirmed = freezed,
    Object dateReportRemoved = freezed,
    Object admitted = freezed,
    Object healthStatus = freezed,
    Object removalType = freezed,
    Object residence = freezed,
  }) {
    return _then(_value.copyWith(
      caseNumber:
          caseNumber == freezed ? _value.caseNumber : caseNumber as String,
      sex: sex == freezed ? _value.sex : sex as String,
      age: age == freezed ? _value.age : age as int,
      dateDeath: dateDeath == freezed ? _value.dateDeath : dateDeath as String,
      dateRecovery: dateRecovery == freezed
          ? _value.dateRecovery
          : dateRecovery as String,
      dateReportConfirmed: dateReportConfirmed == freezed
          ? _value.dateReportConfirmed
          : dateReportConfirmed as String,
      dateReportRemoved: dateReportRemoved == freezed
          ? _value.dateReportRemoved
          : dateReportRemoved as String,
      admitted: admitted == freezed ? _value.admitted : admitted as bool,
      healthStatus: healthStatus == freezed
          ? _value.healthStatus
          : healthStatus as String,
      removalType:
          removalType == freezed ? _value.removalType : removalType as String,
      residence:
          residence == freezed ? _value.residence : residence as Residence,
    ));
  }

  @override
  $ResidenceCopyWith<$Res> get residence {
    if (_value.residence == null) {
      return null;
    }
    return $ResidenceCopyWith<$Res>(_value.residence, (value) {
      return _then(_value.copyWith(residence: value));
    });
  }
}

abstract class _$PatientCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$PatientCopyWith(_Patient value, $Res Function(_Patient) then) =
      __$PatientCopyWithImpl<$Res>;
  @override
  $Res call(
      {String caseNumber,
      String sex,
      int age,
      String dateDeath,
      String dateRecovery,
      String dateReportConfirmed,
      String dateReportRemoved,
      bool admitted,
      String healthStatus,
      String removalType,
      Residence residence});

  @override
  $ResidenceCopyWith<$Res> get residence;
}

class __$PatientCopyWithImpl<$Res> extends _$PatientCopyWithImpl<$Res>
    implements _$PatientCopyWith<$Res> {
  __$PatientCopyWithImpl(_Patient _value, $Res Function(_Patient) _then)
      : super(_value, (v) => _then(v as _Patient));

  @override
  _Patient get _value => super._value as _Patient;

  @override
  $Res call({
    Object caseNumber = freezed,
    Object sex = freezed,
    Object age = freezed,
    Object dateDeath = freezed,
    Object dateRecovery = freezed,
    Object dateReportConfirmed = freezed,
    Object dateReportRemoved = freezed,
    Object admitted = freezed,
    Object healthStatus = freezed,
    Object removalType = freezed,
    Object residence = freezed,
  }) {
    return _then(_Patient(
      caseNumber:
          caseNumber == freezed ? _value.caseNumber : caseNumber as String,
      sex: sex == freezed ? _value.sex : sex as String,
      age: age == freezed ? _value.age : age as int,
      dateDeath: dateDeath == freezed ? _value.dateDeath : dateDeath as String,
      dateRecovery: dateRecovery == freezed
          ? _value.dateRecovery
          : dateRecovery as String,
      dateReportConfirmed: dateReportConfirmed == freezed
          ? _value.dateReportConfirmed
          : dateReportConfirmed as String,
      dateReportRemoved: dateReportRemoved == freezed
          ? _value.dateReportRemoved
          : dateReportRemoved as String,
      admitted: admitted == freezed ? _value.admitted : admitted as bool,
      healthStatus: healthStatus == freezed
          ? _value.healthStatus
          : healthStatus as String,
      removalType:
          removalType == freezed ? _value.removalType : removalType as String,
      residence:
          residence == freezed ? _value.residence : residence as Residence,
    ));
  }
}

@JsonSerializable()
class _$_Patient implements _Patient {
  const _$_Patient(
      {this.caseNumber,
      this.sex,
      this.age,
      this.dateDeath,
      this.dateRecovery,
      this.dateReportConfirmed,
      this.dateReportRemoved,
      this.admitted,
      this.healthStatus,
      this.removalType,
      this.residence});

  factory _$_Patient.fromJson(Map<String, dynamic> json) =>
      _$_$_PatientFromJson(json);

  @override
  final String caseNumber;
  @override
  final String sex;
  @override
  final int age;
  @override
  final String dateDeath;
  @override
  final String dateRecovery;
  @override
  final String dateReportConfirmed;
  @override
  final String dateReportRemoved;
  @override
  final bool admitted;
  @override
  final String healthStatus;
  @override
  final String removalType;
  @override
  final Residence residence;

  @override
  String toString() {
    return 'Patient(caseNumber: $caseNumber, sex: $sex, age: $age, dateDeath: $dateDeath, dateRecovery: $dateRecovery, dateReportConfirmed: $dateReportConfirmed, dateReportRemoved: $dateReportRemoved, admitted: $admitted, healthStatus: $healthStatus, removalType: $removalType, residence: $residence)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Patient &&
            (identical(other.caseNumber, caseNumber) ||
                const DeepCollectionEquality()
                    .equals(other.caseNumber, caseNumber)) &&
            (identical(other.sex, sex) ||
                const DeepCollectionEquality().equals(other.sex, sex)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.dateDeath, dateDeath) ||
                const DeepCollectionEquality()
                    .equals(other.dateDeath, dateDeath)) &&
            (identical(other.dateRecovery, dateRecovery) ||
                const DeepCollectionEquality()
                    .equals(other.dateRecovery, dateRecovery)) &&
            (identical(other.dateReportConfirmed, dateReportConfirmed) ||
                const DeepCollectionEquality()
                    .equals(other.dateReportConfirmed, dateReportConfirmed)) &&
            (identical(other.dateReportRemoved, dateReportRemoved) ||
                const DeepCollectionEquality()
                    .equals(other.dateReportRemoved, dateReportRemoved)) &&
            (identical(other.admitted, admitted) ||
                const DeepCollectionEquality()
                    .equals(other.admitted, admitted)) &&
            (identical(other.healthStatus, healthStatus) ||
                const DeepCollectionEquality()
                    .equals(other.healthStatus, healthStatus)) &&
            (identical(other.removalType, removalType) ||
                const DeepCollectionEquality()
                    .equals(other.removalType, removalType)) &&
            (identical(other.residence, residence) ||
                const DeepCollectionEquality()
                    .equals(other.residence, residence)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(caseNumber) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(dateDeath) ^
      const DeepCollectionEquality().hash(dateRecovery) ^
      const DeepCollectionEquality().hash(dateReportConfirmed) ^
      const DeepCollectionEquality().hash(dateReportRemoved) ^
      const DeepCollectionEquality().hash(admitted) ^
      const DeepCollectionEquality().hash(healthStatus) ^
      const DeepCollectionEquality().hash(removalType) ^
      const DeepCollectionEquality().hash(residence);

  @override
  _$PatientCopyWith<_Patient> get copyWith =>
      __$PatientCopyWithImpl<_Patient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PatientToJson(this);
  }
}

abstract class _Patient implements Patient {
  const factory _Patient(
      {String caseNumber,
      String sex,
      int age,
      String dateDeath,
      String dateRecovery,
      String dateReportConfirmed,
      String dateReportRemoved,
      bool admitted,
      String healthStatus,
      String removalType,
      Residence residence}) = _$_Patient;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$_Patient.fromJson;

  @override
  String get caseNumber;
  @override
  String get sex;
  @override
  int get age;
  @override
  String get dateDeath;
  @override
  String get dateRecovery;
  @override
  String get dateReportConfirmed;
  @override
  String get dateReportRemoved;
  @override
  bool get admitted;
  @override
  String get healthStatus;
  @override
  String get removalType;
  @override
  Residence get residence;
  @override
  _$PatientCopyWith<_Patient> get copyWith;
}
