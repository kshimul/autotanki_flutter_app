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
  String? get nickname => throw _privateConstructorUsedError;
  String? get claimCode => throw _privateConstructorUsedError;
  String? get macAddress => throw _privateConstructorUsedError;
  String? get tankTypeId => throw _privateConstructorUsedError;
  bool get isLabelPrinted => throw _privateConstructorUsedError;
  String? get ownerId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get lastSeenAt => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  bool? get suspended => throw _privateConstructorUsedError;
  bool? get isOnline => throw _privateConstructorUsedError;
  int? get wifiSignal => throw _privateConstructorUsedError;
  double? get ohtWaterLevel => throw _privateConstructorUsedError;
  double? get ugtWaterLevel => throw _privateConstructorUsedError;
  bool? get ohtEnabled => throw _privateConstructorUsedError;
  String? get ohtMode => throw _privateConstructorUsedError;
  String? get ohtState => throw _privateConstructorUsedError;
  bool? get ugtEnabled => throw _privateConstructorUsedError;
  Map<String, dynamic>? get oht => throw _privateConstructorUsedError;
  Map<String, dynamic>? get ugt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get subscription => throw _privateConstructorUsedError;

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
      String? nickname,
      String? claimCode,
      String? macAddress,
      String? tankTypeId,
      bool isLabelPrinted,
      String? ownerId,
      String? status,
      String? lastSeenAt,
      String? createdAt,
      String? updatedAt,
      bool? suspended,
      bool? isOnline,
      int? wifiSignal,
      double? ohtWaterLevel,
      double? ugtWaterLevel,
      bool? ohtEnabled,
      String? ohtMode,
      String? ohtState,
      bool? ugtEnabled,
      Map<String, dynamic>? oht,
      Map<String, dynamic>? ugt,
      Map<String, dynamic>? subscription});
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
    Object? nickname = freezed,
    Object? claimCode = freezed,
    Object? macAddress = freezed,
    Object? tankTypeId = freezed,
    Object? isLabelPrinted = null,
    Object? ownerId = freezed,
    Object? status = freezed,
    Object? lastSeenAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? suspended = freezed,
    Object? isOnline = freezed,
    Object? wifiSignal = freezed,
    Object? ohtWaterLevel = freezed,
    Object? ugtWaterLevel = freezed,
    Object? ohtEnabled = freezed,
    Object? ohtMode = freezed,
    Object? ohtState = freezed,
    Object? ugtEnabled = freezed,
    Object? oht = freezed,
    Object? ugt = freezed,
    Object? subscription = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      claimCode: freezed == claimCode
          ? _value.claimCode
          : claimCode // ignore: cast_nullable_to_non_nullable
              as String?,
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
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSeenAt: freezed == lastSeenAt
          ? _value.lastSeenAt
          : lastSeenAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      suspended: freezed == suspended
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      wifiSignal: freezed == wifiSignal
          ? _value.wifiSignal
          : wifiSignal // ignore: cast_nullable_to_non_nullable
              as int?,
      ohtWaterLevel: freezed == ohtWaterLevel
          ? _value.ohtWaterLevel
          : ohtWaterLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      ugtWaterLevel: freezed == ugtWaterLevel
          ? _value.ugtWaterLevel
          : ugtWaterLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      ohtEnabled: freezed == ohtEnabled
          ? _value.ohtEnabled
          : ohtEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ohtMode: freezed == ohtMode
          ? _value.ohtMode
          : ohtMode // ignore: cast_nullable_to_non_nullable
              as String?,
      ohtState: freezed == ohtState
          ? _value.ohtState
          : ohtState // ignore: cast_nullable_to_non_nullable
              as String?,
      ugtEnabled: freezed == ugtEnabled
          ? _value.ugtEnabled
          : ugtEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      oht: freezed == oht
          ? _value.oht
          : oht // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      ugt: freezed == ugt
          ? _value.ugt
          : ugt // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
      String? nickname,
      String? claimCode,
      String? macAddress,
      String? tankTypeId,
      bool isLabelPrinted,
      String? ownerId,
      String? status,
      String? lastSeenAt,
      String? createdAt,
      String? updatedAt,
      bool? suspended,
      bool? isOnline,
      int? wifiSignal,
      double? ohtWaterLevel,
      double? ugtWaterLevel,
      bool? ohtEnabled,
      String? ohtMode,
      String? ohtState,
      bool? ugtEnabled,
      Map<String, dynamic>? oht,
      Map<String, dynamic>? ugt,
      Map<String, dynamic>? subscription});
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
    Object? nickname = freezed,
    Object? claimCode = freezed,
    Object? macAddress = freezed,
    Object? tankTypeId = freezed,
    Object? isLabelPrinted = null,
    Object? ownerId = freezed,
    Object? status = freezed,
    Object? lastSeenAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? suspended = freezed,
    Object? isOnline = freezed,
    Object? wifiSignal = freezed,
    Object? ohtWaterLevel = freezed,
    Object? ugtWaterLevel = freezed,
    Object? ohtEnabled = freezed,
    Object? ohtMode = freezed,
    Object? ohtState = freezed,
    Object? ugtEnabled = freezed,
    Object? oht = freezed,
    Object? ugt = freezed,
    Object? subscription = freezed,
  }) {
    return _then(_$DeviceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      claimCode: freezed == claimCode
          ? _value.claimCode
          : claimCode // ignore: cast_nullable_to_non_nullable
              as String?,
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
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSeenAt: freezed == lastSeenAt
          ? _value.lastSeenAt
          : lastSeenAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      suspended: freezed == suspended
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      wifiSignal: freezed == wifiSignal
          ? _value.wifiSignal
          : wifiSignal // ignore: cast_nullable_to_non_nullable
              as int?,
      ohtWaterLevel: freezed == ohtWaterLevel
          ? _value.ohtWaterLevel
          : ohtWaterLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      ugtWaterLevel: freezed == ugtWaterLevel
          ? _value.ugtWaterLevel
          : ugtWaterLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      ohtEnabled: freezed == ohtEnabled
          ? _value.ohtEnabled
          : ohtEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ohtMode: freezed == ohtMode
          ? _value.ohtMode
          : ohtMode // ignore: cast_nullable_to_non_nullable
              as String?,
      ohtState: freezed == ohtState
          ? _value.ohtState
          : ohtState // ignore: cast_nullable_to_non_nullable
              as String?,
      ugtEnabled: freezed == ugtEnabled
          ? _value.ugtEnabled
          : ugtEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      oht: freezed == oht
          ? _value._oht
          : oht // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      ugt: freezed == ugt
          ? _value._ugt
          : ugt // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      subscription: freezed == subscription
          ? _value._subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceImpl extends _Device {
  const _$DeviceImpl(
      {required this.id,
      this.nickname,
      this.claimCode,
      this.macAddress,
      this.tankTypeId,
      this.isLabelPrinted = false,
      this.ownerId,
      this.status,
      this.lastSeenAt,
      this.createdAt,
      this.updatedAt,
      this.suspended,
      this.isOnline,
      this.wifiSignal,
      this.ohtWaterLevel,
      this.ugtWaterLevel,
      this.ohtEnabled,
      this.ohtMode,
      this.ohtState,
      this.ugtEnabled,
      final Map<String, dynamic>? oht,
      final Map<String, dynamic>? ugt,
      final Map<String, dynamic>? subscription})
      : _oht = oht,
        _ugt = ugt,
        _subscription = subscription,
        super._();

  factory _$DeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceImplFromJson(json);

  @override
  final String id;
  @override
  final String? nickname;
  @override
  final String? claimCode;
  @override
  final String? macAddress;
  @override
  final String? tankTypeId;
  @override
  @JsonKey()
  final bool isLabelPrinted;
  @override
  final String? ownerId;
  @override
  final String? status;
  @override
  final String? lastSeenAt;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final bool? suspended;
  @override
  final bool? isOnline;
  @override
  final int? wifiSignal;
  @override
  final double? ohtWaterLevel;
  @override
  final double? ugtWaterLevel;
  @override
  final bool? ohtEnabled;
  @override
  final String? ohtMode;
  @override
  final String? ohtState;
  @override
  final bool? ugtEnabled;
  final Map<String, dynamic>? _oht;
  @override
  Map<String, dynamic>? get oht {
    final value = _oht;
    if (value == null) return null;
    if (_oht is EqualUnmodifiableMapView) return _oht;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _ugt;
  @override
  Map<String, dynamic>? get ugt {
    final value = _ugt;
    if (value == null) return null;
    if (_ugt is EqualUnmodifiableMapView) return _ugt;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _subscription;
  @override
  Map<String, dynamic>? get subscription {
    final value = _subscription;
    if (value == null) return null;
    if (_subscription is EqualUnmodifiableMapView) return _subscription;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Device(id: $id, nickname: $nickname, claimCode: $claimCode, macAddress: $macAddress, tankTypeId: $tankTypeId, isLabelPrinted: $isLabelPrinted, ownerId: $ownerId, status: $status, lastSeenAt: $lastSeenAt, createdAt: $createdAt, updatedAt: $updatedAt, suspended: $suspended, isOnline: $isOnline, wifiSignal: $wifiSignal, ohtWaterLevel: $ohtWaterLevel, ugtWaterLevel: $ugtWaterLevel, ohtEnabled: $ohtEnabled, ohtMode: $ohtMode, ohtState: $ohtState, ugtEnabled: $ugtEnabled, oht: $oht, ugt: $ugt, subscription: $subscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
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
                other.updatedAt == updatedAt) &&
            (identical(other.suspended, suspended) ||
                other.suspended == suspended) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.wifiSignal, wifiSignal) ||
                other.wifiSignal == wifiSignal) &&
            (identical(other.ohtWaterLevel, ohtWaterLevel) ||
                other.ohtWaterLevel == ohtWaterLevel) &&
            (identical(other.ugtWaterLevel, ugtWaterLevel) ||
                other.ugtWaterLevel == ugtWaterLevel) &&
            (identical(other.ohtEnabled, ohtEnabled) ||
                other.ohtEnabled == ohtEnabled) &&
            (identical(other.ohtMode, ohtMode) || other.ohtMode == ohtMode) &&
            (identical(other.ohtState, ohtState) ||
                other.ohtState == ohtState) &&
            (identical(other.ugtEnabled, ugtEnabled) ||
                other.ugtEnabled == ugtEnabled) &&
            const DeepCollectionEquality().equals(other._oht, _oht) &&
            const DeepCollectionEquality().equals(other._ugt, _ugt) &&
            const DeepCollectionEquality()
                .equals(other._subscription, _subscription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        nickname,
        claimCode,
        macAddress,
        tankTypeId,
        isLabelPrinted,
        ownerId,
        status,
        lastSeenAt,
        createdAt,
        updatedAt,
        suspended,
        isOnline,
        wifiSignal,
        ohtWaterLevel,
        ugtWaterLevel,
        ohtEnabled,
        ohtMode,
        ohtState,
        ugtEnabled,
        const DeepCollectionEquality().hash(_oht),
        const DeepCollectionEquality().hash(_ugt),
        const DeepCollectionEquality().hash(_subscription)
      ]);

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

abstract class _Device extends Device {
  const factory _Device(
      {required final String id,
      final String? nickname,
      final String? claimCode,
      final String? macAddress,
      final String? tankTypeId,
      final bool isLabelPrinted,
      final String? ownerId,
      final String? status,
      final String? lastSeenAt,
      final String? createdAt,
      final String? updatedAt,
      final bool? suspended,
      final bool? isOnline,
      final int? wifiSignal,
      final double? ohtWaterLevel,
      final double? ugtWaterLevel,
      final bool? ohtEnabled,
      final String? ohtMode,
      final String? ohtState,
      final bool? ugtEnabled,
      final Map<String, dynamic>? oht,
      final Map<String, dynamic>? ugt,
      final Map<String, dynamic>? subscription}) = _$DeviceImpl;
  const _Device._() : super._();

  factory _Device.fromJson(Map<String, dynamic> json) = _$DeviceImpl.fromJson;

  @override
  String get id;
  @override
  String? get nickname;
  @override
  String? get claimCode;
  @override
  String? get macAddress;
  @override
  String? get tankTypeId;
  @override
  bool get isLabelPrinted;
  @override
  String? get ownerId;
  @override
  String? get status;
  @override
  String? get lastSeenAt;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  bool? get suspended;
  @override
  bool? get isOnline;
  @override
  int? get wifiSignal;
  @override
  double? get ohtWaterLevel;
  @override
  double? get ugtWaterLevel;
  @override
  bool? get ohtEnabled;
  @override
  String? get ohtMode;
  @override
  String? get ohtState;
  @override
  bool? get ugtEnabled;
  @override
  Map<String, dynamic>? get oht;
  @override
  Map<String, dynamic>? get ugt;
  @override
  Map<String, dynamic>? get subscription;
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
  String get macAddress => throw _privateConstructorUsedError;
  String get signature => throw _privateConstructorUsedError;

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
  $Res call({String claimCode, String macAddress, String signature});
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
    Object? macAddress = null,
    Object? signature = null,
  }) {
    return _then(_value.copyWith(
      claimCode: null == claimCode
          ? _value.claimCode
          : claimCode // ignore: cast_nullable_to_non_nullable
              as String,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      signature: null == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
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
  $Res call({String claimCode, String macAddress, String signature});
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
    Object? macAddress = null,
    Object? signature = null,
  }) {
    return _then(_$ClaimDeviceRequestImpl(
      claimCode: null == claimCode
          ? _value.claimCode
          : claimCode // ignore: cast_nullable_to_non_nullable
              as String,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      signature: null == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClaimDeviceRequestImpl implements _ClaimDeviceRequest {
  const _$ClaimDeviceRequestImpl(
      {required this.claimCode,
      required this.macAddress,
      required this.signature});

  factory _$ClaimDeviceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClaimDeviceRequestImplFromJson(json);

  @override
  final String claimCode;
  @override
  final String macAddress;
  @override
  final String signature;

  @override
  String toString() {
    return 'ClaimDeviceRequest(claimCode: $claimCode, macAddress: $macAddress, signature: $signature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimDeviceRequestImpl &&
            (identical(other.claimCode, claimCode) ||
                other.claimCode == claimCode) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.signature, signature) ||
                other.signature == signature));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, claimCode, macAddress, signature);

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
  const factory _ClaimDeviceRequest(
      {required final String claimCode,
      required final String macAddress,
      required final String signature}) = _$ClaimDeviceRequestImpl;

  factory _ClaimDeviceRequest.fromJson(Map<String, dynamic> json) =
      _$ClaimDeviceRequestImpl.fromJson;

  @override
  String get claimCode;
  @override
  String get macAddress;
  @override
  String get signature;
  @override
  @JsonKey(ignore: true)
  _$$ClaimDeviceRequestImplCopyWith<_$ClaimDeviceRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
