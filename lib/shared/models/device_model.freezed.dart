// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return _Device.fromJson(json);
}

/// @nodoc
mixin _$Device {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get claimCode => throw _privateConstructorUsedError;
  String? get macAddress =>
      throw _privateConstructorUsedError; // API-verified fields from Swagger (were missing in v3.0)
  String? get tankTypeId =>
      throw _privateConstructorUsedError; // UUID linking to predefined tank type
  bool get isLabelPrinted => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // 'ONLINE' | 'OFFLINE' | 'SUSPENDED'
  DateTime? get lastSeenAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceCopyWith<Device> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCopyWith<$Res> {
  factory $DeviceCopyWith(Device value, $Res Function(Device) then) =
      _$DeviceCopyWithImpl<$Res, Device>;
  @useResult
  $Res call(
      {String id,
      String name,
      String claimCode,
      String? macAddress,
      String? tankTypeId,
      bool isLabelPrinted,
      String ownerId,
      String status,
      DateTime? lastSeenAt,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$DeviceCopyWithImpl<$Res, $Val extends Device>
    implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? claimCode = null,
    Object? macAddress = freezed,
    Object? tankTypeId = freezed,
    Object? isLabelPrinted = null,
    Object? ownerId = null,
    Object? status = null,
    Object? lastSeenAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      claimCode: null == claimCode
          ? _value.claimCode
          : claimCode // ignore: cast_nullable_to_non_nullable
              as String,
      macAddress: freezed == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      tankTypeId: freezed == tankTypeId
          ? _value.tankTypeId
          : tankTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
      isLabelPrinted: null == isLabelPrinted
          ? _value.isLabelPrinted
          : isLabelPrinted // ignore: cast_nullable_to_non_nullable
              as bool,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      lastSeenAt: freezed == lastSeenAt
          ? _value.lastSeenAt
          : lastSeenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$DeviceImplCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$$DeviceImplCopyWith(
          _$DeviceImpl value, $Res Function(_$DeviceImpl) then) =
      __$$DeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String claimCode,
      String? macAddress,
      String? tankTypeId,
      bool isLabelPrinted,
      String ownerId,
      String status,
      DateTime? lastSeenAt,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$DeviceImplCopyWithImpl<$Res>
    extends _$DeviceCopyWithImpl<$Res, _$DeviceImpl>
    implements _$$DeviceImplCopyWith<$Res> {
  __$$DeviceImplCopyWithImpl(
      _$DeviceImpl _value, $Res Function(_$DeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? claimCode = null,
    Object? macAddress = freezed,
    Object? tankTypeId = freezed,
    Object? isLabelPrinted = null,
    Object? ownerId = null,
    Object? status = null,
    Object? lastSeenAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$DeviceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      claimCode: null == claimCode
          ? _value.claimCode
          : claimCode // ignore: cast_nullable_to_non_nullable
              as String,
      macAddress: freezed == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      tankTypeId: freezed == tankTypeId
          ? _value.tankTypeId
          : tankTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
      isLabelPrinted: null == isLabelPrinted
          ? _value.isLabelPrinted
          : isLabelPrinted // ignore: cast_nullable_to_non_nullable
              as bool,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      lastSeenAt: freezed == lastSeenAt
          ? _value.lastSeenAt
          : lastSeenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$DeviceImpl implements _Device {
  const _$DeviceImpl(
      {required this.id,
      required this.name,
      required this.claimCode,
      this.macAddress,
      this.tankTypeId,
      this.isLabelPrinted = false,
      required this.ownerId,
      required this.status,
      this.lastSeenAt,
      required this.createdAt,
      required this.updatedAt});

  factory _$DeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String claimCode;
  @override
  final String? macAddress;
// API-verified fields from Swagger (were missing in v3.0)
  @override
  final String? tankTypeId;
// UUID linking to predefined tank type
  @override
  @JsonKey()
  final bool isLabelPrinted;
  @override
  final String ownerId;
  @override
  final String status;
// 'ONLINE' | 'OFFLINE' | 'SUSPENDED'
  @override
  final DateTime? lastSeenAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Device(id: $id, name: $name, claimCode: $claimCode, macAddress: $macAddress, tankTypeId: $tankTypeId, isLabelPrinted: $isLabelPrinted, ownerId: $ownerId, status: $status, lastSeenAt: $lastSeenAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.claimCode, claimCode) ||
                other.claimCode == claimCode) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.tankTypeId, tankTypeId) ||
                other.tankTypeId == tankTypeId) &&
            (identical(other.isLabelPrinted, isLabelPrinted) ||
                other.isLabelPrinted == isLabelPrinted) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastSeenAt, lastSeenAt) ||
                other.lastSeenAt == lastSeenAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      claimCode,
      macAddress,
      tankTypeId,
      isLabelPrinted,
      ownerId,
      status,
      lastSeenAt,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceImplCopyWith<_$DeviceImpl> get copyWith =>
      __$$DeviceImplCopyWithImpl<_$DeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceImplToJson(
      this,
    );
  }
}

abstract class _Device implements Device {
  const factory _Device(
      {required final String id,
      required final String name,
      required final String claimCode,
      final String? macAddress,
      final String? tankTypeId,
      final bool isLabelPrinted,
      required final String ownerId,
      required final String status,
      final DateTime? lastSeenAt,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$DeviceImpl;

  factory _Device.fromJson(Map<String, dynamic> json) = _$DeviceImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get claimCode;
  @override
  String? get macAddress;
  @override // API-verified fields from Swagger (were missing in v3.0)
  String? get tankTypeId;
  @override // UUID linking to predefined tank type
  bool get isLabelPrinted;
  @override
  String get ownerId;
  @override
  String get status;
  @override // 'ONLINE' | 'OFFLINE' | 'SUSPENDED'
  DateTime? get lastSeenAt;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DeviceImplCopyWith<_$DeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MotorControlRequest _$MotorControlRequestFromJson(Map<String, dynamic> json) {
  return _MotorControlRequest.fromJson(json);
}

/// @nodoc
mixin _$MotorControlRequest {
  String get action => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MotorControlRequestCopyWith<MotorControlRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotorControlRequestCopyWith<$Res> {
  factory $MotorControlRequestCopyWith(
          MotorControlRequest value, $Res Function(MotorControlRequest) then) =
      _$MotorControlRequestCopyWithImpl<$Res, MotorControlRequest>;
  @useResult
  $Res call({String action});
}

/// @nodoc
class _$MotorControlRequestCopyWithImpl<$Res, $Val extends MotorControlRequest>
    implements $MotorControlRequestCopyWith<$Res> {
  _$MotorControlRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
  }) {
    return _then(_value.copyWith(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MotorControlRequestImplCopyWith<$Res>
    implements $MotorControlRequestCopyWith<$Res> {
  factory _$$MotorControlRequestImplCopyWith(_$MotorControlRequestImpl value,
          $Res Function(_$MotorControlRequestImpl) then) =
      __$$MotorControlRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String action});
}

/// @nodoc
class __$$MotorControlRequestImplCopyWithImpl<$Res>
    extends _$MotorControlRequestCopyWithImpl<$Res, _$MotorControlRequestImpl>
    implements _$$MotorControlRequestImplCopyWith<$Res> {
  __$$MotorControlRequestImplCopyWithImpl(_$MotorControlRequestImpl _value,
      $Res Function(_$MotorControlRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
  }) {
    return _then(_$MotorControlRequestImpl(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MotorControlRequestImpl implements _MotorControlRequest {
  const _$MotorControlRequestImpl({required this.action});

  factory _$MotorControlRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MotorControlRequestImplFromJson(json);

  @override
  final String action;

  @override
  String toString() {
    return 'MotorControlRequest(action: $action)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MotorControlRequestImpl &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MotorControlRequestImplCopyWith<_$MotorControlRequestImpl> get copyWith =>
      __$$MotorControlRequestImplCopyWithImpl<_$MotorControlRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MotorControlRequestImplToJson(
      this,
    );
  }
}

abstract class _MotorControlRequest implements MotorControlRequest {
  const factory _MotorControlRequest({required final String action}) =
      _$MotorControlRequestImpl;

  factory _MotorControlRequest.fromJson(Map<String, dynamic> json) =
      _$MotorControlRequestImpl.fromJson;

  @override
  String get action;
  @override
  @JsonKey(ignore: true)
  _$$MotorControlRequestImplCopyWith<_$MotorControlRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClaimDeviceRequest _$ClaimDeviceRequestFromJson(Map<String, dynamic> json) {
  return _ClaimDeviceRequest.fromJson(json);
}

/// @nodoc
mixin _$ClaimDeviceRequest {
  String get claimCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClaimDeviceRequestCopyWith<ClaimDeviceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimDeviceRequestCopyWith<$Res> {
  factory $ClaimDeviceRequestCopyWith(
          ClaimDeviceRequest value, $Res Function(ClaimDeviceRequest) then) =
      _$ClaimDeviceRequestCopyWithImpl<$Res, ClaimDeviceRequest>;
  @useResult
  $Res call({String claimCode});
}

/// @nodoc
class _$ClaimDeviceRequestCopyWithImpl<$Res, $Val extends ClaimDeviceRequest>
    implements $ClaimDeviceRequestCopyWith<$Res> {
  _$ClaimDeviceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? claimCode = null,
  }) {
    return _then(_value.copyWith(
      claimCode: null == claimCode
          ? _value.claimCode
          : claimCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClaimDeviceRequestImplCopyWith<$Res>
    implements $ClaimDeviceRequestCopyWith<$Res> {
  factory _$$ClaimDeviceRequestImplCopyWith(_$ClaimDeviceRequestImpl value,
          $Res Function(_$ClaimDeviceRequestImpl) then) =
      __$$ClaimDeviceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String claimCode});
}

/// @nodoc
class __$$ClaimDeviceRequestImplCopyWithImpl<$Res>
    extends _$ClaimDeviceRequestCopyWithImpl<$Res, _$ClaimDeviceRequestImpl>
    implements _$$ClaimDeviceRequestImplCopyWith<$Res> {
  __$$ClaimDeviceRequestImplCopyWithImpl(_$ClaimDeviceRequestImpl _value,
      $Res Function(_$ClaimDeviceRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? claimCode = null,
  }) {
    return _then(_$ClaimDeviceRequestImpl(
      claimCode: null == claimCode
          ? _value.claimCode
          : claimCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClaimDeviceRequestImpl implements _ClaimDeviceRequest {
  const _$ClaimDeviceRequestImpl({required this.claimCode});

  factory _$ClaimDeviceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClaimDeviceRequestImplFromJson(json);

  @override
  final String claimCode;

  @override
  String toString() {
    return 'ClaimDeviceRequest(claimCode: $claimCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimDeviceRequestImpl &&
            (identical(other.claimCode, claimCode) ||
                other.claimCode == claimCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, claimCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimDeviceRequestImplCopyWith<_$ClaimDeviceRequestImpl> get copyWith =>
      __$$ClaimDeviceRequestImplCopyWithImpl<_$ClaimDeviceRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClaimDeviceRequestImplToJson(
      this,
    );
  }
}

abstract class _ClaimDeviceRequest implements ClaimDeviceRequest {
  const factory _ClaimDeviceRequest({required final String claimCode}) =
      _$ClaimDeviceRequestImpl;

  factory _ClaimDeviceRequest.fromJson(Map<String, dynamic> json) =
      _$ClaimDeviceRequestImpl.fromJson;

  @override
  String get claimCode;
  @override
  @JsonKey(ignore: true)
  _$$ClaimDeviceRequestImplCopyWith<_$ClaimDeviceRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
