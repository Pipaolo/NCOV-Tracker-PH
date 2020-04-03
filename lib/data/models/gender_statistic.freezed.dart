// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'gender_statistic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$GenderStatisticTearOff {
  const _$GenderStatisticTearOff();

  _GenderStatistic call({int value, String gender}) {
    return _GenderStatistic(
      value: value,
      gender: gender,
    );
  }
}

// ignore: unused_element
const $GenderStatistic = _$GenderStatisticTearOff();

mixin _$GenderStatistic {
  int get value;
  String get gender;

  $GenderStatisticCopyWith<GenderStatistic> get copyWith;
}

abstract class $GenderStatisticCopyWith<$Res> {
  factory $GenderStatisticCopyWith(
          GenderStatistic value, $Res Function(GenderStatistic) then) =
      _$GenderStatisticCopyWithImpl<$Res>;
  $Res call({int value, String gender});
}

class _$GenderStatisticCopyWithImpl<$Res>
    implements $GenderStatisticCopyWith<$Res> {
  _$GenderStatisticCopyWithImpl(this._value, this._then);

  final GenderStatistic _value;
  // ignore: unused_field
  final $Res Function(GenderStatistic) _then;

  @override
  $Res call({
    Object value = freezed,
    Object gender = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed ? _value.value : value as int,
      gender: gender == freezed ? _value.gender : gender as String,
    ));
  }
}

abstract class _$GenderStatisticCopyWith<$Res>
    implements $GenderStatisticCopyWith<$Res> {
  factory _$GenderStatisticCopyWith(
          _GenderStatistic value, $Res Function(_GenderStatistic) then) =
      __$GenderStatisticCopyWithImpl<$Res>;
  @override
  $Res call({int value, String gender});
}

class __$GenderStatisticCopyWithImpl<$Res>
    extends _$GenderStatisticCopyWithImpl<$Res>
    implements _$GenderStatisticCopyWith<$Res> {
  __$GenderStatisticCopyWithImpl(
      _GenderStatistic _value, $Res Function(_GenderStatistic) _then)
      : super(_value, (v) => _then(v as _GenderStatistic));

  @override
  _GenderStatistic get _value => super._value as _GenderStatistic;

  @override
  $Res call({
    Object value = freezed,
    Object gender = freezed,
  }) {
    return _then(_GenderStatistic(
      value: value == freezed ? _value.value : value as int,
      gender: gender == freezed ? _value.gender : gender as String,
    ));
  }
}

class _$_GenderStatistic implements _GenderStatistic {
  const _$_GenderStatistic({this.value, this.gender});

  @override
  final int value;
  @override
  final String gender;

  @override
  String toString() {
    return 'GenderStatistic(value: $value, gender: $gender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GenderStatistic &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(gender);

  @override
  _$GenderStatisticCopyWith<_GenderStatistic> get copyWith =>
      __$GenderStatisticCopyWithImpl<_GenderStatistic>(this, _$identity);
}

abstract class _GenderStatistic implements GenderStatistic {
  const factory _GenderStatistic({int value, String gender}) =
      _$_GenderStatistic;

  @override
  int get value;
  @override
  String get gender;
  @override
  _$GenderStatisticCopyWith<_GenderStatistic> get copyWith;
}
