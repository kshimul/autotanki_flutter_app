// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TankConfig _$TankConfigFromJson(Map<String, dynamic> json) {
  return _TankConfig.fromJson(json);
}

/// @nodoc
mixin _$TankConfig {
  String get deviceId => throw _privateConstructorUsedError;
  String? get predefSizeId =>
      throw _privateConstructorUsedError; // Predefined tank size option — API-verified
  double? get ohtCapacityLiters => throw _privateConstructorUsedError;
  double? get ugtCapacityLiters => throw _privateConstructorUsedError;
  double? get ohtLowThreshold =>
      throw _privateConstructorUsedError; // % — triggers low level alert
  double? get ugtLowThreshold => throw _privateConstructorUsedError;
  double? get ohtHighThreshold =>
      throw _privateConstructorUsedError; // % — triggers stop pumping
  double? get ugtHighThreshold => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TankConfigCopyWith<TankConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TankConfigCopyWith<$Res> {
  factory $TankConfigCopyWith(
          TankConfig value, $Res Function(TankConfig) then) =
      _$TankConfigCopyWithImpl<$Res, TankConfig>;
  @useResult
  $Res call(
      {String deviceId,
      String? predefSizeId,
      double? ohtCapacityLiters,
      double? ugtCapacityLiters,
      double? ohtLowThreshold,
      double? ugtLowThreshold,
      double? ohtHighThreshold,
      double? ugtHighThreshold});
}

/// @nodoc
class _$TankConfigCopyWithImpl<$Res, $Val extends TankConfig>
    implements $TankConfigCopyWith<$Res> {
  _$TankConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? predefSizeId = freezed,
    Object? ohtCapacityLiters = freezed,
    Object? ugtCapacityLiters = freezed,
    Object? ohtLowThreshold = freezed,
    Object? ugtLowThreshold = freezed,
    Object? ohtHighThreshold = freezed,
    Object? ugtHighThreshold = freezed,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      predefSizeId: freezed == predefSizeId
          ? _value.predefSizeId
          : predefSizeId // ignore: cast_nullable_to_non_nullable
              as String?,
      ohtCapacityLiters: freezed == ohtCapacityLiters
          ? _value.ohtCapacityLiters
          : ohtCapacityLiters // ignore: cast_nullable_to_non_nullable
              as double?,
      ugtCapacityLiters: freezed == ugtCapacityLiters
          ? _value.ugtCapacityLiters
          : ugtCapacityLiters // ignore: cast_nullable_to_non_nullable
              as double?,
      ohtLowThreshold: freezed == ohtLowThreshold
          ? _value.ohtLowThreshold
          : ohtLowThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      ugtLowThreshold: freezed == ugtLowThreshold
          ? _value.ugtLowThreshold
          : ugtLowThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      ohtHighThreshold: freezed == ohtHighThreshold
          ? _value.ohtHighThreshold
          : ohtHighThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      ugtHighThreshold: freezed == ugtHighThreshold
          ? _value.ugtHighThreshold
          : ugtHighThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TankConfigImplCopyWith<$Res>
    implements $TankConfigCopyWith<$Res> {
  factory _$$TankConfigImplCopyWith(
          _$TankConfigImpl value, $Res Function(_$TankConfigImpl) then) =
      __$$TankConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deviceId,
      String? predefSizeId,
      double? ohtCapacityLiters,
      double? ugtCapacityLiters,
      double? ohtLowThreshold,
      double? ugtLowThreshold,
      double? ohtHighThreshold,
      double? ugtHighThreshold});
}

