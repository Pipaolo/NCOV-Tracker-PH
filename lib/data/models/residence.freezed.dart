// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'residence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Residence _$ResidenceFromJson(Map<String, dynamic> json) {
  return _Residence.fromJson(json);
}

class _$ResidenceTearOff {
  const _$ResidenceTearOff();

  _Residence call({String region, String province, String city}) {
    return _Residence(
      region: region,
      province: province,
      city: city,
    );
  }
}

// ignore: unused_element
const $Residence = _$ResidenceTearOff();

mixin _$Residence {
  String get region;
  String get province;
  String get city;

  Map<String, dynamic> toJson();
  $ResidenceCopyWith<Residence> get copyWith;
}

abstract class $ResidenceCopyWith<$Res> {
  factory $ResidenceCopyWith(Residence value, $Res Function(Residence) then) =
      _$ResidenceCopyWithImpl<$Res>;
  $Res call({String region, String province, String city});
}

class _$ResidenceCopyWithImpl<$Res> implements $ResidenceCopyWith<$Res> {
  _$ResidenceCopyWithImpl(this._value, this._then);

  final Residence _value;
  // ignore: unused_field
  final $Res Function(Residence) _then;

  @override
  $Res call({
    Object region = freezed,
    Object province = freezed,
    Object city = freezed,
  }) {
    return _then(_value.copyWith(
      region: region == freezed ? _value.region : region as String,
      province: province == freezed ? _value.province : province as String,
      city: city == freezed ? _value.city : city as String,
    ));
  }
}

abstract class _$ResidenceCopyWith<$Res> implements $ResidenceCopyWith<$Res> {
  factory _$ResidenceCopyWith(
          _Residence value, $Res Function(_Residence) then) =
      __$ResidenceCopyWithImpl<$Res>;
  @override
  $Res call({String region, String province, String city});
}

class __$ResidenceCopyWithImpl<$Res> extends _$ResidenceCopyWithImpl<$Res>
    implements _$ResidenceCopyWith<$Res> {
  __$ResidenceCopyWithImpl(_Residence _value, $Res Function(_Residence) _then)
      : super(_value, (v) => _then(v as _Residence));

  @override
  _Residence get _value => super._value as _Residence;

  @override
  $Res call({
    Object region = freezed,
    Object province = freezed,
    Object city = freezed,
  }) {
    return _then(_Residence(
      region: region == freezed ? _value.region : region as String,
      province: province == freezed ? _value.province : province as String,
      city: city == freezed ? _value.city : city as String,
    ));
  }
}

@JsonSerializable()
class _$_Residence implements _Residence {
  const _$_Residence({this.region, this.province, this.city});

  factory _$_Residence.fromJson(Map<String, dynamic> json) =>
      _$_$_ResidenceFromJson(json);

  @override
  final String region;
  @override
  final String province;
  @override
  final String city;

  @override
  String toString() {
    return 'Residence(region: $region, province: $province, city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Residence &&
            (identical(other.region, region) ||
                const DeepCollectionEquality().equals(other.region, region)) &&
            (identical(other.province, province) ||
                const DeepCollectionEquality()
                    .equals(other.province, province)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(region) ^
      const DeepCollectionEquality().hash(province) ^
      const DeepCollectionEquality().hash(city);

  @override
  _$ResidenceCopyWith<_Residence> get copyWith =>
      __$ResidenceCopyWithImpl<_Residence>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ResidenceToJson(this);
  }
}

abstract class _Residence implements Residence {
  const factory _Residence({String region, String province, String city}) =
      _$_Residence;

  factory _Residence.fromJson(Map<String, dynamic> json) =
      _$_Residence.fromJson;

  @override
  String get region;
  @override
  String get province;
  @override
  String get city;
  @override
  _$ResidenceCopyWith<_Residence> get copyWith;
}
