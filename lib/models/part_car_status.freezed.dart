// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part_car_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PartCarStatus _$PartCarStatusFromJson(Map<String, dynamic> json) {
  return _PartCarStatus.fromJson(json);
}

/// @nodoc
mixin _$PartCarStatus {
  String get imagePath => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get carPart => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  double get condition => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get color => throw _privateConstructorUsedError;

  /// Serializes this PartCarStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PartCarStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PartCarStatusCopyWith<PartCarStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartCarStatusCopyWith<$Res> {
  factory $PartCarStatusCopyWith(
          PartCarStatus value, $Res Function(PartCarStatus) then) =
      _$PartCarStatusCopyWithImpl<$Res, PartCarStatus>;
  @useResult
  $Res call(
      {String imagePath,
      String name,
      String carPart,
      String status,
      double condition,
      @ColorConverter() Color color});
}

/// @nodoc
class _$PartCarStatusCopyWithImpl<$Res, $Val extends PartCarStatus>
    implements $PartCarStatusCopyWith<$Res> {
  _$PartCarStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PartCarStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? name = null,
    Object? carPart = null,
    Object? status = null,
    Object? condition = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      carPart: null == carPart
          ? _value.carPart
          : carPart // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartCarStatusImplCopyWith<$Res>
    implements $PartCarStatusCopyWith<$Res> {
  factory _$$PartCarStatusImplCopyWith(
          _$PartCarStatusImpl value, $Res Function(_$PartCarStatusImpl) then) =
      __$$PartCarStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String imagePath,
      String name,
      String carPart,
      String status,
      double condition,
      @ColorConverter() Color color});
}

/// @nodoc
class __$$PartCarStatusImplCopyWithImpl<$Res>
    extends _$PartCarStatusCopyWithImpl<$Res, _$PartCarStatusImpl>
    implements _$$PartCarStatusImplCopyWith<$Res> {
  __$$PartCarStatusImplCopyWithImpl(
      _$PartCarStatusImpl _value, $Res Function(_$PartCarStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of PartCarStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? name = null,
    Object? carPart = null,
    Object? status = null,
    Object? condition = null,
    Object? color = null,
  }) {
    return _then(_$PartCarStatusImpl(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      carPart: null == carPart
          ? _value.carPart
          : carPart // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartCarStatusImpl implements _PartCarStatus {
  const _$PartCarStatusImpl(
      {required this.imagePath,
      required this.name,
      required this.carPart,
      required this.status,
      required this.condition,
      @ColorConverter() required this.color});

  factory _$PartCarStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartCarStatusImplFromJson(json);

  @override
  final String imagePath;
  @override
  final String name;
  @override
  final String carPart;
  @override
  final String status;
  @override
  final double condition;
  @override
  @ColorConverter()
  final Color color;

  @override
  String toString() {
    return 'PartCarStatus(imagePath: $imagePath, name: $name, carPart: $carPart, status: $status, condition: $condition, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartCarStatusImpl &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.carPart, carPart) || other.carPart == carPart) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, imagePath, name, carPart, status, condition, color);

  /// Create a copy of PartCarStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PartCarStatusImplCopyWith<_$PartCarStatusImpl> get copyWith =>
      __$$PartCarStatusImplCopyWithImpl<_$PartCarStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartCarStatusImplToJson(
      this,
    );
  }
}

abstract class _PartCarStatus implements PartCarStatus {
  const factory _PartCarStatus(
      {required final String imagePath,
      required final String name,
      required final String carPart,
      required final String status,
      required final double condition,
      @ColorConverter() required final Color color}) = _$PartCarStatusImpl;

  factory _PartCarStatus.fromJson(Map<String, dynamic> json) =
      _$PartCarStatusImpl.fromJson;

  @override
  String get imagePath;
  @override
  String get name;
  @override
  String get carPart;
  @override
  String get status;
  @override
  double get condition;
  @override
  @ColorConverter()
  Color get color;

  /// Create a copy of PartCarStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PartCarStatusImplCopyWith<_$PartCarStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
