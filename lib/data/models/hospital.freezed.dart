// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'hospital.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$HospitalTearOff {
  const _$HospitalTearOff();

  _Hospital call(
      {String name, String address, List<String> contactInfo, String type}) {
    return _Hospital(
      name: name,
      address: address,
      contactInfo: contactInfo,
      type: type,
    );
  }
}

// ignore: unused_element
const $Hospital = _$HospitalTearOff();

mixin _$Hospital {
  String get name;
  String get address;
  List<String> get contactInfo;
  String get type;

  $HospitalCopyWith<Hospital> get copyWith;
}

abstract class $HospitalCopyWith<$Res> {
  factory $HospitalCopyWith(Hospital value, $Res Function(Hospital) then) =
      _$HospitalCopyWithImpl<$Res>;
  $Res call(
      {String name, String address, List<String> contactInfo, String type});
}

class _$HospitalCopyWithImpl<$Res> implements $HospitalCopyWith<$Res> {
  _$HospitalCopyWithImpl(this._value, this._then);

  final Hospital _value;
  // ignore: unused_field
  final $Res Function(Hospital) _then;

  @override
  $Res call({
    Object name = freezed,
    Object address = freezed,
    Object contactInfo = freezed,
    Object type = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      address: address == freezed ? _value.address : address as String,
      contactInfo: contactInfo == freezed
          ? _value.contactInfo
          : contactInfo as List<String>,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

abstract class _$HospitalCopyWith<$Res> implements $HospitalCopyWith<$Res> {
  factory _$HospitalCopyWith(_Hospital value, $Res Function(_Hospital) then) =
      __$HospitalCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name, String address, List<String> contactInfo, String type});
}

class __$HospitalCopyWithImpl<$Res> extends _$HospitalCopyWithImpl<$Res>
    implements _$HospitalCopyWith<$Res> {
  __$HospitalCopyWithImpl(_Hospital _value, $Res Function(_Hospital) _then)
      : super(_value, (v) => _then(v as _Hospital));

  @override
  _Hospital get _value => super._value as _Hospital;

  @override
  $Res call({
    Object name = freezed,
    Object address = freezed,
    Object contactInfo = freezed,
    Object type = freezed,
  }) {
    return _then(_Hospital(
      name: name == freezed ? _value.name : name as String,
      address: address == freezed ? _value.address : address as String,
      contactInfo: contactInfo == freezed
          ? _value.contactInfo
          : contactInfo as List<String>,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

class _$_Hospital implements _Hospital {
  const _$_Hospital({this.name, this.address, this.contactInfo, this.type});

  @override
  final String name;
  @override
  final String address;
  @override
  final List<String> contactInfo;
  @override
  final String type;

  @override
  String toString() {
    return 'Hospital(name: $name, address: $address, contactInfo: $contactInfo, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Hospital &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.contactInfo, contactInfo) ||
                const DeepCollectionEquality()
                    .equals(other.contactInfo, contactInfo)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(contactInfo) ^
      const DeepCollectionEquality().hash(type);

  @override
  _$HospitalCopyWith<_Hospital> get copyWith =>
      __$HospitalCopyWithImpl<_Hospital>(this, _$identity);
}

abstract class _Hospital implements Hospital {
  const factory _Hospital(
      {String name,
      String address,
      List<String> contactInfo,
      String type}) = _$_Hospital;

  @override
  String get name;
  @override
  String get address;
  @override
  List<String> get contactInfo;
  @override
  String get type;
  @override
  _$HospitalCopyWith<_Hospital> get copyWith;
}
