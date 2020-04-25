// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'age_category_statistic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AgeCategoryStatisticTearOff {
  const _$AgeCategoryStatisticTearOff();

  _AgeCategoryStatistic call(
      {String ageGroup, GenderStatistic male, GenderStatistic female}) {
    return _AgeCategoryStatistic(
      ageGroup: ageGroup,
      male: male,
      female: female,
    );
  }
}

// ignore: unused_element
const $AgeCategoryStatistic = _$AgeCategoryStatisticTearOff();

mixin _$AgeCategoryStatistic {
  String get ageGroup;
  GenderStatistic get male;
  GenderStatistic get female;

  $AgeCategoryStatisticCopyWith<AgeCategoryStatistic> get copyWith;
}

abstract class $AgeCategoryStatisticCopyWith<$Res> {
  factory $AgeCategoryStatisticCopyWith(AgeCategoryStatistic value,
          $Res Function(AgeCategoryStatistic) then) =
      _$AgeCategoryStatisticCopyWithImpl<$Res>;
  $Res call({String ageGroup, GenderStatistic male, GenderStatistic female});

  $GenderStatisticCopyWith<$Res> get male;
  $GenderStatisticCopyWith<$Res> get female;
}

class _$AgeCategoryStatisticCopyWithImpl<$Res>
    implements $AgeCategoryStatisticCopyWith<$Res> {
  _$AgeCategoryStatisticCopyWithImpl(this._value, this._then);

  final AgeCategoryStatistic _value;
  // ignore: unused_field
  final $Res Function(AgeCategoryStatistic) _then;

  @override
  $Res call({
    Object ageGroup = freezed,
    Object male = freezed,
    Object female = freezed,
  }) {
    return _then(_value.copyWith(
      ageGroup: ageGroup == freezed ? _value.ageGroup : ageGroup as String,
      male: male == freezed ? _value.male : male as GenderStatistic,
      female: female == freezed ? _value.female : female as GenderStatistic,
    ));
  }

  @override
  $GenderStatisticCopyWith<$Res> get male {
    if (_value.male == null) {
      return null;
    }
    return $GenderStatisticCopyWith<$Res>(_value.male, (value) {
      return _then(_value.copyWith(male: value));
    });
  }

  @override
  $GenderStatisticCopyWith<$Res> get female {
    if (_value.female == null) {
      return null;
    }
    return $GenderStatisticCopyWith<$Res>(_value.female, (value) {
      return _then(_value.copyWith(female: value));
    });
  }
}

abstract class _$AgeCategoryStatisticCopyWith<$Res>
    implements $AgeCategoryStatisticCopyWith<$Res> {
  factory _$AgeCategoryStatisticCopyWith(_AgeCategoryStatistic value,
          $Res Function(_AgeCategoryStatistic) then) =
      __$AgeCategoryStatisticCopyWithImpl<$Res>;
  @override
  $Res call({String ageGroup, GenderStatistic male, GenderStatistic female});

  @override
  $GenderStatisticCopyWith<$Res> get male;
  @override
  $GenderStatisticCopyWith<$Res> get female;
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
    Object ageGroup = freezed,
    Object male = freezed,
    Object female = freezed,
  }) {
    return _then(_AgeCategoryStatistic(
      ageGroup: ageGroup == freezed ? _value.ageGroup : ageGroup as String,
      male: male == freezed ? _value.male : male as GenderStatistic,
      female: female == freezed ? _value.female : female as GenderStatistic,
    ));
  }
}

class _$_AgeCategoryStatistic implements _AgeCategoryStatistic {
  const _$_AgeCategoryStatistic({this.ageGroup, this.male, this.female});

  @override
  final String ageGroup;
  @override
  final GenderStatistic male;
  @override
  final GenderStatistic female;

  @override
  String toString() {
    return 'AgeCategoryStatistic(ageGroup: $ageGroup, male: $male, female: $female)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AgeCategoryStatistic &&
            (identical(other.ageGroup, ageGroup) ||
                const DeepCollectionEquality()
                    .equals(other.ageGroup, ageGroup)) &&
            (identical(other.male, male) ||
                const DeepCollectionEquality().equals(other.male, male)) &&
            (identical(other.female, female) ||
                const DeepCollectionEquality().equals(other.female, female)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ageGroup) ^
      const DeepCollectionEquality().hash(male) ^
      const DeepCollectionEquality().hash(female);

  @override
  _$AgeCategoryStatisticCopyWith<_AgeCategoryStatistic> get copyWith =>
      __$AgeCategoryStatisticCopyWithImpl<_AgeCategoryStatistic>(
          this, _$identity);
}

abstract class _AgeCategoryStatistic implements AgeCategoryStatistic {
  const factory _AgeCategoryStatistic(
      {String ageGroup,
      GenderStatistic male,
      GenderStatistic female}) = _$_AgeCategoryStatistic;

  @override
  String get ageGroup;
  @override
  GenderStatistic get male;
  @override
  GenderStatistic get female;
  @override
  _$AgeCategoryStatisticCopyWith<_AgeCategoryStatistic> get copyWith;
}