/// @nodoc
class __$$TankConfigImplCopyWithImpl<$Res>
    extends _$TankConfigCopyWithImpl<$Res, _$TankConfigImpl>
    implements _$$TankConfigImplCopyWith<$Res> {
  __$$TankConfigImplCopyWithImpl(
      _$TankConfigImpl _value, $Res Function(_$TankConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? predefSizeId = freezed,
    Object? ohtCapacityLiters = freezed,
    Object? ugtCapacityLiters = freezed,
    Object? ohtLowThreshold = freezed,
    Object? ugtLowThreshold = freezed,
    Object? ohtHighThreshold = freezed,
    Object? ugtHighThreshold = freezed,
  }) {
    return _then(_$TankConfigImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      predefSizeId: freezed == predefSizeId
          ? _value.predefSizeId
          : predefSizeId // ignore: cast_nullable_to_non_nullable
              as String?,
      ohtCapacityLiters: freezed == ohtCapacityLiters
          ? _value.ohtCapacityLiters
          : ohtCapacityLiters // ignore: cast_nullable_to_non_nullable
              as double?,
      ugtCapacityLiters: freezed == ugtCapacityLiters
          ? _value.ugtCapacityLiters
          : ugtCapacityLiters // ignore: cast_nullable_to_non_nullable
              as double?,
      ohtLowThreshold: freezed == ohtLowThreshold
          ? _value.ohtLowThreshold
          : ohtLowThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      ugtLowThreshold: freezed == ugtLowThreshold
          ? _value.ugtLowThreshold
          : ugtLowThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      ohtHighThreshold: freezed == ohtHighThreshold
          ? _value.ohtHighThreshold
          : ohtHighThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      ugtHighThreshold: freezed == ugtHighThreshold
          ? _value.ugtHighThreshold
          : ugtHighThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TankConfigImpl implements _TankConfig {
  const _$TankConfigImpl(
      {required this.deviceId,
      this.predefSizeId,
      this.ohtCapacityLiters,
      this.ugtCapacityLiters,
      this.ohtLowThreshold,
      this.ugtLowThreshold,
      this.ohtHighThreshold,
      this.ugtHighThreshold});

  factory _$TankConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$TankConfigImplFromJson(json);

  @override
  final String deviceId;
  @override
  final String? predefSizeId;
// Predefined tank size option — API-verified
  @override
  final double? ohtCapacityLiters;
  @override
  final double? ugtCapacityLiters;
  @override
  final double? ohtLowThreshold;
// % — triggers low level alert
  @override
  final double? ugtLowThreshold;
  @override
  final double? ohtHighThreshold;
// % — triggers stop pumping
  @override
  final double? ugtHighThreshold;

  @override
  String toString() {
    return 'TankConfig(deviceId: $deviceId, predefSizeId: $predefSizeId, ohtCapacityLiters: $ohtCapacityLiters, ugtCapacityLiters: $ugtCapacityLiters, ohtLowThreshold: $ohtLowThreshold, ugtLowThreshold: $ugtLowThreshold, ohtHighThreshold: $ohtHighThreshold, ugtHighThreshold: $ugtHighThreshold)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TankConfigImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.predefSizeId, predefSizeId) ||
                other.predefSizeId == predefSizeId) &&
            (identical(other.ohtCapacityLiters, ohtCapacityLiters) ||
                other.ohtCapacityLiters == ohtCapacityLiters) &&
            (identical(other.ugtCapacityLiters, ugtCapacityLiters) ||
                other.ugtCapacityLiters == ugtCapacityLiters) &&
            (identical(other.ohtLowThreshold, ohtLowThreshold) ||
                other.ohtLowThreshold == ohtLowThreshold) &&
            (identical(other.ugtLowThreshold, ugtLowThreshold) ||
                other.ugtLowThreshold == ugtLowThreshold) &&
            (identical(other.ohtHighThreshold, ohtHighThreshold) ||
                other.ohtHighThreshold == ohtHighThreshold) &&
            (identical(other.ugtHighThreshold, ugtHighThreshold) ||
                other.ugtHighThreshold == ugtHighThreshold));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deviceId,
      predefSizeId,
      ohtCapacityLiters,
      ugtCapacityLiters,
      ohtLowThreshold,
      ugtLowThreshold,
      ohtHighThreshold,
      ugtHighThreshold);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TankConfigImplCopyWith<_$TankConfigImpl> get copyWith =>
      __$$TankConfigImplCopyWithImpl<_$TankConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TankConfigImplToJson(
      this,
    );
  }
}

abstract class _TankConfig implements TankConfig {
  const factory _TankConfig(
      {required final String deviceId,
      final String? predefSizeId,
      final double? ohtCapacityLiters,
      final double? ugtCapacityLiters,
      final double? ohtLowThreshold,
      final double? ugtLowThreshold,
      final double? ohtHighThreshold,
      final double? ugtHighThreshold}) = _$TankConfigImpl;

  factory _TankConfig.fromJson(Map<String, dynamic> json) =
      _$TankConfigImpl.fromJson;

