// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provisioning_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProvisioningState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String claimCode) qrScanned,
    required TResult Function() bleScanning,
    required TResult Function(String deviceId, String deviceName) bleFound,
    required TResult Function(String deviceId) bleConnected,
    required TResult Function(String bleDeviceId, String claimCode)
        awaitingWifi,
    required TResult Function() sendingWifi,
    required TResult Function(String claimCode) claimingDevice,
    required TResult Function(String deviceId, String deviceName) complete,
    required TResult Function(String message, ProvisioningStep failedStep)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String claimCode)? qrScanned,
    TResult? Function()? bleScanning,
    TResult? Function(String deviceId, String deviceName)? bleFound,
    TResult? Function(String deviceId)? bleConnected,
    TResult? Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult? Function()? sendingWifi,
    TResult? Function(String claimCode)? claimingDevice,
    TResult? Function(String deviceId, String deviceName)? complete,
    TResult? Function(String message, ProvisioningStep failedStep)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String claimCode)? qrScanned,
    TResult Function()? bleScanning,
    TResult Function(String deviceId, String deviceName)? bleFound,
    TResult Function(String deviceId)? bleConnected,
    TResult Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult Function()? sendingWifi,
    TResult Function(String claimCode)? claimingDevice,
    TResult Function(String deviceId, String deviceName)? complete,
    TResult Function(String message, ProvisioningStep failedStep)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_QrScanned value) qrScanned,
    required TResult Function(_BleScanning value) bleScanning,
    required TResult Function(_BleFound value) bleFound,
    required TResult Function(_BleConnected value) bleConnected,
    required TResult Function(_AwaitingWifi value) awaitingWifi,
    required TResult Function(_SendingWifi value) sendingWifi,
    required TResult Function(_ClaimingDevice value) claimingDevice,
    required TResult Function(_Complete value) complete,
    required TResult Function(_ProvisioningError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_QrScanned value)? qrScanned,
    TResult? Function(_BleScanning value)? bleScanning,
    TResult? Function(_BleFound value)? bleFound,
    TResult? Function(_BleConnected value)? bleConnected,
    TResult? Function(_AwaitingWifi value)? awaitingWifi,
    TResult? Function(_SendingWifi value)? sendingWifi,
    TResult? Function(_ClaimingDevice value)? claimingDevice,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_ProvisioningError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_QrScanned value)? qrScanned,
    TResult Function(_BleScanning value)? bleScanning,
    TResult Function(_BleFound value)? bleFound,
    TResult Function(_BleConnected value)? bleConnected,
    TResult Function(_AwaitingWifi value)? awaitingWifi,
    TResult Function(_SendingWifi value)? sendingWifi,
    TResult Function(_ClaimingDevice value)? claimingDevice,
    TResult Function(_Complete value)? complete,
    TResult Function(_ProvisioningError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProvisioningStateCopyWith<$Res> {
  factory $ProvisioningStateCopyWith(
          ProvisioningState value, $Res Function(ProvisioningState) then) =
      _$ProvisioningStateCopyWithImpl<$Res, ProvisioningState>;
}

/// @nodoc
class _$ProvisioningStateCopyWithImpl<$Res, $Val extends ProvisioningState>
    implements $ProvisioningStateCopyWith<$Res> {
  _$ProvisioningStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl value, $Res Function(_$IdleImpl) then) =
      __$$IdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$ProvisioningStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdleImpl implements _Idle {
  const _$IdleImpl();

  @override
  String toString() {
    return 'ProvisioningState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String claimCode) qrScanned,
    required TResult Function() bleScanning,
    required TResult Function(String deviceId, String deviceName) bleFound,
    required TResult Function(String deviceId) bleConnected,
    required TResult Function(String bleDeviceId, String claimCode)
        awaitingWifi,
    required TResult Function() sendingWifi,
    required TResult Function(String claimCode) claimingDevice,
    required TResult Function(String deviceId, String deviceName) complete,
    required TResult Function(String message, ProvisioningStep failedStep)
        error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String claimCode)? qrScanned,
    TResult? Function()? bleScanning,
    TResult? Function(String deviceId, String deviceName)? bleFound,
    TResult? Function(String deviceId)? bleConnected,
    TResult? Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult? Function()? sendingWifi,
    TResult? Function(String claimCode)? claimingDevice,
    TResult? Function(String deviceId, String deviceName)? complete,
    TResult? Function(String message, ProvisioningStep failedStep)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String claimCode)? qrScanned,
    TResult Function()? bleScanning,
    TResult Function(String deviceId, String deviceName)? bleFound,
    TResult Function(String deviceId)? bleConnected,
    TResult Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult Function()? sendingWifi,
    TResult Function(String claimCode)? claimingDevice,
    TResult Function(String deviceId, String deviceName)? complete,
    TResult Function(String message, ProvisioningStep failedStep)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_QrScanned value) qrScanned,
    required TResult Function(_BleScanning value) bleScanning,
    required TResult Function(_BleFound value) bleFound,
    required TResult Function(_BleConnected value) bleConnected,
    required TResult Function(_AwaitingWifi value) awaitingWifi,
    required TResult Function(_SendingWifi value) sendingWifi,
    required TResult Function(_ClaimingDevice value) claimingDevice,
    required TResult Function(_Complete value) complete,
    required TResult Function(_ProvisioningError value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_QrScanned value)? qrScanned,
    TResult? Function(_BleScanning value)? bleScanning,
    TResult? Function(_BleFound value)? bleFound,
    TResult? Function(_BleConnected value)? bleConnected,
    TResult? Function(_AwaitingWifi value)? awaitingWifi,
    TResult? Function(_SendingWifi value)? sendingWifi,
    TResult? Function(_ClaimingDevice value)? claimingDevice,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_ProvisioningError value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_QrScanned value)? qrScanned,
    TResult Function(_BleScanning value)? bleScanning,
    TResult Function(_BleFound value)? bleFound,
    TResult Function(_BleConnected value)? bleConnected,
    TResult Function(_AwaitingWifi value)? awaitingWifi,
    TResult Function(_SendingWifi value)? sendingWifi,
    TResult Function(_ClaimingDevice value)? claimingDevice,
    TResult Function(_Complete value)? complete,
    TResult Function(_ProvisioningError value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements ProvisioningState {
  const factory _Idle() = _$IdleImpl;
}

/// @nodoc
abstract class _$$QrScannedImplCopyWith<$Res> {
  factory _$$QrScannedImplCopyWith(
          _$QrScannedImpl value, $Res Function(_$QrScannedImpl) then) =
      __$$QrScannedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String claimCode});
}

