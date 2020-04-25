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
      {@required int totalDeaths,
      @required int totalRecovered,
      @required int totalTestsConducted,
      @required int totalInfected,
      @required int prevDeaths,
      @required int prevRecovered,
      @required int prevTestsConducted,
      @required int prevInfected}) {
    return _NcovStatisticBasic(
      totalDeaths: totalDeaths,
      totalRecovered: totalRecovered,
      totalTestsConducted: totalTestsConducted,
      totalInfected: totalInfected,
      prevDeaths: prevDeaths,
      prevRecovered: prevRecovered,
      prevTestsConducted: prevTestsConducted,
      prevInfected: prevInfected,
    );
  }
}

// ignore: unused_element
const $NcovStatisticBasic = _$NcovStatisticBasicTearOff();

mixin _$NcovStatisticBasic {
  int get totalDeaths;
  int get totalRecovered;
  int get totalTestsConducted;
  int get totalInfected;
  int get prevDeaths;
  int get prevRecovered;
  int get prevTestsConducted;
  int get prevInfected;

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
      int totalInfected,
      int prevDeaths,
      int prevRecovered,
      int prevTestsConducted,
      int prevInfected});
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
    Object totalInfected = freezed,
    Object prevDeaths = freezed,
    Object prevRecovered = freezed,
    Object prevTestsConducted = freezed,
    Object prevInfected = freezed,
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
      totalInfected: totalInfected == freezed
          ? _value.totalInfected
          : totalInfected as int,
      prevDeaths: prevDeaths == freezed ? _value.prevDeaths : prevDeaths as int,
      prevRecovered: prevRecovered == freezed
          ? _value.prevRecovered
          : prevRecovered as int,
      prevTestsConducted: prevTestsConducted == freezed
          ? _value.prevTestsConducted
          : prevTestsConducted as int,
      prevInfected:
          prevInfected == freezed ? _value.prevInfected : prevInfected as int,
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
      int totalInfected,
      int prevDeaths,
      int prevRecovered,
      int prevTestsConducted,
      int prevInfected});
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
    Object totalInfected = freezed,
    Object prevDeaths = freezed,
    Object prevRecovered = freezed,
    Object prevTestsConducted = freezed,
    Object prevInfected = freezed,
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
      totalInfected: totalInfected == freezed
          ? _value.totalInfected
          : totalInfected as int,
      prevDeaths: prevDeaths == freezed ? _value.prevDeaths : prevDeaths as int,
      prevRecovered: prevRecovered == freezed
          ? _value.prevRecovered
          : prevRecovered as int,
      prevTestsConducted: prevTestsConducted == freezed
          ? _value.prevTestsConducted
          : prevTestsConducted as int,
      prevInfected:
          prevInfected == freezed ? _value.prevInfected : prevInfected as int,
    ));
  }
}

@JsonSerializable()
class _$_NcovStatisticBasic implements _NcovStatisticBasic {
  const _$_NcovStatisticBasic(
      {@required this.totalDeaths,
      @required this.totalRecovered,
      @required this.totalTestsConducted,
      @required this.totalInfected,
      @required this.prevDeaths,
      @required this.prevRecovered,
      @required this.prevTestsConducted,
      @required this.prevInfected})
      : assert(totalDeaths != null),
        assert(totalRecovered != null),
        assert(totalTestsConducted != null),
        assert(totalInfected != null),
        assert(prevDeaths != null),
        assert(prevRecovered != null),
        assert(prevTestsConducted != null),
        assert(prevInfected != null);

  factory _$_NcovStatisticBasic.fromJson(Map<String, dynamic> json) =>
      _$_$_NcovStatisticBasicFromJson(json);

  @override
  final int totalDeaths;
  @override
  final int totalRecovered;
  @override
  final int totalTestsConducted;
  @override
  final int totalInfected;
  @override
  final int prevDeaths;
  @override
  final int prevRecovered;
  @override
  final int prevTestsConducted;
  @override
  final int prevInfected;

  @override
  String toString() {
    return 'NcovStatisticBasic(totalDeaths: $totalDeaths, totalRecovered: $totalRecovered, totalTestsConducted: $totalTestsConducted, totalInfected: $totalInfected, prevDeaths: $prevDeaths, prevRecovered: $prevRecovered, prevTestsConducted: $prevTestsConducted, prevInfected: $prevInfected)';
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
            (identical(other.totalInfected, totalInfected) ||
                const DeepCollectionEquality()
                    .equals(other.totalInfected, totalInfected)) &&
            (identical(other.prevDeaths, prevDeaths) ||
                const DeepCollectionEquality()
                    .equals(other.prevDeaths, prevDeaths)) &&
            (identical(other.prevRecovered, prevRecovered) ||
                const DeepCollectionEquality()
                    .equals(other.prevRecovered, prevRecovered)) &&
            (identical(other.prevTestsConducted, prevTestsConducted) ||
                const DeepCollectionEquality()
                    .equals(other.prevTestsConducted, prevTestsConducted)) &&
            (identical(other.prevInfected, prevInfected) ||
                const DeepCollectionEquality()
                    .equals(other.prevInfected, prevInfected)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(totalDeaths) ^
      const DeepCollectionEquality().hash(totalRecovered) ^
      const DeepCollectionEquality().hash(totalTestsConducted) ^
      const DeepCollectionEquality().hash(totalInfected) ^
      const DeepCollectionEquality().hash(prevDeaths) ^
      const DeepCollectionEquality().hash(prevRecovered) ^
      const DeepCollectionEquality().hash(prevTestsConducted) ^
      const DeepCollectionEquality().hash(prevInfected);

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
      {@required int totalDeaths,
      @required int totalRecovered,
      @required int totalTestsConducted,
      @required int totalInfected,
      @required int prevDeaths,
      @required int prevRecovered,
      @required int prevTestsConducted,
      @required int prevInfected}) = _$_NcovStatisticBasic;

  factory _NcovStatisticBasic.fromJson(Map<String, dynamic> json) =
      _$_NcovStatisticBasic.fromJson;

  @override
  int get totalDeaths;
  @override
  int get totalRecovered;
  @override
  int get totalTestsConducted;
  @override
  int get totalInfected;
  @override
  int get prevDeaths;
  @override
  int get prevRecovered;
  @override
  int get prevTestsConducted;
  @override
  int get prevInfected;
  @override
  _$NcovStatisticBasicCopyWith<_NcovStatisticBasic> get copyWith;
}
