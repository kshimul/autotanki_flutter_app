// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return _Schedule.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  String get id => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get tank => throw _privateConstructorUsedError; // 'oht' | 'ugt'
  String get action => throw _privateConstructorUsedError; // 'ON' | 'OFF'
  String get cronExpression =>
      throw _privateConstructorUsedError; // e.g. "0 23 * * *"
  bool get isActive => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res, Schedule>;
  @useResult
  $Res call(
      {String id,
      String deviceId,
      String name,
      String tank,
      String action,
      String cronExpression,
      bool isActive,
      String? description,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res, $Val extends Schedule>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceId = null,
    Object? name = null,
    Object? tank = null,
    Object? action = null,
    Object? cronExpression = null,
    Object? isActive = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tank: null == tank
          ? _value.tank
          : tank // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      cronExpression: null == cronExpression
          ? _value.cronExpression
          : cronExpression // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleImplCopyWith<$Res>
    implements $ScheduleCopyWith<$Res> {
  factory _$$ScheduleImplCopyWith(
          _$ScheduleImpl value, $Res Function(_$ScheduleImpl) then) =
      __$$ScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String deviceId,
      String name,
      String tank,
      String action,
      String cronExpression,
      bool isActive,
      String? description,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$ScheduleImplCopyWithImpl<$Res>
    extends _$ScheduleCopyWithImpl<$Res, _$ScheduleImpl>
    implements _$$ScheduleImplCopyWith<$Res> {
  __$$ScheduleImplCopyWithImpl(
      _$ScheduleImpl _value, $Res Function(_$ScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceId = null,
    Object? name = null,
    Object? tank = null,
    Object? action = null,
    Object? cronExpression = null,
    Object? isActive = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ScheduleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tank: null == tank
          ? _value.tank
          : tank // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      cronExpression: null == cronExpression
          ? _value.cronExpression
          : cronExpression // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleImpl implements _Schedule {
  const _$ScheduleImpl(
      {required this.id,
      required this.deviceId,
      required this.name,
      required this.tank,
      required this.action,
      required this.cronExpression,
      this.isActive = true,
      this.description,
      required this.createdAt,
      required this.updatedAt});

  factory _$ScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleImplFromJson(json);

  @override
  final String id;
  @override
  final String deviceId;
  @override
  final String name;
  @override
  final String tank;
// 'oht' | 'ugt'
  @override
  final String action;
// 'ON' | 'OFF'
  @override
  final String cronExpression;
// e.g. "0 23 * * *"
  @override
  @JsonKey()
  final bool isActive;
  @override
  final String? description;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Schedule(id: $id, deviceId: $deviceId, name: $name, tank: $tank, action: $action, cronExpression: $cronExpression, isActive: $isActive, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.tank, tank) || other.tank == tank) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.cronExpression, cronExpression) ||
                other.cronExpression == cronExpression) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, deviceId, name, tank, action,
      cronExpression, isActive, description, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      __$$ScheduleImplCopyWithImpl<_$ScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleImplToJson(
      this,
    );
  }
}

abstract class _Schedule implements Schedule {
  const factory _Schedule(
      {required final String id,
      required final String deviceId,
      required final String name,
      required final String tank,
      required final String action,
      required final String cronExpression,
      final bool isActive,
      final String? description,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$ScheduleImpl;

  factory _Schedule.fromJson(Map<String, dynamic> json) =
      _$ScheduleImpl.fromJson;

  @override
  String get id;
  @override
  String get deviceId;
  @override
  String get name;
  @override
  String get tank;
  @override // 'oht' | 'ugt'
  String get action;
  @override // 'ON' | 'OFF'
  String get cronExpression;
  @override // e.g. "0 23 * * *"
  bool get isActive;
  @override
  String? get description;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateScheduleRequest _$CreateScheduleRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateScheduleRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateScheduleRequest {
  String get deviceId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get tank => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  String get cronExpression => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateScheduleRequestCopyWith<CreateScheduleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateScheduleRequestCopyWith<$Res> {
  factory $CreateScheduleRequestCopyWith(CreateScheduleRequest value,
          $Res Function(CreateScheduleRequest) then) =
      _$CreateScheduleRequestCopyWithImpl<$Res, CreateScheduleRequest>;
  @useResult
  $Res call(
      {String deviceId,
      String name,
      String tank,
      String action,
      String cronExpression,
      String? description});
}

/// @nodoc
class _$CreateScheduleRequestCopyWithImpl<$Res,
        $Val extends CreateScheduleRequest>
    implements $CreateScheduleRequestCopyWith<$Res> {
  _$CreateScheduleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? name = null,
    Object? tank = null,
    Object? action = null,
    Object? cronExpression = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tank: null == tank
          ? _value.tank
          : tank // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      cronExpression: null == cronExpression
          ? _value.cronExpression
          : cronExpression // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateScheduleRequestImplCopyWith<$Res>
    implements $CreateScheduleRequestCopyWith<$Res> {
  factory _$$CreateScheduleRequestImplCopyWith(
          _$CreateScheduleRequestImpl value,
          $Res Function(_$CreateScheduleRequestImpl) then) =
      __$$CreateScheduleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deviceId,
      String name,
      String tank,
      String action,
      String cronExpression,
      String? description});
}

/// @nodoc
class __$$CreateScheduleRequestImplCopyWithImpl<$Res>
    extends _$CreateScheduleRequestCopyWithImpl<$Res,
        _$CreateScheduleRequestImpl>
    implements _$$CreateScheduleRequestImplCopyWith<$Res> {
  __$$CreateScheduleRequestImplCopyWithImpl(_$CreateScheduleRequestImpl _value,
      $Res Function(_$CreateScheduleRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? name = null,
    Object? tank = null,
    Object? action = null,
    Object? cronExpression = null,
    Object? description = freezed,
  }) {
    return _then(_$CreateScheduleRequestImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tank: null == tank
          ? _value.tank
          : tank // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      cronExpression: null == cronExpression
          ? _value.cronExpression
          : cronExpression // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateScheduleRequestImpl implements _CreateScheduleRequest {
  const _$CreateScheduleRequestImpl(
      {required this.deviceId,
      required this.name,
      required this.tank,
      required this.action,
      required this.cronExpression,
      this.description});

  factory _$CreateScheduleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateScheduleRequestImplFromJson(json);

  @override
  final String deviceId;
  @override
  final String name;
  @override
  final String tank;
  @override
  final String action;
  @override
  final String cronExpression;
  @override
  final String? description;

  @override
  String toString() {
    return 'CreateScheduleRequest(deviceId: $deviceId, name: $name, tank: $tank, action: $action, cronExpression: $cronExpression, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateScheduleRequestImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.tank, tank) || other.tank == tank) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.cronExpression, cronExpression) ||
                other.cronExpression == cronExpression) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, deviceId, name, tank, action, cronExpression, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateScheduleRequestImplCopyWith<_$CreateScheduleRequestImpl>
      get copyWith => __$$CreateScheduleRequestImplCopyWithImpl<
          _$CreateScheduleRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateScheduleRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateScheduleRequest implements CreateScheduleRequest {
  const factory _CreateScheduleRequest(
      {required final String deviceId,
      required final String name,
      required final String tank,
      required final String action,
      required final String cronExpression,
      final String? description}) = _$CreateScheduleRequestImpl;

  factory _CreateScheduleRequest.fromJson(Map<String, dynamic> json) =
      _$CreateScheduleRequestImpl.fromJson;

  @override
  String get deviceId;
  @override
  String get name;
  @override
  String get tank;
  @override
  String get action;
  @override
  String get cronExpression;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$CreateScheduleRequestImplCopyWith<_$CreateScheduleRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
