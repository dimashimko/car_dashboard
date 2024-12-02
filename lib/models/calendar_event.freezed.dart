// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalendarEvent _$CalendarEventFromJson(Map<String, dynamic> json) {
  return _CalendarEvent.fromJson(json);
}

/// @nodoc
mixin _$CalendarEvent {
  int get id => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  @ColorConverter()
  Color? get color => throw _privateConstructorUsedError;
  @ColorConverter()
  Color? get onColor => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get info => throw _privateConstructorUsedError;
  List<String> get participants => throw _privateConstructorUsedError;
  int get columnNumber => throw _privateConstructorUsedError;
  int get widthLevel => throw _privateConstructorUsedError;
  List<int> get relatedId => throw _privateConstructorUsedError;

  /// Serializes this CalendarEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalendarEventCopyWith<CalendarEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarEventCopyWith<$Res> {
  factory $CalendarEventCopyWith(
          CalendarEvent value, $Res Function(CalendarEvent) then) =
      _$CalendarEventCopyWithImpl<$Res, CalendarEvent>;
  @useResult
  $Res call(
      {int id,
      DateTime startTime,
      DateTime endTime,
      @ColorConverter() Color? color,
      @ColorConverter() Color? onColor,
      String title,
      String type,
      String? info,
      List<String> participants,
      int columnNumber,
      int widthLevel,
      List<int> relatedId});
}

/// @nodoc
class _$CalendarEventCopyWithImpl<$Res, $Val extends CalendarEvent>
    implements $CalendarEventCopyWith<$Res> {
  _$CalendarEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? color = freezed,
    Object? onColor = freezed,
    Object? title = null,
    Object? type = null,
    Object? info = freezed,
    Object? participants = null,
    Object? columnNumber = null,
    Object? widthLevel = null,
    Object? relatedId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      onColor: freezed == onColor
          ? _value.onColor
          : onColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String?,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      columnNumber: null == columnNumber
          ? _value.columnNumber
          : columnNumber // ignore: cast_nullable_to_non_nullable
              as int,
      widthLevel: null == widthLevel
          ? _value.widthLevel
          : widthLevel // ignore: cast_nullable_to_non_nullable
              as int,
      relatedId: null == relatedId
          ? _value.relatedId
          : relatedId // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarEventImplCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$$CalendarEventImplCopyWith(
          _$CalendarEventImpl value, $Res Function(_$CalendarEventImpl) then) =
      __$$CalendarEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime startTime,
      DateTime endTime,
      @ColorConverter() Color? color,
      @ColorConverter() Color? onColor,
      String title,
      String type,
      String? info,
      List<String> participants,
      int columnNumber,
      int widthLevel,
      List<int> relatedId});
}

/// @nodoc
class __$$CalendarEventImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$CalendarEventImpl>
    implements _$$CalendarEventImplCopyWith<$Res> {
  __$$CalendarEventImplCopyWithImpl(
      _$CalendarEventImpl _value, $Res Function(_$CalendarEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? color = freezed,
    Object? onColor = freezed,
    Object? title = null,
    Object? type = null,
    Object? info = freezed,
    Object? participants = null,
    Object? columnNumber = null,
    Object? widthLevel = null,
    Object? relatedId = null,
  }) {
    return _then(_$CalendarEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      onColor: freezed == onColor
          ? _value.onColor
          : onColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String?,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      columnNumber: null == columnNumber
          ? _value.columnNumber
          : columnNumber // ignore: cast_nullable_to_non_nullable
              as int,
      widthLevel: null == widthLevel
          ? _value.widthLevel
          : widthLevel // ignore: cast_nullable_to_non_nullable
              as int,
      relatedId: null == relatedId
          ? _value._relatedId
          : relatedId // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalendarEventImpl implements _CalendarEvent {
  const _$CalendarEventImpl(
      {required this.id,
      required this.startTime,
      required this.endTime,
      @ColorConverter() this.color,
      @ColorConverter() this.onColor,
      required this.title,
      required this.type,
      this.info,
      required final List<String> participants,
      this.columnNumber = 1,
      this.widthLevel = 1,
      final List<int> relatedId = const []})
      : _participants = participants,
        _relatedId = relatedId;

  factory _$CalendarEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarEventImplFromJson(json);

  @override
  final int id;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  @ColorConverter()
  final Color? color;
  @override
  @ColorConverter()
  final Color? onColor;
  @override
  final String title;
  @override
  final String type;
  @override
  final String? info;
  final List<String> _participants;
  @override
  List<String> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  @JsonKey()
  final int columnNumber;
  @override
  @JsonKey()
  final int widthLevel;
  final List<int> _relatedId;
  @override
  @JsonKey()
  List<int> get relatedId {
    if (_relatedId is EqualUnmodifiableListView) return _relatedId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedId);
  }

  @override
  String toString() {
    return 'CalendarEvent(id: $id, startTime: $startTime, endTime: $endTime, color: $color, onColor: $onColor, title: $title, type: $type, info: $info, participants: $participants, columnNumber: $columnNumber, widthLevel: $widthLevel, relatedId: $relatedId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.onColor, onColor) || other.onColor == onColor) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            (identical(other.columnNumber, columnNumber) ||
                other.columnNumber == columnNumber) &&
            (identical(other.widthLevel, widthLevel) ||
                other.widthLevel == widthLevel) &&
            const DeepCollectionEquality()
                .equals(other._relatedId, _relatedId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      startTime,
      endTime,
      color,
      onColor,
      title,
      type,
      info,
      const DeepCollectionEquality().hash(_participants),
      columnNumber,
      widthLevel,
      const DeepCollectionEquality().hash(_relatedId));

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarEventImplCopyWith<_$CalendarEventImpl> get copyWith =>
      __$$CalendarEventImplCopyWithImpl<_$CalendarEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarEventImplToJson(
      this,
    );
  }
}

abstract class _CalendarEvent implements CalendarEvent {
  const factory _CalendarEvent(
      {required final int id,
      required final DateTime startTime,
      required final DateTime endTime,
      @ColorConverter() final Color? color,
      @ColorConverter() final Color? onColor,
      required final String title,
      required final String type,
      final String? info,
      required final List<String> participants,
      final int columnNumber,
      final int widthLevel,
      final List<int> relatedId}) = _$CalendarEventImpl;

  factory _CalendarEvent.fromJson(Map<String, dynamic> json) =
      _$CalendarEventImpl.fromJson;

  @override
  int get id;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  @ColorConverter()
  Color? get color;
  @override
  @ColorConverter()
  Color? get onColor;
  @override
  String get title;
  @override
  String get type;
  @override
  String? get info;
  @override
  List<String> get participants;
  @override
  int get columnNumber;
  @override
  int get widthLevel;
  @override
  List<int> get relatedId;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalendarEventImplCopyWith<_$CalendarEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
