// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceSchedule _$ServiceScheduleFromJson(Map<String, dynamic> json) {
  return _ServiceSchedule.fromJson(json);
}

/// @nodoc
mixin _$ServiceSchedule {
  String get text => throw _privateConstructorUsedError;
  String get when => throw _privateConstructorUsedError;
  double get fixPrice => throw _privateConstructorUsedError;

  /// Serializes this ServiceSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceScheduleCopyWith<ServiceSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceScheduleCopyWith<$Res> {
  factory $ServiceScheduleCopyWith(
          ServiceSchedule value, $Res Function(ServiceSchedule) then) =
      _$ServiceScheduleCopyWithImpl<$Res, ServiceSchedule>;
  @useResult
  $Res call({String text, String when, double fixPrice});
}

/// @nodoc
class _$ServiceScheduleCopyWithImpl<$Res, $Val extends ServiceSchedule>
    implements $ServiceScheduleCopyWith<$Res> {
  _$ServiceScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? when = null,
    Object? fixPrice = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      when: null == when
          ? _value.when
          : when // ignore: cast_nullable_to_non_nullable
              as String,
      fixPrice: null == fixPrice
          ? _value.fixPrice
          : fixPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceScheduleImplCopyWith<$Res>
    implements $ServiceScheduleCopyWith<$Res> {
  factory _$$ServiceScheduleImplCopyWith(_$ServiceScheduleImpl value,
          $Res Function(_$ServiceScheduleImpl) then) =
      __$$ServiceScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String when, double fixPrice});
}

/// @nodoc
class __$$ServiceScheduleImplCopyWithImpl<$Res>
    extends _$ServiceScheduleCopyWithImpl<$Res, _$ServiceScheduleImpl>
    implements _$$ServiceScheduleImplCopyWith<$Res> {
  __$$ServiceScheduleImplCopyWithImpl(
      _$ServiceScheduleImpl _value, $Res Function(_$ServiceScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? when = null,
    Object? fixPrice = null,
  }) {
    return _then(_$ServiceScheduleImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      when: null == when
          ? _value.when
          : when // ignore: cast_nullable_to_non_nullable
              as String,
      fixPrice: null == fixPrice
          ? _value.fixPrice
          : fixPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceScheduleImpl implements _ServiceSchedule {
  const _$ServiceScheduleImpl(
      {required this.text, required this.when, required this.fixPrice});

  factory _$ServiceScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceScheduleImplFromJson(json);

  @override
  final String text;
  @override
  final String when;
  @override
  final double fixPrice;

  @override
  String toString() {
    return 'ServiceSchedule(text: $text, when: $when, fixPrice: $fixPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceScheduleImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.when, when) || other.when == when) &&
            (identical(other.fixPrice, fixPrice) ||
                other.fixPrice == fixPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, when, fixPrice);

  /// Create a copy of ServiceSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceScheduleImplCopyWith<_$ServiceScheduleImpl> get copyWith =>
      __$$ServiceScheduleImplCopyWithImpl<_$ServiceScheduleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceScheduleImplToJson(
      this,
    );
  }
}

abstract class _ServiceSchedule implements ServiceSchedule {
  const factory _ServiceSchedule(
      {required final String text,
      required final String when,
      required final double fixPrice}) = _$ServiceScheduleImpl;

  factory _ServiceSchedule.fromJson(Map<String, dynamic> json) =
      _$ServiceScheduleImpl.fromJson;

  @override
  String get text;
  @override
  String get when;
  @override
  double get fixPrice;

  /// Create a copy of ServiceSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceScheduleImplCopyWith<_$ServiceScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