/// @nodoc
class __$$QrScannedImplCopyWithImpl<$Res>
    extends _$ProvisioningStateCopyWithImpl<$Res, _$QrScannedImpl>
    implements _$$QrScannedImplCopyWith<$Res> {
  __$$QrScannedImplCopyWithImpl(
      _$QrScannedImpl _value, $Res Function(_$QrScannedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? claimCode = null,
  }) {
    return _then(_$QrScannedImpl(
      claimCode: null == claimCode
          ? _value.claimCode
          : claimCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$QrScannedImpl implements _QrScanned {
  const _$QrScannedImpl({required this.claimCode});

  @override
  final String claimCode;

  @override
  String toString() {
    return 'ProvisioningState.qrScanned(claimCode: $claimCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrScannedImpl &&
            (identical(other.claimCode, claimCode) ||
                other.claimCode == claimCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, claimCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QrScannedImplCopyWith<_$QrScannedImpl> get copyWith =>
      __$$QrScannedImplCopyWithImpl<_$QrScannedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String claimCode) qrScanned,
    required TResult Function() bleScanning,
    required TResult Function(String deviceId, String deviceName) bleFound,
    required TResult Function(String deviceId) bleConnected,
    required TResult Function(String bleDeviceId, String claimCode)
        awaitingWifi,
    required TResult Function() sendingWifi,
    required TResult Function(String claimCode) claimingDevice,
    required TResult Function(String deviceId, String deviceName) complete,
    required TResult Function(String message, ProvisioningStep failedStep)
        error,
  }) {
    return qrScanned(claimCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String claimCode)? qrScanned,
    TResult? Function()? bleScanning,
    TResult? Function(String deviceId, String deviceName)? bleFound,
    TResult? Function(String deviceId)? bleConnected,
    TResult? Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult? Function()? sendingWifi,
    TResult? Function(String claimCode)? claimingDevice,
    TResult? Function(String deviceId, String deviceName)? complete,
    TResult? Function(String message, ProvisioningStep failedStep)? error,
  }) {
    return qrScanned?.call(claimCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String claimCode)? qrScanned,
    TResult Function()? bleScanning,
    TResult Function(String deviceId, String deviceName)? bleFound,
    TResult Function(String deviceId)? bleConnected,
    TResult Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult Function()? sendingWifi,
    TResult Function(String claimCode)? claimingDevice,
    TResult Function(String deviceId, String deviceName)? complete,
    TResult Function(String message, ProvisioningStep failedStep)? error,
    required TResult orElse(),
  }) {
    if (qrScanned != null) {
      return qrScanned(claimCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_QrScanned value) qrScanned,
    required TResult Function(_BleScanning value) bleScanning,
    required TResult Function(_BleFound value) bleFound,
    required TResult Function(_BleConnected value) bleConnected,
    required TResult Function(_AwaitingWifi value) awaitingWifi,
    required TResult Function(_SendingWifi value) sendingWifi,
    required TResult Function(_ClaimingDevice value) claimingDevice,
    required TResult Function(_Complete value) complete,
    required TResult Function(_ProvisioningError value) error,
  }) {
    return qrScanned(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_QrScanned value)? qrScanned,
    TResult? Function(_BleScanning value)? bleScanning,
    TResult? Function(_BleFound value)? bleFound,
    TResult? Function(_BleConnected value)? bleConnected,
    TResult? Function(_AwaitingWifi value)? awaitingWifi,
    TResult? Function(_SendingWifi value)? sendingWifi,
    TResult? Function(_ClaimingDevice value)? claimingDevice,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_ProvisioningError value)? error,
  }) {
    return qrScanned?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_QrScanned value)? qrScanned,
    TResult Function(_BleScanning value)? bleScanning,
    TResult Function(_BleFound value)? bleFound,
    TResult Function(_BleConnected value)? bleConnected,
    TResult Function(_AwaitingWifi value)? awaitingWifi,
    TResult Function(_SendingWifi value)? sendingWifi,
    TResult Function(_ClaimingDevice value)? claimingDevice,
    TResult Function(_Complete value)? complete,
    TResult Function(_ProvisioningError value)? error,
    required TResult orElse(),
  }) {
    if (qrScanned != null) {
      return qrScanned(this);
    }
    return orElse();
  }
}

abstract class _QrScanned implements ProvisioningState {
  const factory _QrScanned({required final String claimCode}) = _$QrScannedImpl;

