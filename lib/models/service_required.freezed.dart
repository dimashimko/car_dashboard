// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_required.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceRequired _$ServiceRequiredFromJson(Map<String, dynamic> json) {
  return _ServiceRequired.fromJson(json);
}

/// @nodoc
mixin _$ServiceRequired {
  String get name => throw _privateConstructorUsedError;
  String get iconPath => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get color => throw _privateConstructorUsedError;
  int get processing => throw _privateConstructorUsedError;

  /// Serializes this ServiceRequired to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceRequired
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceRequiredCopyWith<ServiceRequired> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequiredCopyWith<$Res> {
  factory $ServiceRequiredCopyWith(
          ServiceRequired value, $Res Function(ServiceRequired) then) =
      _$ServiceRequiredCopyWithImpl<$Res, ServiceRequired>;
  @useResult
  $Res call(
      {String name,
      String iconPath,
      double price,
      @ColorConverter() Color color,
      int processing});
}

/// @nodoc
class _$ServiceRequiredCopyWithImpl<$Res, $Val extends ServiceRequired>
    implements $ServiceRequiredCopyWith<$Res> {
  _$ServiceRequiredCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceRequired
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? iconPath = null,
    Object? price = null,
    Object? color = null,
    Object? processing = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconPath: null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      processing: null == processing
          ? _value.processing
          : processing // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceRequiredImplCopyWith<$Res>
    implements $ServiceRequiredCopyWith<$Res> {
  factory _$$ServiceRequiredImplCopyWith(_$ServiceRequiredImpl value,
          $Res Function(_$ServiceRequiredImpl) then) =
      __$$ServiceRequiredImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String iconPath,
      double price,
      @ColorConverter() Color color,
      int processing});
}

/// @nodoc
class __$$ServiceRequiredImplCopyWithImpl<$Res>
    extends _$ServiceRequiredCopyWithImpl<$Res, _$ServiceRequiredImpl>
    implements _$$ServiceRequiredImplCopyWith<$Res> {
  __$$ServiceRequiredImplCopyWithImpl(
      _$ServiceRequiredImpl _value, $Res Function(_$ServiceRequiredImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceRequired
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? iconPath = null,
    Object? price = null,
    Object? color = null,
    Object? processing = null,
  }) {
    return _then(_$ServiceRequiredImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconPath: null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      processing: null == processing
          ? _value.processing
          : processing // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceRequiredImpl implements _ServiceRequired {
  const _$ServiceRequiredImpl(
      {required this.name,
      required this.iconPath,
      required this.price,
      @ColorConverter() required this.color,
      required this.processing});

  factory _$ServiceRequiredImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceRequiredImplFromJson(json);

  @override
  final String name;
  @override
  final String iconPath;
  @override
  final double price;
  @override
  @ColorConverter()
  final Color color;
  @override
  final int processing;

  @override
  String toString() {
    return 'ServiceRequired(name: $name, iconPath: $iconPath, price: $price, color: $color, processing: $processing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceRequiredImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.processing, processing) ||
                other.processing == processing));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, iconPath, price, color, processing);

  /// Create a copy of ServiceRequired
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceRequiredImplCopyWith<_$ServiceRequiredImpl> get copyWith =>
      __$$ServiceRequiredImplCopyWithImpl<_$ServiceRequiredImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceRequiredImplToJson(
      this,
    );
  }
}

abstract class _ServiceRequired implements ServiceRequired {
  const factory _ServiceRequired(
      {required final String name,
      required final String iconPath,
      required final double price,
      @ColorConverter() required final Color color,
      required final int processing}) = _$ServiceRequiredImpl;

  factory _ServiceRequired.fromJson(Map<String, dynamic> json) =
      _$ServiceRequiredImpl.fromJson;

  @override
  String get name;
  @override
  String get iconPath;
  @override
  double get price;
  @override
  @ColorConverter()
  Color get color;
  @override
  int get processing;

  /// Create a copy of ServiceRequired
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceRequiredImplCopyWith<_$ServiceRequiredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
