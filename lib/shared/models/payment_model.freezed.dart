// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentGateway _$PaymentGatewayFromJson(Map<String, dynamic> json) {
  return _PaymentGateway.fromJson(json);
}

/// @nodoc
mixin _$PaymentGateway {
  String get id => throw _privateConstructorUsedError;
  String get name =>
      throw _privateConstructorUsedError; // 'bKash' | 'SSLCommerz' | 'Nagad'
  String get code =>
      throw _privateConstructorUsedError; // 'BKASH' | 'SSLCOMMERZ'
  String get logoUrl => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentGatewayCopyWith<PaymentGateway> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentGatewayCopyWith<$Res> {
  factory $PaymentGatewayCopyWith(
          PaymentGateway value, $Res Function(PaymentGateway) then) =
      _$PaymentGatewayCopyWithImpl<$Res, PaymentGateway>;
  @useResult
  $Res call(
      {String id,
      String name,
      String code,
      String logoUrl,
      bool isEnabled,
      int sortOrder});
}

/// @nodoc
class _$PaymentGatewayCopyWithImpl<$Res, $Val extends PaymentGateway>
    implements $PaymentGatewayCopyWith<$Res> {
  _$PaymentGatewayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? logoUrl = null,
    Object? isEnabled = null,
    Object? sortOrder = null,
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
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentGatewayImplCopyWith<$Res>
    implements $PaymentGatewayCopyWith<$Res> {
  factory _$$PaymentGatewayImplCopyWith(_$PaymentGatewayImpl value,
          $Res Function(_$PaymentGatewayImpl) then) =
      __$$PaymentGatewayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String code,
      String logoUrl,
      bool isEnabled,
      int sortOrder});
}

