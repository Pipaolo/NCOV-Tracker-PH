// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'ncov_statistic_basic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
NcovStatisticBasic _$NcovStatisticBasicFromJson(Map<String, dynamic> json) {
  return _NcovStatisticBasic.fromJson(json);
}

class _$NcovStatisticBasicTearOff {
  const _$NcovStatisticBasicTearOff();

  _NcovStatisticBasic call(
      {int totalDeaths,
      int totalRecovered,
      int totalTestsConducted,
      int totalPUMs,
      int totalPUIs,
      int totalInfected,
      int totalPUIsTested}) {
    return _NcovStatisticBasic(
      totalDeaths: totalDeaths,
      totalRecovered: totalRecovered,
      totalTestsConducted: totalTestsConducted,
      totalPUMs: totalPUMs,
      totalPUIs: totalPUIs,
      totalInfected: totalInfected,
      totalPUIsTested: totalPUIsTested,
    );
  }
}

// ignore: unused_element
const $NcovStatisticBasic = _$NcovStatisticBasicTearOff();

mixin _$NcovStatisticBasic {
  int get totalDeaths;
  int get totalRecovered;
  int get totalTestsConducted;
  int get totalPUMs;
  int get totalPUIs;
  int get totalInfected;
  int get totalPUIsTested;

  Map<String, dynamic> toJson();
  $NcovStatisticBasicCopyWith<NcovStatisticBasic> get copyWith;
}

abstract class $NcovStatisticBasicCopyWith<$Res> {
  factory $NcovStatisticBasicCopyWith(
          NcovStatisticBasic value, $Res Function(NcovStatisticBasic) then) =
      _$NcovStatisticBasicCopyWithImpl<$Res>;
  $Res call(
      {int totalDeaths,
      int totalRecovered,
      int totalTestsConducted,
      int totalPUMs,
      int totalPUIs,
      int totalInfected,
      int totalPUIsTested});
}

class _$NcovStatisticBasicCopyWithImpl<$Res>
    implements $NcovStatisticBasicCopyWith<$Res> {
  _$NcovStatisticBasicCopyWithImpl(this._value, this._then);

  final NcovStatisticBasic _value;
  // ignore: unused_field
  final $Res Function(NcovStatisticBasic) _then;

  @override
  $Res call({
    Object totalDeaths = freezed,
    Object totalRecovered = freezed,
    Object totalTestsConducted = freezed,
    Object totalPUMs = freezed,
    Object totalPUIs = freezed,
    Object totalInfected = freezed,
    Object totalPUIsTested = freezed,
  }) {
    return _then(_value.copyWith(
      totalDeaths:
          totalDeaths == freezed ? _value.totalDeaths : totalDeaths as int,
      totalRecovered: totalRecovered == freezed
          ? _value.totalRecovered
          : totalRecovered as int,
      totalTestsConducted: totalTestsConducted == freezed
          ? _value.totalTestsConducted
          : totalTestsConducted as int,
      totalPUMs: totalPUMs == freezed ? _value.totalPUMs : totalPUMs as int,
      totalPUIs: totalPUIs == freezed ? _value.totalPUIs : totalPUIs as int,
      totalInfected: totalInfected == freezed
          ? _value.totalInfected
          : totalInfected as int,
      totalPUIsTested: totalPUIsTested == freezed
          ? _value.totalPUIsTested
          : totalPUIsTested as int,
    ));
  }
}

abstract class _$NcovStatisticBasicCopyWith<$Res>
    implements $NcovStatisticBasicCopyWith<$Res> {
  factory _$NcovStatisticBasicCopyWith(
          _NcovStatisticBasic value, $Res Function(_NcovStatisticBasic) then) =
      __$NcovStatisticBasicCopyWithImpl<$Res>;
  @override
  $Res call(
      {int totalDeaths,
      int totalRecovered,
      int totalTestsConducted,
      int totalPUMs,
      int totalPUIs,
      int totalInfected,
      int totalPUIsTested});
}