  String get claimCode;
  @JsonKey(ignore: true)
  _$$QrScannedImplCopyWith<_$QrScannedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BleScanningImplCopyWith<$Res> {
  factory _$$BleScanningImplCopyWith(
          _$BleScanningImpl value, $Res Function(_$BleScanningImpl) then) =
      __$$BleScanningImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BleScanningImplCopyWithImpl<$Res>
    extends _$ProvisioningStateCopyWithImpl<$Res, _$BleScanningImpl>
    implements _$$BleScanningImplCopyWith<$Res> {
  __$$BleScanningImplCopyWithImpl(
      _$BleScanningImpl _value, $Res Function(_$BleScanningImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BleScanningImpl implements _BleScanning {
  const _$BleScanningImpl();

  @override
  String toString() {
    return 'ProvisioningState.bleScanning()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BleScanningImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String claimCode) qrScanned,
    required TResult Function() bleScanning,
    required TResult Function(String deviceId, String deviceName) bleFound,
    required TResult Function(String deviceId) bleConnected,
    required TResult Function(String bleDeviceId, String claimCode)
        awaitingWifi,
    required TResult Function() sendingWifi,
    required TResult Function(String claimCode) claimingDevice,
    required TResult Function(String deviceId, String deviceName) complete,
    required TResult Function(String message, ProvisioningStep failedStep)
        error,
  }) {
    return bleScanning();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String claimCode)? qrScanned,
    TResult? Function()? bleScanning,
    TResult? Function(String deviceId, String deviceName)? bleFound,
    TResult? Function(String deviceId)? bleConnected,
    TResult? Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult? Function()? sendingWifi,
    TResult? Function(String claimCode)? claimingDevice,
    TResult? Function(String deviceId, String deviceName)? complete,
    TResult? Function(String message, ProvisioningStep failedStep)? error,
  }) {
    return bleScanning?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String claimCode)? qrScanned,
    TResult Function()? bleScanning,
    TResult Function(String deviceId, String deviceName)? bleFound,
    TResult Function(String deviceId)? bleConnected,
    TResult Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult Function()? sendingWifi,
    TResult Function(String claimCode)? claimingDevice,
    TResult Function(String deviceId, String deviceName)? complete,
    TResult Function(String message, ProvisioningStep failedStep)? error,
    required TResult orElse(),
  }) {
    if (bleScanning != null) {
      return bleScanning();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_QrScanned value) qrScanned,
    required TResult Function(_BleScanning value) bleScanning,
    required TResult Function(_BleFound value) bleFound,
    required TResult Function(_BleConnected value) bleConnected,
    required TResult Function(_AwaitingWifi value) awaitingWifi,
    required TResult Function(_SendingWifi value) sendingWifi,
    required TResult Function(_ClaimingDevice value) claimingDevice,
    required TResult Function(_Complete value) complete,
    required TResult Function(_ProvisioningError value) error,
  }) {
    return bleScanning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_QrScanned value)? qrScanned,
    TResult? Function(_BleScanning value)? bleScanning,
    TResult? Function(_BleFound value)? bleFound,
    TResult? Function(_BleConnected value)? bleConnected,
    TResult? Function(_AwaitingWifi value)? awaitingWifi,
    TResult? Function(_SendingWifi value)? sendingWifi,
    TResult? Function(_ClaimingDevice value)? claimingDevice,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_ProvisioningError value)? error,
  }) {
    return bleScanning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_QrScanned value)? qrScanned,
    TResult Function(_BleScanning value)? bleScanning,
    TResult Function(_BleFound value)? bleFound,
    TResult Function(_BleConnected value)? bleConnected,
    TResult Function(_AwaitingWifi value)? awaitingWifi,
    TResult Function(_SendingWifi value)? sendingWifi,
    TResult Function(_ClaimingDevice value)? claimingDevice,
    TResult Function(_Complete value)? complete,
    TResult Function(_ProvisioningError value)? error,
    required TResult orElse(),
  }) {
    if (bleScanning != null) {
      return bleScanning(this);
    }
    return orElse();
  }
}

abstract class _BleScanning implements ProvisioningState {
  const factory _BleScanning() = _$BleScanningImpl;
}

/// @nodoc
abstract class _$$BleFoundImplCopyWith<$Res> {
  factory _$$BleFoundImplCopyWith(
          _$BleFoundImpl value, $Res Function(_$BleFoundImpl) then) =
      __$$BleFoundImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String deviceId, String deviceName});
}

/// @nodoc
class __$$BleFoundImplCopyWithImpl<$Res>
    extends _$ProvisioningStateCopyWithImpl<$Res, _$BleFoundImpl>
    implements _$$BleFoundImplCopyWith<$Res> {
  __$$BleFoundImplCopyWithImpl(
      _$BleFoundImpl _value, $Res Function(_$BleFoundImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? deviceName = null,
  }) {
    return _then(_$BleFoundImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BleFoundImpl implements _BleFound {
  const _$BleFoundImpl({required this.deviceId, required this.deviceName});

  @override
  final String deviceId;
  @override
  final String deviceName;

  @override
  String toString() {
    return 'ProvisioningState.bleFound(deviceId: $deviceId, deviceName: $deviceName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BleFoundImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId, deviceName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BleFoundImplCopyWith<_$BleFoundImpl> get copyWith =>
      __$$BleFoundImplCopyWithImpl<_$BleFoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String claimCode) qrScanned,
    required TResult Function() bleScanning,
    required TResult Function(String deviceId, String deviceName) bleFound,
    required TResult Function(String deviceId) bleConnected,
    required TResult Function(String bleDeviceId, String claimCode)
        awaitingWifi,
    required TResult Function() sendingWifi,
    required TResult Function(String claimCode) claimingDevice,
    required TResult Function(String deviceId, String deviceName) complete,
    required TResult Function(String message, ProvisioningStep failedStep)
        error,
  }) {
    return bleFound(deviceId, deviceName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String claimCode)? qrScanned,
    TResult? Function()? bleScanning,
    TResult? Function(String deviceId, String deviceName)? bleFound,
    TResult? Function(String deviceId)? bleConnected,
    TResult? Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult? Function()? sendingWifi,
    TResult? Function(String claimCode)? claimingDevice,
    TResult? Function(String deviceId, String deviceName)? complete,
    TResult? Function(String message, ProvisioningStep failedStep)? error,
  }) {
    return bleFound?.call(deviceId, deviceName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String claimCode)? qrScanned,
    TResult Function()? bleScanning,
    TResult Function(String deviceId, String deviceName)? bleFound,
    TResult Function(String deviceId)? bleConnected,
    TResult Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult Function()? sendingWifi,
    TResult Function(String claimCode)? claimingDevice,
    TResult Function(String deviceId, String deviceName)? complete,
    TResult Function(String message, ProvisioningStep failedStep)? error,
    required TResult orElse(),
  }) {
    if (bleFound != null) {
      return bleFound(deviceId, deviceName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_QrScanned value) qrScanned,
    required TResult Function(_BleScanning value) bleScanning,
    required TResult Function(_BleFound value) bleFound,
    required TResult Function(_BleConnected value) bleConnected,
    required TResult Function(_AwaitingWifi value) awaitingWifi,
    required TResult Function(_SendingWifi value) sendingWifi,
    required TResult Function(_ClaimingDevice value) claimingDevice,
    required TResult Function(_Complete value) complete,
    required TResult Function(_ProvisioningError value) error,
  }) {
    return bleFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_QrScanned value)? qrScanned,
    TResult? Function(_BleScanning value)? bleScanning,
    TResult? Function(_BleFound value)? bleFound,
    TResult? Function(_BleConnected value)? bleConnected,
    TResult? Function(_AwaitingWifi value)? awaitingWifi,
    TResult? Function(_SendingWifi value)? sendingWifi,
    TResult? Function(_ClaimingDevice value)? claimingDevice,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_ProvisioningError value)? error,
  }) {
    return bleFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_QrScanned value)? qrScanned,
    TResult Function(_BleScanning value)? bleScanning,
    TResult Function(_BleFound value)? bleFound,
    TResult Function(_BleConnected value)? bleConnected,
    TResult Function(_AwaitingWifi value)? awaitingWifi,
    TResult Function(_SendingWifi value)? sendingWifi,
    TResult Function(_ClaimingDevice value)? claimingDevice,
    TResult Function(_Complete value)? complete,
    TResult Function(_ProvisioningError value)? error,
    required TResult orElse(),
  }) {
    if (bleFound != null) {
      return bleFound(this);
    }
    return orElse();
  }
}

