// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceOrder _$ServiceOrderFromJson(Map<String, dynamic> json) {
  return _ServiceOrder.fromJson(json);
}

/// @nodoc
mixin _$ServiceOrder {
  String get name => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get color => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  /// Serializes this ServiceOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceOrderCopyWith<ServiceOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceOrderCopyWith<$Res> {
  factory $ServiceOrderCopyWith(
          ServiceOrder value, $Res Function(ServiceOrder) then) =
      _$ServiceOrderCopyWithImpl<$Res, ServiceOrder>;
  @useResult
  $Res call({String name, @ColorConverter() Color color, double price});
}

/// @nodoc
class _$ServiceOrderCopyWithImpl<$Res, $Val extends ServiceOrder>
    implements $ServiceOrderCopyWith<$Res> {
  _$ServiceOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceOrderImplCopyWith<$Res>
    implements $ServiceOrderCopyWith<$Res> {
  factory _$$ServiceOrderImplCopyWith(
          _$ServiceOrderImpl value, $Res Function(_$ServiceOrderImpl) then) =
      __$$ServiceOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, @ColorConverter() Color color, double price});
}

/// @nodoc
class __$$ServiceOrderImplCopyWithImpl<$Res>
    extends _$ServiceOrderCopyWithImpl<$Res, _$ServiceOrderImpl>
    implements _$$ServiceOrderImplCopyWith<$Res> {
  __$$ServiceOrderImplCopyWithImpl(
      _$ServiceOrderImpl _value, $Res Function(_$ServiceOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
    Object? price = null,
  }) {
    return _then(_$ServiceOrderImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceOrderImpl implements _ServiceOrder {
  const _$ServiceOrderImpl(
      {required this.name,
      @ColorConverter() required this.color,
      required this.price});

  factory _$ServiceOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceOrderImplFromJson(json);

  @override
  final String name;
  @override
  @ColorConverter()
  final Color color;
  @override
  final double price;

  @override
  String toString() {
    return 'ServiceOrder(name: $name, color: $color, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceOrderImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, color, price);

  /// Create a copy of ServiceOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceOrderImplCopyWith<_$ServiceOrderImpl> get copyWith =>
      __$$ServiceOrderImplCopyWithImpl<_$ServiceOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceOrderImplToJson(
      this,
    );
  }
}

abstract class _ServiceOrder implements ServiceOrder {
  const factory _ServiceOrder(
      {required final String name,
      @ColorConverter() required final Color color,
      required final double price}) = _$ServiceOrderImpl;

  factory _ServiceOrder.fromJson(Map<String, dynamic> json) =
      _$ServiceOrderImpl.fromJson;

  @override
  String get name;
  @override
  @ColorConverter()
  Color get color;
  @override
  double get price;

  /// Create a copy of ServiceOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceOrderImplCopyWith<_$ServiceOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
