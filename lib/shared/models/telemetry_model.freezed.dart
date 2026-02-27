// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'telemetry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TelemetryData _$TelemetryDataFromJson(Map<String, dynamic> json) {
  return _TelemetryData.fromJson(json);
}

/// @nodoc
mixin _$TelemetryData {
  String get deviceId =>
      throw _privateConstructorUsedError; // Water levels (0–100 percentage)
  double get ohtLevel => throw _privateConstructorUsedError; // Overhead Tank %
  double get ugtLevel =>
      throw _privateConstructorUsedError; // Underground Tank %
// Motor states
  String get ohtMotorState =>
      throw _privateConstructorUsedError; // 'ON' | 'OFF' | 'DRY_RUN'
  String get ugtMotorState => throw _privateConstructorUsedError; // Power
  double get powerWatts => throw _privateConstructorUsedError; // Current draw W
  double get energyKwh =>
      throw _privateConstructorUsedError; // Session energy kWh
// Firmware reported
  String get firmwareMode =>
      throw _privateConstructorUsedError; // 'AUTO' | 'MANUAL'
  bool get isSystemSuspended =>
      throw _privateConstructorUsedError; // SYS_SUSPENDED flag
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TelemetryDataCopyWith<TelemetryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TelemetryDataCopyWith<$Res> {
  factory $TelemetryDataCopyWith(
          TelemetryData value, $Res Function(TelemetryData) then) =
      _$TelemetryDataCopyWithImpl<$Res, TelemetryData>;
  @useResult
  $Res call(
      {String deviceId,
      double ohtLevel,
      double ugtLevel,
      String ohtMotorState,
      String ugtMotorState,
      double powerWatts,
      double energyKwh,
      String firmwareMode,
      bool isSystemSuspended,
      DateTime timestamp});
}

/// @nodoc
class _$TelemetryDataCopyWithImpl<$Res, $Val extends TelemetryData>
    implements $TelemetryDataCopyWith<$Res> {
  _$TelemetryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? ohtLevel = null,
    Object? ugtLevel = null,
    Object? ohtMotorState = null,
    Object? ugtMotorState = null,
    Object? powerWatts = null,
    Object? energyKwh = null,
    Object? firmwareMode = null,
    Object? isSystemSuspended = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      ohtLevel: null == ohtLevel
          ? _value.ohtLevel
          : ohtLevel // ignore: cast_nullable_to_non_nullable
              as double,
      ugtLevel: null == ugtLevel
          ? _value.ugtLevel
          : ugtLevel // ignore: cast_nullable_to_non_nullable
              as double,
      ohtMotorState: null == ohtMotorState
          ? _value.ohtMotorState
          : ohtMotorState // ignore: cast_nullable_to_non_nullable
              as String,
      ugtMotorState: null == ugtMotorState
          ? _value.ugtMotorState
          : ugtMotorState // ignore: cast_nullable_to_non_nullable
              as String,
      powerWatts: null == powerWatts
          ? _value.powerWatts
          : powerWatts // ignore: cast_nullable_to_non_nullable
              as double,
      energyKwh: null == energyKwh
          ? _value.energyKwh
          : energyKwh // ignore: cast_nullable_to_non_nullable
              as double,
      firmwareMode: null == firmwareMode
          ? _value.firmwareMode
          : firmwareMode // ignore: cast_nullable_to_non_nullable
              as String,
      isSystemSuspended: null == isSystemSuspended
          ? _value.isSystemSuspended
          : isSystemSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TelemetryDataImplCopyWith<$Res>
    implements $TelemetryDataCopyWith<$Res> {
  factory _$$TelemetryDataImplCopyWith(
          _$TelemetryDataImpl value, $Res Function(_$TelemetryDataImpl) then) =
      __$$TelemetryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deviceId,
      double ohtLevel,
      double ugtLevel,
      String ohtMotorState,
      String ugtMotorState,
      double powerWatts,
      double energyKwh,
      String firmwareMode,
      bool isSystemSuspended,
      DateTime timestamp});
}