abstract class _BleFound implements ProvisioningState {
  const factory _BleFound(
      {required final String deviceId,
      required final String deviceName}) = _$BleFoundImpl;

  String get deviceId;
  String get deviceName;
  @JsonKey(ignore: true)
  _$$BleFoundImplCopyWith<_$BleFoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BleConnectedImplCopyWith<$Res> {
  factory _$$BleConnectedImplCopyWith(
          _$BleConnectedImpl value, $Res Function(_$BleConnectedImpl) then) =
      __$$BleConnectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String deviceId});
}

/// @nodoc
class __$$BleConnectedImplCopyWithImpl<$Res>
    extends _$ProvisioningStateCopyWithImpl<$Res, _$BleConnectedImpl>
    implements _$$BleConnectedImplCopyWith<$Res> {
  __$$BleConnectedImplCopyWithImpl(
      _$BleConnectedImpl _value, $Res Function(_$BleConnectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
  }) {
    return _then(_$BleConnectedImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BleConnectedImpl implements _BleConnected {
  const _$BleConnectedImpl({required this.deviceId});

  @override
  final String deviceId;

  @override
  String toString() {
    return 'ProvisioningState.bleConnected(deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BleConnectedImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BleConnectedImplCopyWith<_$BleConnectedImpl> get copyWith =>
      __$$BleConnectedImplCopyWithImpl<_$BleConnectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String claimCode) qrScanned,
    required TResult Function() bleScanning,
    required TResult Function(String deviceId, String deviceName) bleFound,
    required TResult Function(String deviceId) bleConnected,
    required TResult Function(String bleDeviceId, String claimCode)
        awaitingWifi,
    required TResult Function() sendingWifi,
    required TResult Function(String claimCode) claimingDevice,
    required TResult Function(String deviceId, String deviceName) complete,
    required TResult Function(String message, ProvisioningStep failedStep)
        error,
  }) {
    return bleConnected(deviceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String claimCode)? qrScanned,
    TResult? Function()? bleScanning,
    TResult? Function(String deviceId, String deviceName)? bleFound,
    TResult? Function(String deviceId)? bleConnected,
    TResult? Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult? Function()? sendingWifi,
    TResult? Function(String claimCode)? claimingDevice,
    TResult? Function(String deviceId, String deviceName)? complete,
    TResult? Function(String message, ProvisioningStep failedStep)? error,
  }) {
    return bleConnected?.call(deviceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String claimCode)? qrScanned,
    TResult Function()? bleScanning,
    TResult Function(String deviceId, String deviceName)? bleFound,
    TResult Function(String deviceId)? bleConnected,
    TResult Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult Function()? sendingWifi,
    TResult Function(String claimCode)? claimingDevice,
    TResult Function(String deviceId, String deviceName)? complete,
    TResult Function(String message, ProvisioningStep failedStep)? error,
    required TResult orElse(),
  }) {
    if (bleConnected != null) {
      return bleConnected(deviceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_QrScanned value) qrScanned,
    required TResult Function(_BleScanning value) bleScanning,
    required TResult Function(_BleFound value) bleFound,
    required TResult Function(_BleConnected value) bleConnected,
    required TResult Function(_AwaitingWifi value) awaitingWifi,
    required TResult Function(_SendingWifi value) sendingWifi,
    required TResult Function(_ClaimingDevice value) claimingDevice,
    required TResult Function(_Complete value) complete,
    required TResult Function(_ProvisioningError value) error,
  }) {
    return bleConnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_QrScanned value)? qrScanned,
    TResult? Function(_BleScanning value)? bleScanning,
    TResult? Function(_BleFound value)? bleFound,
    TResult? Function(_BleConnected value)? bleConnected,
    TResult? Function(_AwaitingWifi value)? awaitingWifi,
    TResult? Function(_SendingWifi value)? sendingWifi,
    TResult? Function(_ClaimingDevice value)? claimingDevice,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_ProvisioningError value)? error,
  }) {
    return bleConnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_QrScanned value)? qrScanned,
    TResult Function(_BleScanning value)? bleScanning,
    TResult Function(_BleFound value)? bleFound,
    TResult Function(_BleConnected value)? bleConnected,
    TResult Function(_AwaitingWifi value)? awaitingWifi,
    TResult Function(_SendingWifi value)? sendingWifi,
    TResult Function(_ClaimingDevice value)? claimingDevice,
    TResult Function(_Complete value)? complete,
    TResult Function(_ProvisioningError value)? error,
    required TResult orElse(),
  }) {
    if (bleConnected != null) {
      return bleConnected(this);
    }
    return orElse();
  }
}

