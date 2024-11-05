// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_car.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingCar _$BookingCarFromJson(Map<String, dynamic> json) {
  return _BookingCar.fromJson(json);
}

/// @nodoc
mixin _$BookingCar {
  String get name => throw _privateConstructorUsedError;
  String get classCar => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get passengers => throw _privateConstructorUsedError;
  String get returningType => throw _privateConstructorUsedError;
  int get priceForDay => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  /// Serializes this BookingCar to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingCar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingCarCopyWith<BookingCar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingCarCopyWith<$Res> {
  factory $BookingCarCopyWith(
          BookingCar value, $Res Function(BookingCar) then) =
      _$BookingCarCopyWithImpl<$Res, BookingCar>;
  @useResult
  $Res call(
      {String name,
      String classCar,
      String image,
      int passengers,
      String returningType,
      int priceForDay,
      bool isSelected});
}

/// @nodoc
class _$BookingCarCopyWithImpl<$Res, $Val extends BookingCar>
    implements $BookingCarCopyWith<$Res> {
  _$BookingCarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingCar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? classCar = null,
    Object? image = null,
    Object? passengers = null,
    Object? returningType = null,
    Object? priceForDay = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      classCar: null == classCar
          ? _value.classCar
          : classCar // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      passengers: null == passengers
          ? _value.passengers
          : passengers // ignore: cast_nullable_to_non_nullable
              as int,
      returningType: null == returningType
          ? _value.returningType
          : returningType // ignore: cast_nullable_to_non_nullable
              as String,
      priceForDay: null == priceForDay
          ? _value.priceForDay
          : priceForDay // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingCarImplCopyWith<$Res>
    implements $BookingCarCopyWith<$Res> {
  factory _$$BookingCarImplCopyWith(
          _$BookingCarImpl value, $Res Function(_$BookingCarImpl) then) =
      __$$BookingCarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String classCar,
      String image,
      int passengers,
      String returningType,
      int priceForDay,
      bool isSelected});
}

/// @nodoc
class __$$BookingCarImplCopyWithImpl<$Res>
    extends _$BookingCarCopyWithImpl<$Res, _$BookingCarImpl>
    implements _$$BookingCarImplCopyWith<$Res> {
  __$$BookingCarImplCopyWithImpl(
      _$BookingCarImpl _value, $Res Function(_$BookingCarImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingCar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? classCar = null,
    Object? image = null,
    Object? passengers = null,
    Object? returningType = null,
    Object? priceForDay = null,
    Object? isSelected = null,
  }) {
    return _then(_$BookingCarImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      classCar: null == classCar
          ? _value.classCar
          : classCar // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      passengers: null == passengers
          ? _value.passengers
          : passengers // ignore: cast_nullable_to_non_nullable
              as int,
      returningType: null == returningType
          ? _value.returningType
          : returningType // ignore: cast_nullable_to_non_nullable
              as String,
      priceForDay: null == priceForDay
          ? _value.priceForDay
          : priceForDay // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingCarImpl implements _BookingCar {
  const _$BookingCarImpl(
      {required this.name,
      required this.classCar,
      required this.image,
      required this.passengers,
      required this.returningType,
      required this.priceForDay,
      required this.isSelected});

  factory _$BookingCarImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingCarImplFromJson(json);

  @override
  final String name;
  @override
  final String classCar;
  @override
  final String image;
  @override
  final int passengers;
  @override
  final String returningType;
  @override
  final int priceForDay;
  @override
  final bool isSelected;

  @override
  String toString() {
    return 'BookingCar(name: $name, classCar: $classCar, image: $image, passengers: $passengers, returningType: $returningType, priceForDay: $priceForDay, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingCarImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.classCar, classCar) ||
                other.classCar == classCar) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.passengers, passengers) ||
                other.passengers == passengers) &&
            (identical(other.returningType, returningType) ||
                other.returningType == returningType) &&
            (identical(other.priceForDay, priceForDay) ||
                other.priceForDay == priceForDay) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, classCar, image,
      passengers, returningType, priceForDay, isSelected);

  /// Create a copy of BookingCar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingCarImplCopyWith<_$BookingCarImpl> get copyWith =>
      __$$BookingCarImplCopyWithImpl<_$BookingCarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingCarImplToJson(
      this,
    );
  }
}

abstract class _BookingCar implements BookingCar {
  const factory _BookingCar(
      {required final String name,
      required final String classCar,
      required final String image,
      required final int passengers,
      required final String returningType,
      required final int priceForDay,
      required final bool isSelected}) = _$BookingCarImpl;

  factory _BookingCar.fromJson(Map<String, dynamic> json) =
      _$BookingCarImpl.fromJson;

  @override
  String get name;
  @override
  String get classCar;
  @override
  String get image;
  @override
  int get passengers;
  @override
  String get returningType;
  @override
  int get priceForDay;
  @override
  bool get isSelected;

  /// Create a copy of BookingCar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingCarImplCopyWith<_$BookingCarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
