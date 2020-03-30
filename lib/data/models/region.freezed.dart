// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'region.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RegionTearOff {
  const _$RegionTearOff();

  _Region call({int totalCount, String name, List<City> citiesInfected}) {
    return _Region(
      totalCount: totalCount,
      name: name,
      citiesInfected: citiesInfected,
    );
  }
}

// ignore: unused_element
const $Region = _$RegionTearOff();

mixin _$Region {
  int get totalCount;
  String get name;
  List<City> get citiesInfected;

  $RegionCopyWith<Region> get copyWith;
}

abstract class $RegionCopyWith<$Res> {
  factory $RegionCopyWith(Region value, $Res Function(Region) then) =
      _$RegionCopyWithImpl<$Res>;
  $Res call({int totalCount, String name, List<City> citiesInfected});
}

class _$RegionCopyWithImpl<$Res> implements $RegionCopyWith<$Res> {
  _$RegionCopyWithImpl(this._value, this._then);

  final Region _value;
  // ignore: unused_field
  final $Res Function(Region) _then;

  @override
  $Res call({
    Object totalCount = freezed,
    Object name = freezed,
    Object citiesInfected = freezed,
  }) {
    return _then(_value.copyWith(
      totalCount: totalCount == freezed ? _value.totalCount : totalCount as int,
      name: name == freezed ? _value.name : name as String,
      citiesInfected: citiesInfected == freezed
          ? _value.citiesInfected
          : citiesInfected as List<City>,
    ));
  }
}

abstract class _$RegionCopyWith<$Res> implements $RegionCopyWith<$Res> {
  factory _$RegionCopyWith(_Region value, $Res Function(_Region) then) =
      __$RegionCopyWithImpl<$Res>;
  @override
  $Res call({int totalCount, String name, List<City> citiesInfected});
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
    Object name = freezed,
    Object citiesInfected = freezed,
  }) {
    return _then(_Region(
      totalCount: totalCount == freezed ? _value.totalCount : totalCount as int,
      name: name == freezed ? _value.name : name as String,
      citiesInfected: citiesInfected == freezed
          ? _value.citiesInfected
          : citiesInfected as List<City>,
    ));
  }
}

class _$_Region implements _Region {
  const _$_Region({this.totalCount, this.name, this.citiesInfected});

  @override
  final int totalCount;
  @override
  final String name;
  @override
  final List<City> citiesInfected;

  @override
  String toString() {
    return 'Region(totalCount: $totalCount, name: $name, citiesInfected: $citiesInfected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Region &&
            (identical(other.totalCount, totalCount) ||
                const DeepCollectionEquality()
                    .equals(other.totalCount, totalCount)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.citiesInfected, citiesInfected) ||
                const DeepCollectionEquality()
                    .equals(other.citiesInfected, citiesInfected)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(totalCount) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(citiesInfected);

  @override
  _$RegionCopyWith<_Region> get copyWith =>
      __$RegionCopyWithImpl<_Region>(this, _$identity);
}

abstract class _Region implements Region {
  const factory _Region(
      {int totalCount, String name, List<City> citiesInfected}) = _$_Region;

  @override
  int get totalCount;
  @override
  String get name;
  @override
  List<City> get citiesInfected;
  @override
  _$RegionCopyWith<_Region> get copyWith;
}