abstract class _BleConnected implements ProvisioningState {
  const factory _BleConnected({required final String deviceId}) =
      _$BleConnectedImpl;

  String get deviceId;
  @JsonKey(ignore: true)
  _$$BleConnectedImplCopyWith<_$BleConnectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AwaitingWifiImplCopyWith<$Res> {
  factory _$$AwaitingWifiImplCopyWith(
          _$AwaitingWifiImpl value, $Res Function(_$AwaitingWifiImpl) then) =
      __$$AwaitingWifiImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String bleDeviceId, String claimCode});
}

/// @nodoc
class __$$AwaitingWifiImplCopyWithImpl<$Res>
    extends _$ProvisioningStateCopyWithImpl<$Res, _$AwaitingWifiImpl>
    implements _$$AwaitingWifiImplCopyWith<$Res> {
  __$$AwaitingWifiImplCopyWithImpl(
      _$AwaitingWifiImpl _value, $Res Function(_$AwaitingWifiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bleDeviceId = null,
    Object? claimCode = null,
  }) {
    return _then(_$AwaitingWifiImpl(
      bleDeviceId: null == bleDeviceId
          ? _value.bleDeviceId
          : bleDeviceId // ignore: cast_nullable_to_non_nullable
              as String,
      claimCode: null == claimCode
          ? _value.claimCode
          : claimCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AwaitingWifiImpl implements _AwaitingWifi {
  const _$AwaitingWifiImpl(
      {required this.bleDeviceId, required this.claimCode});

  @override
  final String bleDeviceId;
  @override
  final String claimCode;

  @override
  String toString() {
    return 'ProvisioningState.awaitingWifi(bleDeviceId: $bleDeviceId, claimCode: $claimCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AwaitingWifiImpl &&
            (identical(other.bleDeviceId, bleDeviceId) ||
                other.bleDeviceId == bleDeviceId) &&
            (identical(other.claimCode, claimCode) ||
                other.claimCode == claimCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bleDeviceId, claimCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AwaitingWifiImplCopyWith<_$AwaitingWifiImpl> get copyWith =>
      __$$AwaitingWifiImplCopyWithImpl<_$AwaitingWifiImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String claimCode) qrScanned,
    required TResult Function() bleScanning,
    required TResult Function(String deviceId, String deviceName) bleFound,
    required TResult Function(String deviceId) bleConnected,
    required TResult Function(String bleDeviceId, String claimCode)
        awaitingWifi,
    required TResult Function() sendingWifi,
    required TResult Function(String claimCode) claimingDevice,
    required TResult Function(String deviceId, String deviceName) complete,
    required TResult Function(String message, ProvisioningStep failedStep)
        error,
  }) {
    return awaitingWifi(bleDeviceId, claimCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String claimCode)? qrScanned,
    TResult? Function()? bleScanning,
    TResult? Function(String deviceId, String deviceName)? bleFound,
    TResult? Function(String deviceId)? bleConnected,
    TResult? Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult? Function()? sendingWifi,
    TResult? Function(String claimCode)? claimingDevice,
    TResult? Function(String deviceId, String deviceName)? complete,
    TResult? Function(String message, ProvisioningStep failedStep)? error,
  }) {
    return awaitingWifi?.call(bleDeviceId, claimCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String claimCode)? qrScanned,
    TResult Function()? bleScanning,
    TResult Function(String deviceId, String deviceName)? bleFound,
    TResult Function(String deviceId)? bleConnected,
    TResult Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult Function()? sendingWifi,
    TResult Function(String claimCode)? claimingDevice,
    TResult Function(String deviceId, String deviceName)? complete,
    TResult Function(String message, ProvisioningStep failedStep)? error,
    required TResult orElse(),
  }) {
    if (awaitingWifi != null) {
      return awaitingWifi(bleDeviceId, claimCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_QrScanned value) qrScanned,
    required TResult Function(_BleScanning value) bleScanning,
    required TResult Function(_BleFound value) bleFound,
    required TResult Function(_BleConnected value) bleConnected,
    required TResult Function(_AwaitingWifi value) awaitingWifi,
    required TResult Function(_SendingWifi value) sendingWifi,
    required TResult Function(_ClaimingDevice value) claimingDevice,
    required TResult Function(_Complete value) complete,
    required TResult Function(_ProvisioningError value) error,
  }) {
    return awaitingWifi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_QrScanned value)? qrScanned,
    TResult? Function(_BleScanning value)? bleScanning,
    TResult? Function(_BleFound value)? bleFound,
    TResult? Function(_BleConnected value)? bleConnected,
    TResult? Function(_AwaitingWifi value)? awaitingWifi,
    TResult? Function(_SendingWifi value)? sendingWifi,
    TResult? Function(_ClaimingDevice value)? claimingDevice,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_ProvisioningError value)? error,
  }) {
    return awaitingWifi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_QrScanned value)? qrScanned,
    TResult Function(_BleScanning value)? bleScanning,
    TResult Function(_BleFound value)? bleFound,
    TResult Function(_BleConnected value)? bleConnected,
    TResult Function(_AwaitingWifi value)? awaitingWifi,
    TResult Function(_SendingWifi value)? sendingWifi,
    TResult Function(_ClaimingDevice value)? claimingDevice,
    TResult Function(_Complete value)? complete,
    TResult Function(_ProvisioningError value)? error,
    required TResult orElse(),
  }) {
    if (awaitingWifi != null) {
      return awaitingWifi(this);
    }
    return orElse();
  }
}

abstract class _AwaitingWifi implements ProvisioningState {
  const factory _AwaitingWifi(
      {required final String bleDeviceId,
      required final String claimCode}) = _$AwaitingWifiImpl;