  @override
  String get deviceId;
  @override
  String? get predefSizeId;
  @override // Predefined tank size option — API-verified
  double? get ohtCapacityLiters;
  @override
  double? get ugtCapacityLiters;
  @override
  double? get ohtLowThreshold;
  @override // % — triggers low level alert
  double? get ugtLowThreshold;
  @override
  double? get ohtHighThreshold;
  @override // % — triggers stop pumping
  double? get ugtHighThreshold;
  @override
  @JsonKey(ignore: true)
  _$$TankConfigImplCopyWith<_$TankConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeviceShare _$DeviceShareFromJson(Map<String, dynamic> json) {
  return _DeviceShare.fromJson(json);
}

/// @nodoc
mixin _$DeviceShare {
  String get id => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  String get sharedWithUserId => throw _privateConstructorUsedError;
  String get sharedWithEmail => throw _privateConstructorUsedError;
  String get permissionLevel =>
      throw _privateConstructorUsedError; // 'VIEW' | 'CONTROL' | 'ADMIN'
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceShareCopyWith<DeviceShare> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceShareCopyWith<$Res> {
  factory $DeviceShareCopyWith(
          DeviceShare value, $Res Function(DeviceShare) then) =
      _$DeviceShareCopyWithImpl<$Res, DeviceShare>;
  @useResult
  $Res call(
      {String id,
      String deviceId,
      String sharedWithUserId,
      String sharedWithEmail,
      String permissionLevel,
      DateTime createdAt});
}

/// @nodoc
class _$DeviceShareCopyWithImpl<$Res, $Val extends DeviceShare>
    implements $DeviceShareCopyWith<$Res> {
  _$DeviceShareCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceId = null,
    Object? sharedWithUserId = null,
    Object? sharedWithEmail = null,
    Object? permissionLevel = null,
    Object? createdAt = null,
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
      sharedWithUserId: null == sharedWithUserId
          ? _value.sharedWithUserId
          : sharedWithUserId // ignore: cast_nullable_to_non_nullable
              as String,
      sharedWithEmail: null == sharedWithEmail
          ? _value.sharedWithEmail
          : sharedWithEmail // ignore: cast_nullable_to_non_nullable
              as String,
      permissionLevel: null == permissionLevel
          ? _value.permissionLevel
          : permissionLevel // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceShareImplCopyWith<$Res>
    implements $DeviceShareCopyWith<$Res> {
  factory _$$DeviceShareImplCopyWith(
          _$DeviceShareImpl value, $Res Function(_$DeviceShareImpl) then) =
      __$$DeviceShareImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String deviceId,
      String sharedWithUserId,
      String sharedWithEmail,
      String permissionLevel,
      DateTime createdAt});
}

/// @nodoc
class __$$DeviceShareImplCopyWithImpl<$Res>
    extends _$DeviceShareCopyWithImpl<$Res, _$DeviceShareImpl>
    implements _$$DeviceShareImplCopyWith<$Res> {
  __$$DeviceShareImplCopyWithImpl(
      _$DeviceShareImpl _value, $Res Function(_$DeviceShareImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceId = null,
    Object? sharedWithUserId = null,
    Object? sharedWithEmail = null,
    Object? permissionLevel = null,
    Object? createdAt = null,
  }) {
    return _then(_$DeviceShareImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      sharedWithUserId: null == sharedWithUserId
          ? _value.sharedWithUserId
          : sharedWithUserId // ignore: cast_nullable_to_non_nullable
              as String,
      sharedWithEmail: null == sharedWithEmail
          ? _value.sharedWithEmail
          : sharedWithEmail // ignore: cast_nullable_to_non_nullable
              as String,
      permissionLevel: null == permissionLevel
          ? _value.permissionLevel
          : permissionLevel // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceShareImpl implements _DeviceShare {
  const _$DeviceShareImpl(
      {required this.id,
      required this.deviceId,
      required this.sharedWithUserId,
      required this.sharedWithEmail,
      required this.permissionLevel,
      required this.createdAt});

  factory _$DeviceShareImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceShareImplFromJson(json);

  @override
  final String id;
  @override
  final String deviceId;
  @override
  final String sharedWithUserId;
  @override
  final String sharedWithEmail;
  @override
  final String permissionLevel;
// 'VIEW' | 'CONTROL' | 'ADMIN'
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'DeviceShare(id: $id, deviceId: $deviceId, sharedWithUserId: $sharedWithUserId, sharedWithEmail: $sharedWithEmail, permissionLevel: $permissionLevel, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceShareImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.sharedWithUserId, sharedWithUserId) ||
                other.sharedWithUserId == sharedWithUserId) &&
            (identical(other.sharedWithEmail, sharedWithEmail) ||
                other.sharedWithEmail == sharedWithEmail) &&
            (identical(other.permissionLevel, permissionLevel) ||
                other.permissionLevel == permissionLevel) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, deviceId, sharedWithUserId,
      sharedWithEmail, permissionLevel, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceShareImplCopyWith<_$DeviceShareImpl> get copyWith =>
      __$$DeviceShareImplCopyWithImpl<_$DeviceShareImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceShareImplToJson(
      this,
    );
  }
}

abstract class _DeviceShare implements DeviceShare {
  const factory _DeviceShare(
      {required final String id,
      required final String deviceId,
      required final String sharedWithUserId,
      required final String sharedWithEmail,
      required final String permissionLevel,
      required final DateTime createdAt}) = _$DeviceShareImpl;

