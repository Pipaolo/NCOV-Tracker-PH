// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'city.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
City _$CityFromJson(Map<String, dynamic> json) {
  return _City.fromJson(json);
}

class _$CityTearOff {
  const _$CityTearOff();

  _City call({String name, List<Patient> patients, int totalCount}) {
    return _City(
      name: name,
      patients: patients,
      totalCount: totalCount,
    );
  }
}

// ignore: unused_element
const $City = _$CityTearOff();

mixin _$City {
  String get name;
  List<Patient> get patients;
  int get totalCount;

  Map<String, dynamic> toJson();
  $CityCopyWith<City> get copyWith;
}

abstract class $CityCopyWith<$Res> {
  factory $CityCopyWith(City value, $Res Function(City) then) =
      _$CityCopyWithImpl<$Res>;
  $Res call({String name, List<Patient> patients, int totalCount});
}

class _$CityCopyWithImpl<$Res> implements $CityCopyWith<$Res> {
  _$CityCopyWithImpl(this._value, this._then);

  final City _value;
  // ignore: unused_field
  final $Res Function(City) _then;

  @override
  $Res call({
    Object name = freezed,
    Object patients = freezed,
    Object totalCount = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      patients:
          patients == freezed ? _value.patients : patients as List<Patient>,
      totalCount: totalCount == freezed ? _value.totalCount : totalCount as int,
    ));
  }
}

abstract class _$CityCopyWith<$Res> implements $CityCopyWith<$Res> {
  factory _$CityCopyWith(_City value, $Res Function(_City) then) =
      __$CityCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<Patient> patients, int totalCount});
}

class __$CityCopyWithImpl<$Res> extends _$CityCopyWithImpl<$Res>
    implements _$CityCopyWith<$Res> {
  __$CityCopyWithImpl(_City _value, $Res Function(_City) _then)
      : super(_value, (v) => _then(v as _City));

  @override
  _City get _value => super._value as _City;

  @override
  $Res call({
    Object name = freezed,
    Object patients = freezed,
    Object totalCount = freezed,
  }) {
    return _then(_City(
      name: name == freezed ? _value.name : name as String,
      patients:
          patients == freezed ? _value.patients : patients as List<Patient>,
      totalCount: totalCount == freezed ? _value.totalCount : totalCount as int,
    ));
  }
}

@JsonSerializable()
class _$_City implements _City {
  const _$_City({this.name, this.patients, this.totalCount});

  factory _$_City.fromJson(Map<String, dynamic> json) =>
      _$_$_CityFromJson(json);

  @override
  final String name;
  @override
  final List<Patient> patients;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'City(name: $name, patients: $patients, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _City &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.patients, patients) ||
                const DeepCollectionEquality()
                    .equals(other.patients, patients)) &&
            (identical(other.totalCount, totalCount) ||
                const DeepCollectionEquality()
                    .equals(other.totalCount, totalCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(patients) ^
      const DeepCollectionEquality().hash(totalCount);

  @override
  _$CityCopyWith<_City> get copyWith =>
      __$CityCopyWithImpl<_City>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CityToJson(this);
  }
}

abstract class _City implements City {
  const factory _City({String name, List<Patient> patients, int totalCount}) =
      _$_City;

  factory _City.fromJson(Map<String, dynamic> json) = _$_City.fromJson;

  @override
  String get name;
  @override
  List<Patient> get patients;
  @override
  int get totalCount;
  @override
  _$CityCopyWith<_City> get copyWith;
}
