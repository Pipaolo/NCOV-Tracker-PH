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
      String symptoms}) {
    return _Patient(
      caseNumber: caseNumber,
      caseNumberInt: caseNumberInt,
      sex: sex,
      age: age,
      nationality: nationality,
      travelHistory: travelHistory,
      confirmedDate: confirmedDate,
      admittedTo: admittedTo,
      residenceCity: residenceCity,
      residenceProv: residenceProv,
      status: status,
      symptoms: symptoms,
    );
  }
}

// ignore: unused_element
const $Patient = _$PatientTearOff();

mixin _$Patient {
  String get caseNumber;
  int get caseNumberInt;
  String get sex;
  int get age;
  String get nationality;
  String get travelHistory;
  String get confirmedDate;
  String get admittedTo;
  String get residenceCity;
  String get residenceProv;
  String get status;
  String get symptoms;

  Map<String, dynamic> toJson();
  $PatientCopyWith<Patient> get copyWith;
}

abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res>;
  $Res call(
      {String caseNumber,
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
      String symptoms});
}

class _$PatientCopyWithImpl<$Res> implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  final Patient _value;
  // ignore: unused_field
  final $Res Function(Patient) _then;

  @override
  $Res call({
    Object caseNumber = freezed,
    Object caseNumberInt = freezed,
    Object sex = freezed,
    Object age = freezed,
    Object nationality = freezed,
    Object travelHistory = freezed,
    Object confirmedDate = freezed,
    Object admittedTo = freezed,
    Object residenceCity = freezed,
    Object residenceProv = freezed,
    Object status = freezed,
    Object symptoms = freezed,
  }) {
    return _then(_value.copyWith(
      caseNumber:
          caseNumber == freezed ? _value.caseNumber : caseNumber as String,
      caseNumberInt: caseNumberInt == freezed
          ? _value.caseNumberInt
          : caseNumberInt as int,
      sex: sex == freezed ? _value.sex : sex as String,
      age: age == freezed ? _value.age : age as int,
      nationality:
          nationality == freezed ? _value.nationality : nationality as String,
      travelHistory: travelHistory == freezed
          ? _value.travelHistory
          : travelHistory as String,
      confirmedDate: confirmedDate == freezed
          ? _value.confirmedDate
          : confirmedDate as String,
      admittedTo:
          admittedTo == freezed ? _value.admittedTo : admittedTo as String,
      residenceCity: residenceCity == freezed
          ? _value.residenceCity
          : residenceCity as String,
      residenceProv: residenceProv == freezed
          ? _value.residenceProv
          : residenceProv as String,
      status: status == freezed ? _value.status : status as String,
      symptoms: symptoms == freezed ? _value.symptoms : symptoms as String,
    ));
  }
}

abstract class _$PatientCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$PatientCopyWith(_Patient value, $Res Function(_Patient) then) =
      __$PatientCopyWithImpl<$Res>;
  @override
  $Res call(
      {String caseNumber,
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
      String symptoms});
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
    Object caseNumberInt = freezed,
    Object sex = freezed,
    Object age = freezed,
    Object nationality = freezed,
    Object travelHistory = freezed,
    Object confirmedDate = freezed,
    Object admittedTo = freezed,
    Object residenceCity = freezed,
    Object residenceProv = freezed,
    Object status = freezed,
    Object symptoms = freezed,
  }) {
    return _then(_Patient(
      caseNumber:
          caseNumber == freezed ? _value.caseNumber : caseNumber as String,
      caseNumberInt: caseNumberInt == freezed
          ? _value.caseNumberInt
          : caseNumberInt as int,
      sex: sex == freezed ? _value.sex : sex as String,
      age: age == freezed ? _value.age : age as int,
      nationality:
          nationality == freezed ? _value.nationality : nationality as String,
      travelHistory: travelHistory == freezed
          ? _value.travelHistory
          : travelHistory as String,
      confirmedDate: confirmedDate == freezed
          ? _value.confirmedDate
          : confirmedDate as String,
      admittedTo:
          admittedTo == freezed ? _value.admittedTo : admittedTo as String,
      residenceCity: residenceCity == freezed
          ? _value.residenceCity
          : residenceCity as String,
      residenceProv: residenceProv == freezed
          ? _value.residenceProv
          : residenceProv as String,
      status: status == freezed ? _value.status : status as String,
      symptoms: symptoms == freezed ? _value.symptoms : symptoms as String,
    ));
  }
}