/// @nodoc
class __$$PaymentGatewayImplCopyWithImpl<$Res>
    extends _$PaymentGatewayCopyWithImpl<$Res, _$PaymentGatewayImpl>
    implements _$$PaymentGatewayImplCopyWith<$Res> {
  __$$PaymentGatewayImplCopyWithImpl(
      _$PaymentGatewayImpl _value, $Res Function(_$PaymentGatewayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? logoUrl = null,
    Object? isEnabled = null,
    Object? sortOrder = null,
  }) {
    return _then(_$PaymentGatewayImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentGatewayImpl implements _PaymentGateway {
  const _$PaymentGatewayImpl(
      {required this.id,
      required this.name,
      required this.code,
      required this.logoUrl,
      this.isEnabled = true,
      this.sortOrder = 0});

  factory _$PaymentGatewayImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentGatewayImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
// 'bKash' | 'SSLCommerz' | 'Nagad'
  @override
  final String code;
// 'BKASH' | 'SSLCOMMERZ'
  @override
  final String logoUrl;
  @override
  @JsonKey()
  final bool isEnabled;
  @override
  @JsonKey()
  final int sortOrder;

  @override
  String toString() {
    return 'PaymentGateway(id: $id, name: $name, code: $code, logoUrl: $logoUrl, isEnabled: $isEnabled, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentGatewayImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, code, logoUrl, isEnabled, sortOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentGatewayImplCopyWith<_$PaymentGatewayImpl> get copyWith =>
      __$$PaymentGatewayImplCopyWithImpl<_$PaymentGatewayImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentGatewayImplToJson(
      this,
    );
  }
}

abstract class _PaymentGateway implements PaymentGateway {
  const factory _PaymentGateway(
      {required final String id,
      required final String name,
      required final String code,
      required final String logoUrl,
      final bool isEnabled,
      final int sortOrder}) = _$PaymentGatewayImpl;

  factory _PaymentGateway.fromJson(Map<String, dynamic> json) =
      _$PaymentGatewayImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override // 'bKash' | 'SSLCommerz' | 'Nagad'
  String get code;
  @override // 'BKASH' | 'SSLCOMMERZ'
  String get logoUrl;
  @override
  bool get isEnabled;
  @override
  int get sortOrder;
  @override
  @JsonKey(ignore: true)
  _$$PaymentGatewayImplCopyWith<_$PaymentGatewayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
mixin _$Payment {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get subscriptionId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get gateway =>
      throw _privateConstructorUsedError; // 'BKASH' | 'SSLCOMMERZ'
  String get status =>
      throw _privateConstructorUsedError; // 'PENDING' | 'SUCCESS' | 'FAILED' | 'CANCELLED'
  String? get paymentUrl =>
      throw _privateConstructorUsedError; // WebView URL (sensitive — stripped before Crashlytics)
  String? get transactionId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res, Payment>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String subscriptionId,
      double amount,
      String currency,
      String gateway,
      String status,
      String? paymentUrl,
      String? transactionId,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res, $Val extends Payment>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? subscriptionId = null,
    Object? amount = null,
    Object? currency = null,
    Object? gateway = null,
    Object? status = null,
    Object? paymentUrl = freezed,
    Object? transactionId = freezed,
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
      subscriptionId: null == subscriptionId
          ? _value.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      gateway: null == gateway
          ? _value.gateway
          : gateway // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentUrl: freezed == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PaymentImplCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$$PaymentImplCopyWith(
          _$PaymentImpl value, $Res Function(_$PaymentImpl) then) =
      __$$PaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String subscriptionId,
      double amount,
      String currency,
      String gateway,
      String status,
      String? paymentUrl,
      String? transactionId,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$PaymentImplCopyWithImpl<$Res>
    extends _$PaymentCopyWithImpl<$Res, _$PaymentImpl>
    implements _$$PaymentImplCopyWith<$Res> {
  __$$PaymentImplCopyWithImpl(
      _$PaymentImpl _value, $Res Function(_$PaymentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? subscriptionId = null,
    Object? amount = null,
    Object? currency = null,
    Object? gateway = null,
    Object? status = null,
    Object? paymentUrl = freezed,
    Object? transactionId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PaymentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionId: null == subscriptionId
          ? _value.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      gateway: null == gateway
          ? _value.gateway
          : gateway // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentUrl: freezed == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
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
class _$PaymentImpl implements _Payment {
  const _$PaymentImpl(
      {required this.id,
      required this.userId,
      required this.subscriptionId,
      required this.amount,
      required this.currency,
      required this.gateway,
      required this.status,
      this.paymentUrl,
      this.transactionId,
      required this.createdAt,
      required this.updatedAt});

  factory _$PaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String subscriptionId;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final String gateway;
// 'BKASH' | 'SSLCOMMERZ'
  @override
  final String status;
// 'PENDING' | 'SUCCESS' | 'FAILED' | 'CANCELLED'
  @override
  final String? paymentUrl;
// WebView URL (sensitive — stripped before Crashlytics)
  @override
  final String? transactionId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Payment(id: $id, userId: $userId, subscriptionId: $subscriptionId, amount: $amount, currency: $currency, gateway: $gateway, status: $status, paymentUrl: $paymentUrl, transactionId: $transactionId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.gateway, gateway) || other.gateway == gateway) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentUrl, paymentUrl) ||
                other.paymentUrl == paymentUrl) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
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
      userId,
      subscriptionId,
      amount,
      currency,
      gateway,
      status,
      paymentUrl,
      transactionId,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      __$$PaymentImplCopyWithImpl<_$PaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentImplToJson(
      this,
    );
  }
}

abstract class _Payment implements Payment {
  const factory _Payment(
      {required final String id,
      required final String userId,
      required final String subscriptionId,
      required final double amount,
      required final String currency,
      required final String gateway,
      required final String status,
      final String? paymentUrl,
      final String? transactionId,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$PaymentImpl;

  factory _Payment.fromJson(Map<String, dynamic> json) = _$PaymentImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get subscriptionId;
  @override
  double get amount;
  @override
  String get currency;
  @override
  String get gateway;
  @override // 'BKASH' | 'SSLCOMMERZ'
  String get status;
  @override // 'PENDING' | 'SUCCESS' | 'FAILED' | 'CANCELLED'
  String? get paymentUrl;
  @override // WebView URL (sensitive — stripped before Crashlytics)
  String? get transactionId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
