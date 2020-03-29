// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'age_category_statistic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AgeCategoryStatisticTearOff {
  const _$AgeCategoryStatisticTearOff();

  _AgeCategoryStatistic call({String category, int value, String sex}) {
    return _AgeCategoryStatistic(
      category: category,
      value: value,
      sex: sex,
    );
  }
}

// ignore: unused_element
const $AgeCategoryStatistic = _$AgeCategoryStatisticTearOff();

mixin _$AgeCategoryStatistic {
  String get category;
  int get value;
  String get sex;

  $AgeCategoryStatisticCopyWith<AgeCategoryStatistic> get copyWith;
}

abstract class $AgeCategoryStatisticCopyWith<$Res> {
  factory $AgeCategoryStatisticCopyWith(AgeCategoryStatistic value,
          $Res Function(AgeCategoryStatistic) then) =
      _$AgeCategoryStatisticCopyWithImpl<$Res>;
  $Res call({String category, int value, String sex});
}

class _$AgeCategoryStatisticCopyWithImpl<$Res>
    implements $AgeCategoryStatisticCopyWith<$Res> {
  _$AgeCategoryStatisticCopyWithImpl(this._value, this._then);

  final AgeCategoryStatistic _value;
  // ignore: unused_field
  final $Res Function(AgeCategoryStatistic) _then;

  @override
  $Res call({
    Object category = freezed,
    Object value = freezed,
    Object sex = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed ? _value.category : category as String,
      value: value == freezed ? _value.value : value as int,
      sex: sex == freezed ? _value.sex : sex as String,
    ));
  }
}

abstract class _$AgeCategoryStatisticCopyWith<$Res>
    implements $AgeCategoryStatisticCopyWith<$Res> {
  factory _$AgeCategoryStatisticCopyWith(_AgeCategoryStatistic value,
          $Res Function(_AgeCategoryStatistic) then) =
      __$AgeCategoryStatisticCopyWithImpl<$Res>;
  @override
  $Res call({String category, int value, String sex});
}

class __$AgeCategoryStatisticCopyWithImpl<$Res>
    extends _$AgeCategoryStatisticCopyWithImpl<$Res>
    implements _$AgeCategoryStatisticCopyWith<$Res> {
  __$AgeCategoryStatisticCopyWithImpl(
      _AgeCategoryStatistic _value, $Res Function(_AgeCategoryStatistic) _then)
      : super(_value, (v) => _then(v as _AgeCategoryStatistic));

  @override
  _AgeCategoryStatistic get _value => super._value as _AgeCategoryStatistic;

  @override
  $Res call({
    Object category = freezed,
    Object value = freezed,
    Object sex = freezed,
  }) {
    return _then(_AgeCategoryStatistic(
      category: category == freezed ? _value.category : category as String,
      value: value == freezed ? _value.value : value as int,
      sex: sex == freezed ? _value.sex : sex as String,
    ));
  }
}

class _$_AgeCategoryStatistic implements _AgeCategoryStatistic {
  const _$_AgeCategoryStatistic({this.category, this.value, this.sex});

  @override
  final String category;
  @override
  final int value;
  @override
  final String sex;

  @override
  String toString() {
    return 'AgeCategoryStatistic(category: $category, value: $value, sex: $sex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AgeCategoryStatistic &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.sex, sex) ||
                const DeepCollectionEquality().equals(other.sex, sex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(sex);

  @override
  _$AgeCategoryStatisticCopyWith<_AgeCategoryStatistic> get copyWith =>
      __$AgeCategoryStatisticCopyWithImpl<_AgeCategoryStatistic>(
          this, _$identity);
}

abstract class _AgeCategoryStatistic implements AgeCategoryStatistic {
  const factory _AgeCategoryStatistic(
      {String category, int value, String sex}) = _$_AgeCategoryStatistic;

  @override
  String get category;
  @override
  int get value;
  @override
  String get sex;
  @override
  _$AgeCategoryStatisticCopyWith<_AgeCategoryStatistic> get copyWith;
}