  factory _DeviceShare.fromJson(Map<String, dynamic> json) =
      _$DeviceShareImpl.fromJson;

  @override
  String get id;
  @override
  String get deviceId;
  @override
  String get sharedWithUserId;
  @override
  String get sharedWithEmail;
  @override
  String get permissionLevel;
  @override // 'VIEW' | 'CONTROL' | 'ADMIN'
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$DeviceShareImplCopyWith<_$DeviceShareImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateShareRequest _$CreateShareRequestFromJson(Map<String, dynamic> json) {
  return _CreateShareRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateShareRequest {
  String get email => throw _privateConstructorUsedError;
  String get permissionLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateShareRequestCopyWith<CreateShareRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateShareRequestCopyWith<$Res> {
  factory $CreateShareRequestCopyWith(
          CreateShareRequest value, $Res Function(CreateShareRequest) then) =
      _$CreateShareRequestCopyWithImpl<$Res, CreateShareRequest>;
  @useResult
  $Res call({String email, String permissionLevel});
}

/// @nodoc
class _$CreateShareRequestCopyWithImpl<$Res, $Val extends CreateShareRequest>
    implements $CreateShareRequestCopyWith<$Res> {
  _$CreateShareRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? permissionLevel = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      permissionLevel: null == permissionLevel
          ? _value.permissionLevel
          : permissionLevel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateShareRequestImplCopyWith<$Res>
    implements $CreateShareRequestCopyWith<$Res> {
  factory _$$CreateShareRequestImplCopyWith(_$CreateShareRequestImpl value,
          $Res Function(_$CreateShareRequestImpl) then) =
      __$$CreateShareRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String permissionLevel});
}

/// @nodoc
class __$$CreateShareRequestImplCopyWithImpl<$Res>
    extends _$CreateShareRequestCopyWithImpl<$Res, _$CreateShareRequestImpl>
    implements _$$CreateShareRequestImplCopyWith<$Res> {
  __$$CreateShareRequestImplCopyWithImpl(_$CreateShareRequestImpl _value,
      $Res Function(_$CreateShareRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? permissionLevel = null,
  }) {
    return _then(_$CreateShareRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      permissionLevel: null == permissionLevel
          ? _value.permissionLevel
          : permissionLevel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateShareRequestImpl implements _CreateShareRequest {
  const _$CreateShareRequestImpl(
      {required this.email, required this.permissionLevel});

  factory _$CreateShareRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateShareRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String permissionLevel;

  @override
  String toString() {
    return 'CreateShareRequest(email: $email, permissionLevel: $permissionLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateShareRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.permissionLevel, permissionLevel) ||
                other.permissionLevel == permissionLevel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, permissionLevel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateShareRequestImplCopyWith<_$CreateShareRequestImpl> get copyWith =>
      __$$CreateShareRequestImplCopyWithImpl<_$CreateShareRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateShareRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateShareRequest implements CreateShareRequest {
  const factory _CreateShareRequest(
      {required final String email,
      required final String permissionLevel}) = _$CreateShareRequestImpl;

  factory _CreateShareRequest.fromJson(Map<String, dynamic> json) =
      _$CreateShareRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get permissionLevel;
  @override
  @JsonKey(ignore: true)
  _$$CreateShareRequestImplCopyWith<_$CreateShareRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
