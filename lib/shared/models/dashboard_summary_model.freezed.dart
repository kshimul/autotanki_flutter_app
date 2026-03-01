// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardResponse _$DashboardResponseFromJson(Map<String, dynamic> json) {
  return _DashboardResponse.fromJson(json);
}

/// @nodoc
mixin _$DashboardResponse {
  bool get success => throw _privateConstructorUsedError;
  DashboardData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardResponseCopyWith<DashboardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardResponseCopyWith<$Res> {
  factory $DashboardResponseCopyWith(
          DashboardResponse value, $Res Function(DashboardResponse) then) =
      _$DashboardResponseCopyWithImpl<$Res, DashboardResponse>;
  @useResult
  $Res call({bool success, DashboardData data});

  $DashboardDataCopyWith<$Res> get data;
}

/// @nodoc
class _$DashboardResponseCopyWithImpl<$Res, $Val extends DashboardResponse>
    implements $DashboardResponseCopyWith<$Res> {
  _$DashboardResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DashboardData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DashboardDataCopyWith<$Res> get data {
    return $DashboardDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardResponseImplCopyWith<$Res>
    implements $DashboardResponseCopyWith<$Res> {
  factory _$$DashboardResponseImplCopyWith(_$DashboardResponseImpl value,
          $Res Function(_$DashboardResponseImpl) then) =
      __$$DashboardResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, DashboardData data});

  @override
  $DashboardDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$DashboardResponseImplCopyWithImpl<$Res>
    extends _$DashboardResponseCopyWithImpl<$Res, _$DashboardResponseImpl>
    implements _$$DashboardResponseImplCopyWith<$Res> {
  __$$DashboardResponseImplCopyWithImpl(_$DashboardResponseImpl _value,
      $Res Function(_$DashboardResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$DashboardResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DashboardData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardResponseImpl implements _DashboardResponse {
  const _$DashboardResponseImpl({this.success = false, required this.data});

  factory _$DashboardResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  final DashboardData data;

  @override
  String toString() {
    return 'DashboardResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardResponseImplCopyWith<_$DashboardResponseImpl> get copyWith =>
      __$$DashboardResponseImplCopyWithImpl<_$DashboardResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardResponseImplToJson(
      this,
    );
  }
}

abstract class _DashboardResponse implements DashboardResponse {
  const factory _DashboardResponse(
      {final bool success,
      required final DashboardData data}) = _$DashboardResponseImpl;

  factory _DashboardResponse.fromJson(Map<String, dynamic> json) =
      _$DashboardResponseImpl.fromJson;

  @override
  bool get success;
  @override
  DashboardData get data;
  @override
  @JsonKey(ignore: true)
  _$$DashboardResponseImplCopyWith<_$DashboardResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) {
  return _DashboardData.fromJson(json);
}

/// @nodoc
mixin _$DashboardData {
  DashboardSummary get summary => throw _privateConstructorUsedError;
  List<Device> get devices => throw _privateConstructorUsedError;
  List<dynamic> get recentInvoices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardDataCopyWith<DashboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardDataCopyWith<$Res> {
  factory $DashboardDataCopyWith(
          DashboardData value, $Res Function(DashboardData) then) =
      _$DashboardDataCopyWithImpl<$Res, DashboardData>;
  @useResult
  $Res call(
      {DashboardSummary summary,
      List<Device> devices,
      List<dynamic> recentInvoices});

  $DashboardSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class _$DashboardDataCopyWithImpl<$Res, $Val extends DashboardData>
    implements $DashboardDataCopyWith<$Res> {
  _$DashboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? devices = null,
    Object? recentInvoices = null,
  }) {
    return _then(_value.copyWith(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as DashboardSummary,
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<Device>,
      recentInvoices: null == recentInvoices
          ? _value.recentInvoices
          : recentInvoices // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DashboardSummaryCopyWith<$Res> get summary {
    return $DashboardSummaryCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardDataImplCopyWith<$Res>
    implements $DashboardDataCopyWith<$Res> {
  factory _$$DashboardDataImplCopyWith(
          _$DashboardDataImpl value, $Res Function(_$DashboardDataImpl) then) =
      __$$DashboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DashboardSummary summary,
      List<Device> devices,
      List<dynamic> recentInvoices});

  @override
  $DashboardSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class __$$DashboardDataImplCopyWithImpl<$Res>
    extends _$DashboardDataCopyWithImpl<$Res, _$DashboardDataImpl>
    implements _$$DashboardDataImplCopyWith<$Res> {
  __$$DashboardDataImplCopyWithImpl(
      _$DashboardDataImpl _value, $Res Function(_$DashboardDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? devices = null,
    Object? recentInvoices = null,
  }) {
    return _then(_$DashboardDataImpl(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as DashboardSummary,
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<Device>,
      recentInvoices: null == recentInvoices
          ? _value._recentInvoices
          : recentInvoices // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardDataImpl implements _DashboardData {
  const _$DashboardDataImpl(
      {required this.summary,
      final List<Device> devices = const [],
      final List<dynamic> recentInvoices = const []})
      : _devices = devices,
        _recentInvoices = recentInvoices;

  factory _$DashboardDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardDataImplFromJson(json);

  @override
  final DashboardSummary summary;
  final List<Device> _devices;
  @override
  @JsonKey()
  List<Device> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  final List<dynamic> _recentInvoices;
  @override
  @JsonKey()
  List<dynamic> get recentInvoices {
    if (_recentInvoices is EqualUnmodifiableListView) return _recentInvoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentInvoices);
  }

  @override
  String toString() {
    return 'DashboardData(summary: $summary, devices: $devices, recentInvoices: $recentInvoices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardDataImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            const DeepCollectionEquality()
                .equals(other._recentInvoices, _recentInvoices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      summary,
      const DeepCollectionEquality().hash(_devices),
      const DeepCollectionEquality().hash(_recentInvoices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      __$$DashboardDataImplCopyWithImpl<_$DashboardDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardDataImplToJson(
      this,
    );
  }
}

abstract class _DashboardData implements DashboardData {
  const factory _DashboardData(
      {required final DashboardSummary summary,
      final List<Device> devices,
      final List<dynamic> recentInvoices}) = _$DashboardDataImpl;

  factory _DashboardData.fromJson(Map<String, dynamic> json) =
      _$DashboardDataImpl.fromJson;

  @override
  DashboardSummary get summary;
  @override
  List<Device> get devices;
  @override
  List<dynamic> get recentInvoices;
  @override
  @JsonKey(ignore: true)
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardSummary _$DashboardSummaryFromJson(Map<String, dynamic> json) {
  return _DashboardSummary.fromJson(json);
}

/// @nodoc
mixin _$DashboardSummary {
  int get totalDevices => throw _privateConstructorUsedError;
  int get onlineDevices => throw _privateConstructorUsedError;
  int get suspendedDevices => throw _privateConstructorUsedError;
  int get activeSubscriptions => throw _privateConstructorUsedError;
  int get openTickets => throw _privateConstructorUsedError;
  int get sharedDevices => throw _privateConstructorUsedError;
  int get unpaidInvoices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardSummaryCopyWith<DashboardSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardSummaryCopyWith<$Res> {
  factory $DashboardSummaryCopyWith(
          DashboardSummary value, $Res Function(DashboardSummary) then) =
      _$DashboardSummaryCopyWithImpl<$Res, DashboardSummary>;
  @useResult
  $Res call(
      {int totalDevices,
      int onlineDevices,
      int suspendedDevices,
      int activeSubscriptions,
      int openTickets,
      int sharedDevices,
      int unpaidInvoices});
}

/// @nodoc
class _$DashboardSummaryCopyWithImpl<$Res, $Val extends DashboardSummary>
    implements $DashboardSummaryCopyWith<$Res> {
  _$DashboardSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalDevices = null,
    Object? onlineDevices = null,
    Object? suspendedDevices = null,
    Object? activeSubscriptions = null,
    Object? openTickets = null,
    Object? sharedDevices = null,
    Object? unpaidInvoices = null,
  }) {
    return _then(_value.copyWith(
      totalDevices: null == totalDevices
          ? _value.totalDevices
          : totalDevices // ignore: cast_nullable_to_non_nullable
              as int,
      onlineDevices: null == onlineDevices
          ? _value.onlineDevices
          : onlineDevices // ignore: cast_nullable_to_non_nullable
              as int,
      suspendedDevices: null == suspendedDevices
          ? _value.suspendedDevices
          : suspendedDevices // ignore: cast_nullable_to_non_nullable
              as int,
      activeSubscriptions: null == activeSubscriptions
          ? _value.activeSubscriptions
          : activeSubscriptions // ignore: cast_nullable_to_non_nullable
              as int,
      openTickets: null == openTickets
          ? _value.openTickets
          : openTickets // ignore: cast_nullable_to_non_nullable
              as int,
      sharedDevices: null == sharedDevices
          ? _value.sharedDevices
          : sharedDevices // ignore: cast_nullable_to_non_nullable
              as int,
      unpaidInvoices: null == unpaidInvoices
          ? _value.unpaidInvoices
          : unpaidInvoices // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardSummaryImplCopyWith<$Res>
    implements $DashboardSummaryCopyWith<$Res> {
  factory _$$DashboardSummaryImplCopyWith(_$DashboardSummaryImpl value,
          $Res Function(_$DashboardSummaryImpl) then) =
      __$$DashboardSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalDevices,
      int onlineDevices,
      int suspendedDevices,
      int activeSubscriptions,
      int openTickets,
      int sharedDevices,
      int unpaidInvoices});
}

/// @nodoc
class __$$DashboardSummaryImplCopyWithImpl<$Res>
    extends _$DashboardSummaryCopyWithImpl<$Res, _$DashboardSummaryImpl>
    implements _$$DashboardSummaryImplCopyWith<$Res> {
  __$$DashboardSummaryImplCopyWithImpl(_$DashboardSummaryImpl _value,
      $Res Function(_$DashboardSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalDevices = null,
    Object? onlineDevices = null,
    Object? suspendedDevices = null,
    Object? activeSubscriptions = null,
    Object? openTickets = null,
    Object? sharedDevices = null,
    Object? unpaidInvoices = null,
  }) {
    return _then(_$DashboardSummaryImpl(
      totalDevices: null == totalDevices
          ? _value.totalDevices
          : totalDevices // ignore: cast_nullable_to_non_nullable
              as int,
      onlineDevices: null == onlineDevices
          ? _value.onlineDevices
          : onlineDevices // ignore: cast_nullable_to_non_nullable
              as int,
      suspendedDevices: null == suspendedDevices
          ? _value.suspendedDevices
          : suspendedDevices // ignore: cast_nullable_to_non_nullable
              as int,
      activeSubscriptions: null == activeSubscriptions
          ? _value.activeSubscriptions
          : activeSubscriptions // ignore: cast_nullable_to_non_nullable
              as int,
      openTickets: null == openTickets
          ? _value.openTickets
          : openTickets // ignore: cast_nullable_to_non_nullable
              as int,
      sharedDevices: null == sharedDevices
          ? _value.sharedDevices
          : sharedDevices // ignore: cast_nullable_to_non_nullable
              as int,
      unpaidInvoices: null == unpaidInvoices
          ? _value.unpaidInvoices
          : unpaidInvoices // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardSummaryImpl implements _DashboardSummary {
  const _$DashboardSummaryImpl(
      {this.totalDevices = 0,
      this.onlineDevices = 0,
      this.suspendedDevices = 0,
      this.activeSubscriptions = 0,
      this.openTickets = 0,
      this.sharedDevices = 0,
      this.unpaidInvoices = 0});

  factory _$DashboardSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardSummaryImplFromJson(json);

  @override
  @JsonKey()
  final int totalDevices;
  @override
  @JsonKey()
  final int onlineDevices;
  @override
  @JsonKey()
  final int suspendedDevices;
  @override
  @JsonKey()
  final int activeSubscriptions;
  @override
  @JsonKey()
  final int openTickets;
  @override
  @JsonKey()
  final int sharedDevices;
  @override
  @JsonKey()
  final int unpaidInvoices;

  @override
  String toString() {
    return 'DashboardSummary(totalDevices: $totalDevices, onlineDevices: $onlineDevices, suspendedDevices: $suspendedDevices, activeSubscriptions: $activeSubscriptions, openTickets: $openTickets, sharedDevices: $sharedDevices, unpaidInvoices: $unpaidInvoices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardSummaryImpl &&
            (identical(other.totalDevices, totalDevices) ||
                other.totalDevices == totalDevices) &&
            (identical(other.onlineDevices, onlineDevices) ||
                other.onlineDevices == onlineDevices) &&
            (identical(other.suspendedDevices, suspendedDevices) ||
                other.suspendedDevices == suspendedDevices) &&
            (identical(other.activeSubscriptions, activeSubscriptions) ||
                other.activeSubscriptions == activeSubscriptions) &&
            (identical(other.openTickets, openTickets) ||
                other.openTickets == openTickets) &&
            (identical(other.sharedDevices, sharedDevices) ||
                other.sharedDevices == sharedDevices) &&
            (identical(other.unpaidInvoices, unpaidInvoices) ||
                other.unpaidInvoices == unpaidInvoices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalDevices,
      onlineDevices,
      suspendedDevices,
      activeSubscriptions,
      openTickets,
      sharedDevices,
      unpaidInvoices);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardSummaryImplCopyWith<_$DashboardSummaryImpl> get copyWith =>
      __$$DashboardSummaryImplCopyWithImpl<_$DashboardSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardSummaryImplToJson(
      this,
    );
  }
}

abstract class _DashboardSummary implements DashboardSummary {
  const factory _DashboardSummary(
      {final int totalDevices,
      final int onlineDevices,
      final int suspendedDevices,
      final int activeSubscriptions,
      final int openTickets,
      final int sharedDevices,
      final int unpaidInvoices}) = _$DashboardSummaryImpl;

  factory _DashboardSummary.fromJson(Map<String, dynamic> json) =
      _$DashboardSummaryImpl.fromJson;

  @override
  int get totalDevices;
  @override
  int get onlineDevices;
  @override
  int get suspendedDevices;
  @override
  int get activeSubscriptions;
  @override
  int get openTickets;
  @override
  int get sharedDevices;
  @override
  int get unpaidInvoices;
  @override
  @JsonKey(ignore: true)
  _$$DashboardSummaryImplCopyWith<_$DashboardSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
