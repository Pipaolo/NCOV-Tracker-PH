// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'region.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RegionTearOff {
  const _$RegionTearOff();

  _Region call(
      {int totalCount, List<Map<String, List<NcovInfected>>> citiesInfected}) {
    return _Region(
      totalCount: totalCount,
      citiesInfected: citiesInfected,
    );
  }
}

// ignore: unused_element
const $Region = _$RegionTearOff();

mixin _$Region {
  int get totalCount;
  List<Map<String, List<NcovInfected>>> get citiesInfected;

  $RegionCopyWith<Region> get copyWith;
}

abstract class $RegionCopyWith<$Res> {
  factory $RegionCopyWith(Region value, $Res Function(Region) then) =
      _$RegionCopyWithImpl<$Res>;
  $Res call(
      {int totalCount, List<Map<String, List<NcovInfected>>> citiesInfected});
}

class _$RegionCopyWithImpl<$Res> implements $RegionCopyWith<$Res> {
  _$RegionCopyWithImpl(this._value, this._then);

  final Region _value;
  // ignore: unused_field
  final $Res Function(Region) _then;

  @override
  $Res call({
    Object totalCount = freezed,
    Object citiesInfected = freezed,
  }) {
    return _then(_value.copyWith(
      totalCount: totalCount == freezed ? _value.totalCount : totalCount as int,
      citiesInfected: citiesInfected == freezed
          ? _value.citiesInfected
          : citiesInfected as List<Map<String, List<NcovInfected>>>,
    ));
  }
}

abstract class _$RegionCopyWith<$Res> implements $RegionCopyWith<$Res> {
  factory _$RegionCopyWith(_Region value, $Res Function(_Region) then) =
      __$RegionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int totalCount, List<Map<String, List<NcovInfected>>> citiesInfected});
}

class __$RegionCopyWithImpl<$Res> extends _$RegionCopyWithImpl<$Res>
    implements _$RegionCopyWith<$Res> {
  __$RegionCopyWithImpl(_Region _value, $Res Function(_Region) _then)
      : super(_value, (v) => _then(v as _Region));

  @override
  _Region get _value => super._value as _Region;

  @override
  $Res call({
    Object totalCount = freezed,
    Object citiesInfected = freezed,
  }) {
    return _then(_Region(
      totalCount: totalCount == freezed ? _value.totalCount : totalCount as int,
      citiesInfected: citiesInfected == freezed
          ? _value.citiesInfected
          : citiesInfected as List<Map<String, List<NcovInfected>>>,
    ));
  }
}

class _$_Region implements _Region {
  const _$_Region({this.totalCount, this.citiesInfected});

  @override
  final int totalCount;
  @override
  final List<Map<String, List<NcovInfected>>> citiesInfected;

  @override
  String toString() {
    return 'Region(totalCount: $totalCount, citiesInfected: $citiesInfected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Region &&
            (identical(other.totalCount, totalCount) ||
                const DeepCollectionEquality()
                    .equals(other.totalCount, totalCount)) &&
            (identical(other.citiesInfected, citiesInfected) ||
                const DeepCollectionEquality()
                    .equals(other.citiesInfected, citiesInfected)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(totalCount) ^
      const DeepCollectionEquality().hash(citiesInfected);

  @override
  _$RegionCopyWith<_Region> get copyWith =>
      __$RegionCopyWithImpl<_Region>(this, _$identity);
}

abstract class _Region implements Region {
  const factory _Region(
      {int totalCount,
      List<Map<String, List<NcovInfected>>> citiesInfected}) = _$_Region;

  @override
  int get totalCount;
  @override
  List<Map<String, List<NcovInfected>>> get citiesInfected;
  @override
  _$RegionCopyWith<_Region> get copyWith;
}
