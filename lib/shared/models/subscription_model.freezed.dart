// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubscriptionPackage _$SubscriptionPackageFromJson(Map<String, dynamic> json) {
  return _SubscriptionPackage.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionPackage {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError; // 'BDT'
  int get durationDays => throw _privateConstructorUsedError;
  List<String> get features => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionPackageCopyWith<SubscriptionPackage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionPackageCopyWith<$Res> {
  factory $SubscriptionPackageCopyWith(
          SubscriptionPackage value, $Res Function(SubscriptionPackage) then) =
      _$SubscriptionPackageCopyWithImpl<$Res, SubscriptionPackage>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      String currency,
      int durationDays,
      List<String> features,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$SubscriptionPackageCopyWithImpl<$Res, $Val extends SubscriptionPackage>
    implements $SubscriptionPackageCopyWith<$Res> {
  _$SubscriptionPackageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? currency = null,
    Object? durationDays = null,
    Object? features = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      durationDays: null == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$SubscriptionPackageImplCopyWith<$Res>
    implements $SubscriptionPackageCopyWith<$Res> {
  factory _$$SubscriptionPackageImplCopyWith(_$SubscriptionPackageImpl value,
          $Res Function(_$SubscriptionPackageImpl) then) =
      __$$SubscriptionPackageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      String currency,
      int durationDays,
      List<String> features,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$SubscriptionPackageImplCopyWithImpl<$Res>
    extends _$SubscriptionPackageCopyWithImpl<$Res, _$SubscriptionPackageImpl>
    implements _$$SubscriptionPackageImplCopyWith<$Res> {
  __$$SubscriptionPackageImplCopyWithImpl(_$SubscriptionPackageImpl _value,
      $Res Function(_$SubscriptionPackageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? currency = null,
    Object? durationDays = null,
    Object? features = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$SubscriptionPackageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      durationDays: null == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$SubscriptionPackageImpl implements _SubscriptionPackage {
  const _$SubscriptionPackageImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.currency,
      required this.durationDays,
      required final List<String> features,
      required this.createdAt,
      required this.updatedAt})
      : _features = features;

  factory _$SubscriptionPackageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionPackageImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final String currency;
// 'BDT'
  @override
  final int durationDays;
  final List<String> _features;
  @override
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'SubscriptionPackage(id: $id, name: $name, description: $description, price: $price, currency: $currency, durationDays: $durationDays, features: $features, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionPackageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.durationDays, durationDays) ||
                other.durationDays == durationDays) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
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
      description,
      price,
      currency,
      durationDays,
      const DeepCollectionEquality().hash(_features),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionPackageImplCopyWith<_$SubscriptionPackageImpl> get copyWith =>
      __$$SubscriptionPackageImplCopyWithImpl<_$SubscriptionPackageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionPackageImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionPackage implements SubscriptionPackage {
  const factory _SubscriptionPackage(
      {required final String id,
      required final String name,
      required final String description,
      required final double price,
      required final String currency,
      required final int durationDays,
      required final List<String> features,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$SubscriptionPackageImpl;

  factory _SubscriptionPackage.fromJson(Map<String, dynamic> json) =
      _$SubscriptionPackageImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  String get currency;
  @override // 'BDT'
  int get durationDays;
  @override
  List<String> get features;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionPackageImplCopyWith<_$SubscriptionPackageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return _Subscription.fromJson(json);
}

/// @nodoc
mixin _$Subscription {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  String get packageId => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // 'ACTIVE' | 'EXPIRED' | 'SUSPENDED'
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionCopyWith<Subscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionCopyWith<$Res> {
  factory $SubscriptionCopyWith(
          Subscription value, $Res Function(Subscription) then) =
      _$SubscriptionCopyWithImpl<$Res, Subscription>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String deviceId,
      String packageId,
      String status,
      DateTime startDate,
      DateTime endDate,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$SubscriptionCopyWithImpl<$Res, $Val extends Subscription>
    implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? deviceId = null,
    Object? packageId = null,
    Object? status = null,
    Object? startDate = null,
    Object? endDate = null,
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
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      packageId: null == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$$SubscriptionImplCopyWith<$Res>
    implements $SubscriptionCopyWith<$Res> {
  factory _$$SubscriptionImplCopyWith(
          _$SubscriptionImpl value, $Res Function(_$SubscriptionImpl) then) =
      __$$SubscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String deviceId,
      String packageId,
      String status,
      DateTime startDate,
      DateTime endDate,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$SubscriptionImplCopyWithImpl<$Res>
    extends _$SubscriptionCopyWithImpl<$Res, _$SubscriptionImpl>
    implements _$$SubscriptionImplCopyWith<$Res> {
  __$$SubscriptionImplCopyWithImpl(
      _$SubscriptionImpl _value, $Res Function(_$SubscriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? deviceId = null,
    Object? packageId = null,
    Object? status = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$SubscriptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      packageId: null == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
class _$SubscriptionImpl implements _Subscription {
  const _$SubscriptionImpl(
      {required this.id,
      required this.userId,
      required this.deviceId,
      required this.packageId,
      required this.status,
      required this.startDate,
      required this.endDate,
      required this.createdAt,
      required this.updatedAt});

  factory _$SubscriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String deviceId;
  @override
  final String packageId;
  @override
  final String status;
// 'ACTIVE' | 'EXPIRED' | 'SUSPENDED'
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Subscription(id: $id, userId: $userId, deviceId: $deviceId, packageId: $packageId, status: $status, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.packageId, packageId) ||
                other.packageId == packageId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, deviceId, packageId,
      status, startDate, endDate, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionImplCopyWith<_$SubscriptionImpl> get copyWith =>
      __$$SubscriptionImplCopyWithImpl<_$SubscriptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionImplToJson(
      this,
    );
  }
}

abstract class _Subscription implements Subscription {
  const factory _Subscription(
      {required final String id,
      required final String userId,
      required final String deviceId,
      required final String packageId,
      required final String status,
      required final DateTime startDate,
      required final DateTime endDate,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$SubscriptionImpl;

  factory _Subscription.fromJson(Map<String, dynamic> json) =
      _$SubscriptionImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get deviceId;
  @override
  String get packageId;
  @override
  String get status;
  @override // 'ACTIVE' | 'EXPIRED' | 'SUSPENDED'
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionImplCopyWith<_$SubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubscribeRequest _$SubscribeRequestFromJson(Map<String, dynamic> json) {
  return _SubscribeRequest.fromJson(json);
}

/// @nodoc
mixin _$SubscribeRequest {
  String get deviceId => throw _privateConstructorUsedError;
  String get packageId => throw _privateConstructorUsedError;
  String get gateway => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscribeRequestCopyWith<SubscribeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscribeRequestCopyWith<$Res> {
  factory $SubscribeRequestCopyWith(
          SubscribeRequest value, $Res Function(SubscribeRequest) then) =
      _$SubscribeRequestCopyWithImpl<$Res, SubscribeRequest>;
  @useResult
  $Res call({String deviceId, String packageId, String gateway});
}

/// @nodoc
class _$SubscribeRequestCopyWithImpl<$Res, $Val extends SubscribeRequest>
    implements $SubscribeRequestCopyWith<$Res> {
  _$SubscribeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? packageId = null,
    Object? gateway = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      packageId: null == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String,
      gateway: null == gateway
          ? _value.gateway
          : gateway // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscribeRequestImplCopyWith<$Res>
    implements $SubscribeRequestCopyWith<$Res> {
  factory _$$SubscribeRequestImplCopyWith(_$SubscribeRequestImpl value,
          $Res Function(_$SubscribeRequestImpl) then) =
      __$$SubscribeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String deviceId, String packageId, String gateway});
}

/// @nodoc
class __$$SubscribeRequestImplCopyWithImpl<$Res>
    extends _$SubscribeRequestCopyWithImpl<$Res, _$SubscribeRequestImpl>
    implements _$$SubscribeRequestImplCopyWith<$Res> {
  __$$SubscribeRequestImplCopyWithImpl(_$SubscribeRequestImpl _value,
      $Res Function(_$SubscribeRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? packageId = null,
    Object? gateway = null,
  }) {
    return _then(_$SubscribeRequestImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      packageId: null == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String,
      gateway: null == gateway
          ? _value.gateway
          : gateway // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscribeRequestImpl implements _SubscribeRequest {
  const _$SubscribeRequestImpl(
      {required this.deviceId, required this.packageId, required this.gateway});

  factory _$SubscribeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscribeRequestImplFromJson(json);

  @override
  final String deviceId;
  @override
  final String packageId;
  @override
  final String gateway;

  @override
  String toString() {
    return 'SubscribeRequest(deviceId: $deviceId, packageId: $packageId, gateway: $gateway)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscribeRequestImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.packageId, packageId) ||
                other.packageId == packageId) &&
            (identical(other.gateway, gateway) || other.gateway == gateway));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, packageId, gateway);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscribeRequestImplCopyWith<_$SubscribeRequestImpl> get copyWith =>
      __$$SubscribeRequestImplCopyWithImpl<_$SubscribeRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscribeRequestImplToJson(
      this,
    );
  }
}

abstract class _SubscribeRequest implements SubscribeRequest {
  const factory _SubscribeRequest(
      {required final String deviceId,
      required final String packageId,
      required final String gateway}) = _$SubscribeRequestImpl;

  factory _SubscribeRequest.fromJson(Map<String, dynamic> json) =
      _$SubscribeRequestImpl.fromJson;

  @override
  String get deviceId;
  @override
  String get packageId;
  @override
  String get gateway;
  @override
  @JsonKey(ignore: true)
  _$$SubscribeRequestImplCopyWith<_$SubscribeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