  String get bleDeviceId;
  String get claimCode;
  @JsonKey(ignore: true)
  _$$AwaitingWifiImplCopyWith<_$AwaitingWifiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendingWifiImplCopyWith<$Res> {
  factory _$$SendingWifiImplCopyWith(
          _$SendingWifiImpl value, $Res Function(_$SendingWifiImpl) then) =
      __$$SendingWifiImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendingWifiImplCopyWithImpl<$Res>
    extends _$ProvisioningStateCopyWithImpl<$Res, _$SendingWifiImpl>
    implements _$$SendingWifiImplCopyWith<$Res> {
  __$$SendingWifiImplCopyWithImpl(
      _$SendingWifiImpl _value, $Res Function(_$SendingWifiImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SendingWifiImpl implements _SendingWifi {
  const _$SendingWifiImpl();

  @override
  String toString() {
    return 'ProvisioningState.sendingWifi()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendingWifiImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String claimCode) qrScanned,
    required TResult Function() bleScanning,
    required TResult Function(String deviceId, String deviceName) bleFound,
    required TResult Function(String deviceId) bleConnected,
    required TResult Function(String bleDeviceId, String claimCode)
        awaitingWifi,
    required TResult Function() sendingWifi,
    required TResult Function(String claimCode) claimingDevice,
    required TResult Function(String deviceId, String deviceName) complete,
    required TResult Function(String message, ProvisioningStep failedStep)
        error,
  }) {
    return sendingWifi();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String claimCode)? qrScanned,
    TResult? Function()? bleScanning,
    TResult? Function(String deviceId, String deviceName)? bleFound,
    TResult? Function(String deviceId)? bleConnected,
    TResult? Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult? Function()? sendingWifi,
    TResult? Function(String claimCode)? claimingDevice,
    TResult? Function(String deviceId, String deviceName)? complete,
    TResult? Function(String message, ProvisioningStep failedStep)? error,
  }) {
    return sendingWifi?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String claimCode)? qrScanned,
    TResult Function()? bleScanning,
    TResult Function(String deviceId, String deviceName)? bleFound,
    TResult Function(String deviceId)? bleConnected,
    TResult Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult Function()? sendingWifi,
    TResult Function(String claimCode)? claimingDevice,
    TResult Function(String deviceId, String deviceName)? complete,
    TResult Function(String message, ProvisioningStep failedStep)? error,
    required TResult orElse(),
  }) {
    if (sendingWifi != null) {
      return sendingWifi();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_QrScanned value) qrScanned,
    required TResult Function(_BleScanning value) bleScanning,
    required TResult Function(_BleFound value) bleFound,
    required TResult Function(_BleConnected value) bleConnected,
    required TResult Function(_AwaitingWifi value) awaitingWifi,
    required TResult Function(_SendingWifi value) sendingWifi,
    required TResult Function(_ClaimingDevice value) claimingDevice,
    required TResult Function(_Complete value) complete,
    required TResult Function(_ProvisioningError value) error,
  }) {
    return sendingWifi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_QrScanned value)? qrScanned,
    TResult? Function(_BleScanning value)? bleScanning,
    TResult? Function(_BleFound value)? bleFound,
    TResult? Function(_BleConnected value)? bleConnected,
    TResult? Function(_AwaitingWifi value)? awaitingWifi,
    TResult? Function(_SendingWifi value)? sendingWifi,
    TResult? Function(_ClaimingDevice value)? claimingDevice,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_ProvisioningError value)? error,
  }) {
    return sendingWifi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_QrScanned value)? qrScanned,
    TResult Function(_BleScanning value)? bleScanning,
    TResult Function(_BleFound value)? bleFound,
    TResult Function(_BleConnected value)? bleConnected,
    TResult Function(_AwaitingWifi value)? awaitingWifi,
    TResult Function(_SendingWifi value)? sendingWifi,
    TResult Function(_ClaimingDevice value)? claimingDevice,
    TResult Function(_Complete value)? complete,
    TResult Function(_ProvisioningError value)? error,
    required TResult orElse(),
  }) {
    if (sendingWifi != null) {
      return sendingWifi(this);
    }
    return orElse();
  }
}

abstract class _SendingWifi implements ProvisioningState {
  const factory _SendingWifi() = _$SendingWifiImpl;
}

/// @nodoc
abstract class _$$ClaimingDeviceImplCopyWith<$Res> {
  factory _$$ClaimingDeviceImplCopyWith(_$ClaimingDeviceImpl value,
          $Res Function(_$ClaimingDeviceImpl) then) =
      __$$ClaimingDeviceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String claimCode});
}