@JsonSerializable()
class _$_Patient implements _Patient {
  const _$_Patient(
      {this.caseNumber,
      this.caseNumberInt,
      this.sex,
      this.age,
      this.nationality,
      this.travelHistory,
      this.confirmedDate,
      this.admittedTo,
      this.residenceCity,
      this.residenceProv,
      this.status,
      this.symptoms});

  factory _$_Patient.fromJson(Map<String, dynamic> json) =>
      _$_$_PatientFromJson(json);

  @override
  final String caseNumber;
  @override
  final int caseNumberInt;
  @override
  final String sex;
  @override
  final int age;
  @override
  final String nationality;
  @override
  final String travelHistory;
  @override
  final String confirmedDate;
  @override
  final String admittedTo;
  @override
  final String residenceCity;
  @override
  final String residenceProv;
  @override
  final String status;
  @override
  final String symptoms;

  @override
  String toString() {
    return 'Patient(caseNumber: $caseNumber, caseNumberInt: $caseNumberInt, sex: $sex, age: $age, nationality: $nationality, travelHistory: $travelHistory, confirmedDate: $confirmedDate, admittedTo: $admittedTo, residenceCity: $residenceCity, residenceProv: $residenceProv, status: $status, symptoms: $symptoms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Patient &&
            (identical(other.caseNumber, caseNumber) ||
                const DeepCollectionEquality()
                    .equals(other.caseNumber, caseNumber)) &&
            (identical(other.caseNumberInt, caseNumberInt) ||
                const DeepCollectionEquality()
                    .equals(other.caseNumberInt, caseNumberInt)) &&
            (identical(other.sex, sex) ||
                const DeepCollectionEquality().equals(other.sex, sex)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.nationality, nationality) ||
                const DeepCollectionEquality()
                    .equals(other.nationality, nationality)) &&
            (identical(other.travelHistory, travelHistory) ||
                const DeepCollectionEquality()
                    .equals(other.travelHistory, travelHistory)) &&
            (identical(other.confirmedDate, confirmedDate) ||
                const DeepCollectionEquality()
                    .equals(other.confirmedDate, confirmedDate)) &&
            (identical(other.admittedTo, admittedTo) ||
                const DeepCollectionEquality()
                    .equals(other.admittedTo, admittedTo)) &&
            (identical(other.residenceCity, residenceCity) ||
                const DeepCollectionEquality()
                    .equals(other.residenceCity, residenceCity)) &&
            (identical(other.residenceProv, residenceProv) ||
                const DeepCollectionEquality()
                    .equals(other.residenceProv, residenceProv)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.symptoms, symptoms) ||
                const DeepCollectionEquality()
                    .equals(other.symptoms, symptoms)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(caseNumber) ^
      const DeepCollectionEquality().hash(caseNumberInt) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(nationality) ^
      const DeepCollectionEquality().hash(travelHistory) ^
      const DeepCollectionEquality().hash(confirmedDate) ^
      const DeepCollectionEquality().hash(admittedTo) ^
      const DeepCollectionEquality().hash(residenceCity) ^
      const DeepCollectionEquality().hash(residenceProv) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(symptoms);

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
      String symptoms}) = _$_Patient;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$_Patient.fromJson;

  @override
  String get caseNumber;
  @override
  int get caseNumberInt;
  @override
  String get sex;
  @override
  int get age;
  @override
  String get nationality;
  @override
  String get travelHistory;
  @override
  String get confirmedDate;
  @override
  String get admittedTo;
  @override
  String get residenceCity;
  @override
  String get residenceProv;
  @override
  String get status;
  @override
  String get symptoms;
  @override
  _$PatientCopyWith<_Patient> get copyWith;
}