class __$NcovStatisticBasicCopyWithImpl<$Res>
    extends _$NcovStatisticBasicCopyWithImpl<$Res>
    implements _$NcovStatisticBasicCopyWith<$Res> {
  __$NcovStatisticBasicCopyWithImpl(
      _NcovStatisticBasic _value, $Res Function(_NcovStatisticBasic) _then)
      : super(_value, (v) => _then(v as _NcovStatisticBasic));

  @override
  _NcovStatisticBasic get _value => super._value as _NcovStatisticBasic;

  @override
  $Res call({
    Object totalDeaths = freezed,
    Object totalRecovered = freezed,
    Object totalTestsConducted = freezed,
    Object totalPUMs = freezed,
    Object totalPUIs = freezed,
    Object totalInfected = freezed,
    Object totalPUIsTested = freezed,
  }) {
    return _then(_NcovStatisticBasic(
      totalDeaths:
          totalDeaths == freezed ? _value.totalDeaths : totalDeaths as int,
      totalRecovered: totalRecovered == freezed
          ? _value.totalRecovered
          : totalRecovered as int,
      totalTestsConducted: totalTestsConducted == freezed
          ? _value.totalTestsConducted
          : totalTestsConducted as int,
      totalPUMs: totalPUMs == freezed ? _value.totalPUMs : totalPUMs as int,
      totalPUIs: totalPUIs == freezed ? _value.totalPUIs : totalPUIs as int,
      totalInfected: totalInfected == freezed
          ? _value.totalInfected
          : totalInfected as int,
      totalPUIsTested: totalPUIsTested == freezed
          ? _value.totalPUIsTested
          : totalPUIsTested as int,
    ));
  }
}

@JsonSerializable()
class _$_NcovStatisticBasic implements _NcovStatisticBasic {
  const _$_NcovStatisticBasic(
      {this.totalDeaths,
      this.totalRecovered,
      this.totalTestsConducted,
      this.totalPUMs,
      this.totalPUIs,
      this.totalInfected,
      this.totalPUIsTested});

  factory _$_NcovStatisticBasic.fromJson(Map<String, dynamic> json) =>
      _$_$_NcovStatisticBasicFromJson(json);

  @override
  final int totalDeaths;
  @override
  final int totalRecovered;
  @override
  final int totalTestsConducted;
  @override
  final int totalPUMs;
  @override
  final int totalPUIs;
  @override
  final int totalInfected;
  @override
  final int totalPUIsTested;

  @override
  String toString() {
    return 'NcovStatisticBasic(totalDeaths: $totalDeaths, totalRecovered: $totalRecovered, totalTestsConducted: $totalTestsConducted, totalPUMs: $totalPUMs, totalPUIs: $totalPUIs, totalInfected: $totalInfected, totalPUIsTested: $totalPUIsTested)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NcovStatisticBasic &&
            (identical(other.totalDeaths, totalDeaths) ||
                const DeepCollectionEquality()
                    .equals(other.totalDeaths, totalDeaths)) &&
            (identical(other.totalRecovered, totalRecovered) ||
                const DeepCollectionEquality()
                    .equals(other.totalRecovered, totalRecovered)) &&
            (identical(other.totalTestsConducted, totalTestsConducted) ||
                const DeepCollectionEquality()
                    .equals(other.totalTestsConducted, totalTestsConducted)) &&
            (identical(other.totalPUMs, totalPUMs) ||
                const DeepCollectionEquality()
                    .equals(other.totalPUMs, totalPUMs)) &&
            (identical(other.totalPUIs, totalPUIs) ||
                const DeepCollectionEquality()
                    .equals(other.totalPUIs, totalPUIs)) &&
            (identical(other.totalInfected, totalInfected) ||
                const DeepCollectionEquality()
                    .equals(other.totalInfected, totalInfected)) &&
            (identical(other.totalPUIsTested, totalPUIsTested) ||
                const DeepCollectionEquality()
                    .equals(other.totalPUIsTested, totalPUIsTested)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(totalDeaths) ^
      const DeepCollectionEquality().hash(totalRecovered) ^
      const DeepCollectionEquality().hash(totalTestsConducted) ^
      const DeepCollectionEquality().hash(totalPUMs) ^
      const DeepCollectionEquality().hash(totalPUIs) ^
      const DeepCollectionEquality().hash(totalInfected) ^
      const DeepCollectionEquality().hash(totalPUIsTested);

  @override
  _$NcovStatisticBasicCopyWith<_NcovStatisticBasic> get copyWith =>
      __$NcovStatisticBasicCopyWithImpl<_NcovStatisticBasic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NcovStatisticBasicToJson(this);
  }
}

abstract class _NcovStatisticBasic implements NcovStatisticBasic {
  const factory _NcovStatisticBasic(
      {int totalDeaths,
      int totalRecovered,
      int totalTestsConducted,
      int totalPUMs,
      int totalPUIs,
      int totalInfected,
      int totalPUIsTested}) = _$_NcovStatisticBasic;

  factory _NcovStatisticBasic.fromJson(Map<String, dynamic> json) =
      _$_NcovStatisticBasic.fromJson;

  @override
  int get totalDeaths;
  @override
  int get totalRecovered;
  @override
  int get totalTestsConducted;
  @override
  int get totalPUMs;
  @override
  int get totalPUIs;
  @override
  int get totalInfected;
  @override
  int get totalPUIsTested;
  @override
  _$NcovStatisticBasicCopyWith<_NcovStatisticBasic> get copyWith;
}