/// @nodoc
class __$$ClaimingDeviceImplCopyWithImpl<$Res>
    extends _$ProvisioningStateCopyWithImpl<$Res, _$ClaimingDeviceImpl>
    implements _$$ClaimingDeviceImplCopyWith<$Res> {
  __$$ClaimingDeviceImplCopyWithImpl(
      _$ClaimingDeviceImpl _value, $Res Function(_$ClaimingDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? claimCode = null,
  }) {
    return _then(_$ClaimingDeviceImpl(
      claimCode: null == claimCode
          ? _value.claimCode
          : claimCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ClaimingDeviceImpl implements _ClaimingDevice {
  const _$ClaimingDeviceImpl({required this.claimCode});

  @override
  final String claimCode;

  @override
  String toString() {
    return 'ProvisioningState.claimingDevice(claimCode: $claimCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimingDeviceImpl &&
            (identical(other.claimCode, claimCode) ||
                other.claimCode == claimCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, claimCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimingDeviceImplCopyWith<_$ClaimingDeviceImpl> get copyWith =>
      __$$ClaimingDeviceImplCopyWithImpl<_$ClaimingDeviceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String claimCode) qrScanned,
    required TResult Function() bleScanning,
    required TResult Function(String deviceId, String deviceName) bleFound,
    required TResult Function(String deviceId) bleConnected,
    required TResult Function(String bleDeviceId, String claimCode)
        awaitingWifi,
    required TResult Function() sendingWifi,
    required TResult Function(String claimCode) claimingDevice,
    required TResult Function(String deviceId, String deviceName) complete,
    required TResult Function(String message, ProvisioningStep failedStep)
        error,
  }) {
    return claimingDevice(claimCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String claimCode)? qrScanned,
    TResult? Function()? bleScanning,
    TResult? Function(String deviceId, String deviceName)? bleFound,
    TResult? Function(String deviceId)? bleConnected,
    TResult? Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult? Function()? sendingWifi,
    TResult? Function(String claimCode)? claimingDevice,
    TResult? Function(String deviceId, String deviceName)? complete,
    TResult? Function(String message, ProvisioningStep failedStep)? error,
  }) {
    return claimingDevice?.call(claimCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String claimCode)? qrScanned,
    TResult Function()? bleScanning,
    TResult Function(String deviceId, String deviceName)? bleFound,
    TResult Function(String deviceId)? bleConnected,
    TResult Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult Function()? sendingWifi,
    TResult Function(String claimCode)? claimingDevice,
    TResult Function(String deviceId, String deviceName)? complete,
    TResult Function(String message, ProvisioningStep failedStep)? error,
    required TResult orElse(),
  }) {
    if (claimingDevice != null) {
      return claimingDevice(claimCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_QrScanned value) qrScanned,
    required TResult Function(_BleScanning value) bleScanning,
    required TResult Function(_BleFound value) bleFound,
    required TResult Function(_BleConnected value) bleConnected,
    required TResult Function(_AwaitingWifi value) awaitingWifi,
    required TResult Function(_SendingWifi value) sendingWifi,
    required TResult Function(_ClaimingDevice value) claimingDevice,
    required TResult Function(_Complete value) complete,
    required TResult Function(_ProvisioningError value) error,
  }) {
    return claimingDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_QrScanned value)? qrScanned,
    TResult? Function(_BleScanning value)? bleScanning,
    TResult? Function(_BleFound value)? bleFound,
    TResult? Function(_BleConnected value)? bleConnected,
    TResult? Function(_AwaitingWifi value)? awaitingWifi,
    TResult? Function(_SendingWifi value)? sendingWifi,
    TResult? Function(_ClaimingDevice value)? claimingDevice,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_ProvisioningError value)? error,
  }) {
    return claimingDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_QrScanned value)? qrScanned,
    TResult Function(_BleScanning value)? bleScanning,
    TResult Function(_BleFound value)? bleFound,
    TResult Function(_BleConnected value)? bleConnected,
    TResult Function(_AwaitingWifi value)? awaitingWifi,
    TResult Function(_SendingWifi value)? sendingWifi,
    TResult Function(_ClaimingDevice value)? claimingDevice,
    TResult Function(_Complete value)? complete,
    TResult Function(_ProvisioningError value)? error,
    required TResult orElse(),
  }) {
    if (claimingDevice != null) {
      return claimingDevice(this);
    }
    return orElse();
  }
}

abstract class _ClaimingDevice implements ProvisioningState {
  const factory _ClaimingDevice({required final String claimCode}) =
      _$ClaimingDeviceImpl;

  String get claimCode;
  @JsonKey(ignore: true)
  _$$ClaimingDeviceImplCopyWith<_$ClaimingDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompleteImplCopyWith<$Res> {
  factory _$$CompleteImplCopyWith(
          _$CompleteImpl value, $Res Function(_$CompleteImpl) then) =
      __$$CompleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String deviceId, String deviceName});
}

/// @nodoc
class __$$CompleteImplCopyWithImpl<$Res>
    extends _$ProvisioningStateCopyWithImpl<$Res, _$CompleteImpl>
    implements _$$CompleteImplCopyWith<$Res> {
  __$$CompleteImplCopyWithImpl(
      _$CompleteImpl _value, $Res Function(_$CompleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? deviceName = null,
  }) {
    return _then(_$CompleteImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CompleteImpl implements _Complete {
  const _$CompleteImpl({required this.deviceId, required this.deviceName});

  @override
  final String deviceId;
  @override
  final String deviceName;

  @override
  String toString() {
    return 'ProvisioningState.complete(deviceId: $deviceId, deviceName: $deviceName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId, deviceName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteImplCopyWith<_$CompleteImpl> get copyWith =>
      __$$CompleteImplCopyWithImpl<_$CompleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String claimCode) qrScanned,
    required TResult Function() bleScanning,
    required TResult Function(String deviceId, String deviceName) bleFound,
    required TResult Function(String deviceId) bleConnected,
    required TResult Function(String bleDeviceId, String claimCode)
        awaitingWifi,
    required TResult Function() sendingWifi,
    required TResult Function(String claimCode) claimingDevice,
    required TResult Function(String deviceId, String deviceName) complete,
    required TResult Function(String message, ProvisioningStep failedStep)
        error,
  }) {
    return complete(deviceId, deviceName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String claimCode)? qrScanned,
    TResult? Function()? bleScanning,
    TResult? Function(String deviceId, String deviceName)? bleFound,
    TResult? Function(String deviceId)? bleConnected,
    TResult? Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult? Function()? sendingWifi,
    TResult? Function(String claimCode)? claimingDevice,
    TResult? Function(String deviceId, String deviceName)? complete,
    TResult? Function(String message, ProvisioningStep failedStep)? error,
  }) {
    return complete?.call(deviceId, deviceName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String claimCode)? qrScanned,
    TResult Function()? bleScanning,
    TResult Function(String deviceId, String deviceName)? bleFound,
    TResult Function(String deviceId)? bleConnected,
    TResult Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult Function()? sendingWifi,
    TResult Function(String claimCode)? claimingDevice,
    TResult Function(String deviceId, String deviceName)? complete,
    TResult Function(String message, ProvisioningStep failedStep)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(deviceId, deviceName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_QrScanned value) qrScanned,
    required TResult Function(_BleScanning value) bleScanning,
    required TResult Function(_BleFound value) bleFound,
    required TResult Function(_BleConnected value) bleConnected,
    required TResult Function(_AwaitingWifi value) awaitingWifi,
    required TResult Function(_SendingWifi value) sendingWifi,
    required TResult Function(_ClaimingDevice value) claimingDevice,
    required TResult Function(_Complete value) complete,
    required TResult Function(_ProvisioningError value) error,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_QrScanned value)? qrScanned,
    TResult? Function(_BleScanning value)? bleScanning,
    TResult? Function(_BleFound value)? bleFound,
    TResult? Function(_BleConnected value)? bleConnected,
    TResult? Function(_AwaitingWifi value)? awaitingWifi,
    TResult? Function(_SendingWifi value)? sendingWifi,
    TResult? Function(_ClaimingDevice value)? claimingDevice,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_ProvisioningError value)? error,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_QrScanned value)? qrScanned,
    TResult Function(_BleScanning value)? bleScanning,
    TResult Function(_BleFound value)? bleFound,
    TResult Function(_BleConnected value)? bleConnected,
    TResult Function(_AwaitingWifi value)? awaitingWifi,
    TResult Function(_SendingWifi value)? sendingWifi,
    TResult Function(_ClaimingDevice value)? claimingDevice,
    TResult Function(_Complete value)? complete,
    TResult Function(_ProvisioningError value)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class _Complete implements ProvisioningState {
  const factory _Complete(
      {required final String deviceId,
      required final String deviceName}) = _$CompleteImpl;

  String get deviceId;
  String get deviceName;
  @JsonKey(ignore: true)
  _$$CompleteImplCopyWith<_$CompleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProvisioningErrorImplCopyWith<$Res> {
  factory _$$ProvisioningErrorImplCopyWith(_$ProvisioningErrorImpl value,
          $Res Function(_$ProvisioningErrorImpl) then) =
      __$$ProvisioningErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, ProvisioningStep failedStep});
}