/// @nodoc
class __$$TelemetryDataImplCopyWithImpl<$Res>
    extends _$TelemetryDataCopyWithImpl<$Res, _$TelemetryDataImpl>
    implements _$$TelemetryDataImplCopyWith<$Res> {
  __$$TelemetryDataImplCopyWithImpl(
      _$TelemetryDataImpl _value, $Res Function(_$TelemetryDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? ohtLevel = null,
    Object? ugtLevel = null,
    Object? ohtMotorState = null,
    Object? ugtMotorState = null,
    Object? powerWatts = null,
    Object? energyKwh = null,
    Object? firmwareMode = null,
    Object? isSystemSuspended = null,
    Object? timestamp = null,
  }) {
    return _then(_$TelemetryDataImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      ohtLevel: null == ohtLevel
          ? _value.ohtLevel
          : ohtLevel // ignore: cast_nullable_to_non_nullable
              as double,
      ugtLevel: null == ugtLevel
          ? _value.ugtLevel
          : ugtLevel // ignore: cast_nullable_to_non_nullable
              as double,
      ohtMotorState: null == ohtMotorState
          ? _value.ohtMotorState
          : ohtMotorState // ignore: cast_nullable_to_non_nullable
              as String,
      ugtMotorState: null == ugtMotorState
          ? _value.ugtMotorState
          : ugtMotorState // ignore: cast_nullable_to_non_nullable
              as String,
      powerWatts: null == powerWatts
          ? _value.powerWatts
          : powerWatts // ignore: cast_nullable_to_non_nullable
              as double,
      energyKwh: null == energyKwh
          ? _value.energyKwh
          : energyKwh // ignore: cast_nullable_to_non_nullable
              as double,
      firmwareMode: null == firmwareMode
          ? _value.firmwareMode
          : firmwareMode // ignore: cast_nullable_to_non_nullable
              as String,
      isSystemSuspended: null == isSystemSuspended
          ? _value.isSystemSuspended
          : isSystemSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TelemetryDataImpl implements _TelemetryData {
  const _$TelemetryDataImpl(
      {required this.deviceId,
      required this.ohtLevel,
      required this.ugtLevel,
      required this.ohtMotorState,
      required this.ugtMotorState,
      required this.powerWatts,
      required this.energyKwh,
      required this.firmwareMode,
      required this.isSystemSuspended,
      required this.timestamp});

  factory _$TelemetryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TelemetryDataImplFromJson(json);

  @override
  final String deviceId;
// Water levels (0–100 percentage)
  @override
  final double ohtLevel;
// Overhead Tank %
  @override
  final double ugtLevel;
// Underground Tank %
// Motor states
  @override
  final String ohtMotorState;
// 'ON' | 'OFF' | 'DRY_RUN'
  @override
  final String ugtMotorState;
// Power
  @override
  final double powerWatts;
// Current draw W
  @override
  final double energyKwh;
// Session energy kWh
// Firmware reported
  @override
  final String firmwareMode;
// 'AUTO' | 'MANUAL'
  @override
  final bool isSystemSuspended;
// SYS_SUSPENDED flag
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'TelemetryData(deviceId: $deviceId, ohtLevel: $ohtLevel, ugtLevel: $ugtLevel, ohtMotorState: $ohtMotorState, ugtMotorState: $ugtMotorState, powerWatts: $powerWatts, energyKwh: $energyKwh, firmwareMode: $firmwareMode, isSystemSuspended: $isSystemSuspended, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TelemetryDataImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.ohtLevel, ohtLevel) ||
                other.ohtLevel == ohtLevel) &&
            (identical(other.ugtLevel, ugtLevel) ||
                other.ugtLevel == ugtLevel) &&
            (identical(other.ohtMotorState, ohtMotorState) ||
                other.ohtMotorState == ohtMotorState) &&
            (identical(other.ugtMotorState, ugtMotorState) ||
                other.ugtMotorState == ugtMotorState) &&
            (identical(other.powerWatts, powerWatts) ||
                other.powerWatts == powerWatts) &&
            (identical(other.energyKwh, energyKwh) ||
                other.energyKwh == energyKwh) &&
            (identical(other.firmwareMode, firmwareMode) ||
                other.firmwareMode == firmwareMode) &&
            (identical(other.isSystemSuspended, isSystemSuspended) ||
                other.isSystemSuspended == isSystemSuspended) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deviceId,
      ohtLevel,
      ugtLevel,
      ohtMotorState,
      ugtMotorState,
      powerWatts,
      energyKwh,
      firmwareMode,
      isSystemSuspended,
      timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TelemetryDataImplCopyWith<_$TelemetryDataImpl> get copyWith =>
      __$$TelemetryDataImplCopyWithImpl<_$TelemetryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TelemetryDataImplToJson(
      this,
    );
  }
}

abstract class _TelemetryData implements TelemetryData {
  const factory _TelemetryData(
      {required final String deviceId,
      required final double ohtLevel,
      required final double ugtLevel,
      required final String ohtMotorState,
      required final String ugtMotorState,
      required final double powerWatts,
      required final double energyKwh,
      required final String firmwareMode,
      required final bool isSystemSuspended,
      required final DateTime timestamp}) = _$TelemetryDataImpl;

  factory _TelemetryData.fromJson(Map<String, dynamic> json) =
      _$TelemetryDataImpl.fromJson;

  @override
  String get deviceId;
  @override // Water levels (0–100 percentage)
  double get ohtLevel;
  @override // Overhead Tank %
  double get ugtLevel;
  @override // Underground Tank %
// Motor states
  String get ohtMotorState;
  @override // 'ON' | 'OFF' | 'DRY_RUN'
  String get ugtMotorState;
  @override // Power
  double get powerWatts;
  @override // Current draw W
  double get energyKwh;
  @override // Session energy kWh
// Firmware reported
  String get firmwareMode;
  @override // 'AUTO' | 'MANUAL'
  bool get isSystemSuspended;
  @override // SYS_SUSPENDED flag
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$TelemetryDataImplCopyWith<_$TelemetryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
