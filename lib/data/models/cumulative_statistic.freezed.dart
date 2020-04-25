// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'cumulative_statistic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CumulativeStatistic _$CumulativeStatisticFromJson(Map<String, dynamic> json) {
  return _CumulativeStatistic.fromJson(json);
}

class _$CumulativeStatisticTearOff {
  const _$CumulativeStatisticTearOff();

  _CumulativeStatistic call(String date, int value) {
    return _CumulativeStatistic(
      date,
      value,
    );
  }
}

// ignore: unused_element
const $CumulativeStatistic = _$CumulativeStatisticTearOff();

mixin _$CumulativeStatistic {
  String get date;
  int get value;

  Map<String, dynamic> toJson();
  $CumulativeStatisticCopyWith<CumulativeStatistic> get copyWith;
}

abstract class $CumulativeStatisticCopyWith<$Res> {
  factory $CumulativeStatisticCopyWith(
          CumulativeStatistic value, $Res Function(CumulativeStatistic) then) =
      _$CumulativeStatisticCopyWithImpl<$Res>;
  $Res call({String date, int value});
}

class _$CumulativeStatisticCopyWithImpl<$Res>
    implements $CumulativeStatisticCopyWith<$Res> {
  _$CumulativeStatisticCopyWithImpl(this._value, this._then);

  final CumulativeStatistic _value;
  // ignore: unused_field
  final $Res Function(CumulativeStatistic) _then;

  @override
  $Res call({
    Object date = freezed,
    Object value = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed ? _value.date : date as String,
      value: value == freezed ? _value.value : value as int,
    ));
  }
}

abstract class _$CumulativeStatisticCopyWith<$Res>
    implements $CumulativeStatisticCopyWith<$Res> {
  factory _$CumulativeStatisticCopyWith(_CumulativeStatistic value,
          $Res Function(_CumulativeStatistic) then) =
      __$CumulativeStatisticCopyWithImpl<$Res>;
  @override
  $Res call({String date, int value});
}

class __$CumulativeStatisticCopyWithImpl<$Res>
    extends _$CumulativeStatisticCopyWithImpl<$Res>
    implements _$CumulativeStatisticCopyWith<$Res> {
  __$CumulativeStatisticCopyWithImpl(
      _CumulativeStatistic _value, $Res Function(_CumulativeStatistic) _then)
      : super(_value, (v) => _then(v as _CumulativeStatistic));

  @override
  _CumulativeStatistic get _value => super._value as _CumulativeStatistic;

  @override
  $Res call({
    Object date = freezed,
    Object value = freezed,
  }) {
    return _then(_CumulativeStatistic(
      date == freezed ? _value.date : date as String,
      value == freezed ? _value.value : value as int,
    ));
  }
}

@JsonSerializable()
class _$_CumulativeStatistic implements _CumulativeStatistic {
  const _$_CumulativeStatistic(this.date, this.value)
      : assert(date != null),
        assert(value != null);

  factory _$_CumulativeStatistic.fromJson(Map<String, dynamic> json) =>
      _$_$_CumulativeStatisticFromJson(json);

  @override
  final String date;
  @override
  final int value;

  @override
  String toString() {
    return 'CumulativeStatistic(date: $date, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CumulativeStatistic &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(value);

  @override
  _$CumulativeStatisticCopyWith<_CumulativeStatistic> get copyWith =>
      __$CumulativeStatisticCopyWithImpl<_CumulativeStatistic>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CumulativeStatisticToJson(this);
  }
}

abstract class _CumulativeStatistic implements CumulativeStatistic {
  const factory _CumulativeStatistic(String date, int value) =
      _$_CumulativeStatistic;

  factory _CumulativeStatistic.fromJson(Map<String, dynamic> json) =
      _$_CumulativeStatistic.fromJson;

  @override
  String get date;
  @override
  int get value;
  @override
  _$CumulativeStatisticCopyWith<_CumulativeStatistic> get copyWith;
}