/// @nodoc
class __$$ProvisioningErrorImplCopyWithImpl<$Res>
    extends _$ProvisioningStateCopyWithImpl<$Res, _$ProvisioningErrorImpl>
    implements _$$ProvisioningErrorImplCopyWith<$Res> {
  __$$ProvisioningErrorImplCopyWithImpl(_$ProvisioningErrorImpl _value,
      $Res Function(_$ProvisioningErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? failedStep = null,
  }) {
    return _then(_$ProvisioningErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      failedStep: null == failedStep
          ? _value.failedStep
          : failedStep // ignore: cast_nullable_to_non_nullable
              as ProvisioningStep,
    ));
  }
}

/// @nodoc

class _$ProvisioningErrorImpl implements _ProvisioningError {
  const _$ProvisioningErrorImpl(
      {required this.message, required this.failedStep});

  @override
  final String message;
  @override
  final ProvisioningStep failedStep;

  @override
  String toString() {
    return 'ProvisioningState.error(message: $message, failedStep: $failedStep)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvisioningErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.failedStep, failedStep) ||
                other.failedStep == failedStep));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, failedStep);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvisioningErrorImplCopyWith<_$ProvisioningErrorImpl> get copyWith =>
      __$$ProvisioningErrorImplCopyWithImpl<_$ProvisioningErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String claimCode) qrScanned,
    required TResult Function() bleScanning,
    required TResult Function(String deviceId, String deviceName) bleFound,
    required TResult Function(String deviceId) bleConnected,
    required TResult Function(String bleDeviceId, String claimCode)
        awaitingWifi,
    required TResult Function() sendingWifi,
    required TResult Function(String claimCode) claimingDevice,
    required TResult Function(String deviceId, String deviceName) complete,
    required TResult Function(String message, ProvisioningStep failedStep)
        error,
  }) {
    return error(message, failedStep);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String claimCode)? qrScanned,
    TResult? Function()? bleScanning,
    TResult? Function(String deviceId, String deviceName)? bleFound,
    TResult? Function(String deviceId)? bleConnected,
    TResult? Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult? Function()? sendingWifi,
    TResult? Function(String claimCode)? claimingDevice,
    TResult? Function(String deviceId, String deviceName)? complete,
    TResult? Function(String message, ProvisioningStep failedStep)? error,
  }) {
    return error?.call(message, failedStep);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String claimCode)? qrScanned,
    TResult Function()? bleScanning,
    TResult Function(String deviceId, String deviceName)? bleFound,
    TResult Function(String deviceId)? bleConnected,
    TResult Function(String bleDeviceId, String claimCode)? awaitingWifi,
    TResult Function()? sendingWifi,
    TResult Function(String claimCode)? claimingDevice,
    TResult Function(String deviceId, String deviceName)? complete,
    TResult Function(String message, ProvisioningStep failedStep)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, failedStep);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_QrScanned value) qrScanned,
    required TResult Function(_BleScanning value) bleScanning,
    required TResult Function(_BleFound value) bleFound,
    required TResult Function(_BleConnected value) bleConnected,
    required TResult Function(_AwaitingWifi value) awaitingWifi,
    required TResult Function(_SendingWifi value) sendingWifi,
    required TResult Function(_ClaimingDevice value) claimingDevice,
    required TResult Function(_Complete value) complete,
    required TResult Function(_ProvisioningError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_QrScanned value)? qrScanned,
    TResult? Function(_BleScanning value)? bleScanning,
    TResult? Function(_BleFound value)? bleFound,
    TResult? Function(_BleConnected value)? bleConnected,
    TResult? Function(_AwaitingWifi value)? awaitingWifi,
    TResult? Function(_SendingWifi value)? sendingWifi,
    TResult? Function(_ClaimingDevice value)? claimingDevice,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_ProvisioningError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_QrScanned value)? qrScanned,
    TResult Function(_BleScanning value)? bleScanning,
    TResult Function(_BleFound value)? bleFound,
    TResult Function(_BleConnected value)? bleConnected,
    TResult Function(_AwaitingWifi value)? awaitingWifi,
    TResult Function(_SendingWifi value)? sendingWifi,
    TResult Function(_ClaimingDevice value)? claimingDevice,
    TResult Function(_Complete value)? complete,
    TResult Function(_ProvisioningError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ProvisioningError implements ProvisioningState {
  const factory _ProvisioningError(
      {required final String message,
      required final ProvisioningStep failedStep}) = _$ProvisioningErrorImpl;

  String get message;
  ProvisioningStep get failedStep;
  @JsonKey(ignore: true)
  _$$ProvisioningErrorImplCopyWith<_$ProvisioningErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
