// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SupportTicket _$SupportTicketFromJson(Map<String, dynamic> json) {
  return _SupportTicket.fromJson(json);
}

/// @nodoc
mixin _$SupportTicket {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get deviceId =>
      throw _privateConstructorUsedError; // Optional device link — API-verified
  String get subject => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  TicketCategory get category => throw _privateConstructorUsedError;
  TicketStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupportTicketCopyWith<SupportTicket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportTicketCopyWith<$Res> {
  factory $SupportTicketCopyWith(
          SupportTicket value, $Res Function(SupportTicket) then) =
      _$SupportTicketCopyWithImpl<$Res, SupportTicket>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String? deviceId,
      String subject,
      String description,
      TicketCategory category,
      TicketStatus status,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$SupportTicketCopyWithImpl<$Res, $Val extends SupportTicket>
    implements $SupportTicketCopyWith<$Res> {
  _$SupportTicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? deviceId = freezed,
    Object? subject = null,
    Object? description = null,
    Object? category = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TicketCategory,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TicketStatus,
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
abstract class _$$SupportTicketImplCopyWith<$Res>
    implements $SupportTicketCopyWith<$Res> {
  factory _$$SupportTicketImplCopyWith(
          _$SupportTicketImpl value, $Res Function(_$SupportTicketImpl) then) =
      __$$SupportTicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String? deviceId,
      String subject,
      String description,
      TicketCategory category,
      TicketStatus status,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$SupportTicketImplCopyWithImpl<$Res>
    extends _$SupportTicketCopyWithImpl<$Res, _$SupportTicketImpl>
    implements _$$SupportTicketImplCopyWith<$Res> {
  __$$SupportTicketImplCopyWithImpl(
      _$SupportTicketImpl _value, $Res Function(_$SupportTicketImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? deviceId = freezed,
    Object? subject = null,
    Object? description = null,
    Object? category = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$SupportTicketImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TicketCategory,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TicketStatus,
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
class _$SupportTicketImpl implements _SupportTicket {
  const _$SupportTicketImpl(
      {required this.id,
      required this.userId,
      this.deviceId,
      required this.subject,
      required this.description,
      required this.category,
      this.status = TicketStatus.open,
      required this.createdAt,
      required this.updatedAt});

  factory _$SupportTicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupportTicketImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String? deviceId;
// Optional device link — API-verified
  @override
  final String subject;
  @override
  final String description;
  @override
  final TicketCategory category;
  @override
  @JsonKey()
  final TicketStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'SupportTicket(id: $id, userId: $userId, deviceId: $deviceId, subject: $subject, description: $description, category: $category, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportTicketImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, deviceId, subject,
      description, category, status, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SupportTicketImplCopyWith<_$SupportTicketImpl> get copyWith =>
      __$$SupportTicketImplCopyWithImpl<_$SupportTicketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupportTicketImplToJson(
      this,
    );
  }
}

abstract class _SupportTicket implements SupportTicket {
  const factory _SupportTicket(
      {required final String id,
      required final String userId,
      final String? deviceId,
      required final String subject,
      required final String description,
      required final TicketCategory category,
      final TicketStatus status,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$SupportTicketImpl;

  factory _SupportTicket.fromJson(Map<String, dynamic> json) =
      _$SupportTicketImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String? get deviceId;
  @override // Optional device link — API-verified
  String get subject;
  @override
  String get description;
  @override
  TicketCategory get category;
  @override
  TicketStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$SupportTicketImplCopyWith<_$SupportTicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateTicketRequest _$CreateTicketRequestFromJson(Map<String, dynamic> json) {
  return _CreateTicketRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateTicketRequest {
  String? get deviceId => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  TicketCategory get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateTicketRequestCopyWith<CreateTicketRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTicketRequestCopyWith<$Res> {
  factory $CreateTicketRequestCopyWith(
          CreateTicketRequest value, $Res Function(CreateTicketRequest) then) =
      _$CreateTicketRequestCopyWithImpl<$Res, CreateTicketRequest>;
  @useResult
  $Res call(
      {String? deviceId,
      String subject,
      String description,
      TicketCategory category});
}

/// @nodoc
class _$CreateTicketRequestCopyWithImpl<$Res, $Val extends CreateTicketRequest>
    implements $CreateTicketRequestCopyWith<$Res> {
  _$CreateTicketRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = freezed,
    Object? subject = null,
    Object? description = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TicketCategory,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTicketRequestImplCopyWith<$Res>
    implements $CreateTicketRequestCopyWith<$Res> {
  factory _$$CreateTicketRequestImplCopyWith(_$CreateTicketRequestImpl value,
          $Res Function(_$CreateTicketRequestImpl) then) =
      __$$CreateTicketRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? deviceId,
      String subject,
      String description,
      TicketCategory category});
}

/// @nodoc
class __$$CreateTicketRequestImplCopyWithImpl<$Res>
    extends _$CreateTicketRequestCopyWithImpl<$Res, _$CreateTicketRequestImpl>
    implements _$$CreateTicketRequestImplCopyWith<$Res> {
  __$$CreateTicketRequestImplCopyWithImpl(_$CreateTicketRequestImpl _value,
      $Res Function(_$CreateTicketRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = freezed,
    Object? subject = null,
    Object? description = null,
    Object? category = null,
  }) {
    return _then(_$CreateTicketRequestImpl(
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TicketCategory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTicketRequestImpl implements _CreateTicketRequest {
  const _$CreateTicketRequestImpl(
      {this.deviceId,
      required this.subject,
      required this.description,
      required this.category});

  factory _$CreateTicketRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTicketRequestImplFromJson(json);

  @override
  final String? deviceId;
  @override
  final String subject;
  @override
  final String description;
  @override
  final TicketCategory category;

  @override
  String toString() {
    return 'CreateTicketRequest(deviceId: $deviceId, subject: $subject, description: $description, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTicketRequestImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, deviceId, subject, description, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTicketRequestImplCopyWith<_$CreateTicketRequestImpl> get copyWith =>
      __$$CreateTicketRequestImplCopyWithImpl<_$CreateTicketRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTicketRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateTicketRequest implements CreateTicketRequest {
  const factory _CreateTicketRequest(
      {final String? deviceId,
      required final String subject,
      required final String description,
      required final TicketCategory category}) = _$CreateTicketRequestImpl;

  factory _CreateTicketRequest.fromJson(Map<String, dynamic> json) =
      _$CreateTicketRequestImpl.fromJson;

  @override
  String? get deviceId;
  @override
  String get subject;
  @override
  String get description;
  @override
  TicketCategory get category;
  @override
  @JsonKey(ignore: true)
  _$$CreateTicketRequestImplCopyWith<_$CreateTicketRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
