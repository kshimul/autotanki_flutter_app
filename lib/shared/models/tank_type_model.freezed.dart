// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tank_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TankTypesResponse _$TankTypesResponseFromJson(Map<String, dynamic> json) {
  return _TankTypesResponse.fromJson(json);
}

/// @nodoc
mixin _$TankTypesResponse {
  bool get success => throw _privateConstructorUsedError;
  TankTypesData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TankTypesResponseCopyWith<TankTypesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TankTypesResponseCopyWith<$Res> {
  factory $TankTypesResponseCopyWith(
          TankTypesResponse value, $Res Function(TankTypesResponse) then) =
      _$TankTypesResponseCopyWithImpl<$Res, TankTypesResponse>;
  @useResult
  $Res call({bool success, TankTypesData data});

  $TankTypesDataCopyWith<$Res> get data;
}

/// @nodoc
class _$TankTypesResponseCopyWithImpl<$Res, $Val extends TankTypesResponse>
    implements $TankTypesResponseCopyWith<$Res> {
  _$TankTypesResponseCopyWithImpl(this._value, this._then);

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
              as TankTypesData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TankTypesDataCopyWith<$Res> get data {
    return $TankTypesDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TankTypesResponseImplCopyWith<$Res>
    implements $TankTypesResponseCopyWith<$Res> {
  factory _$$TankTypesResponseImplCopyWith(_$TankTypesResponseImpl value,
          $Res Function(_$TankTypesResponseImpl) then) =
      __$$TankTypesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, TankTypesData data});

  @override
  $TankTypesDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$TankTypesResponseImplCopyWithImpl<$Res>
    extends _$TankTypesResponseCopyWithImpl<$Res, _$TankTypesResponseImpl>
    implements _$$TankTypesResponseImplCopyWith<$Res> {
  __$$TankTypesResponseImplCopyWithImpl(_$TankTypesResponseImpl _value,
      $Res Function(_$TankTypesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$TankTypesResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TankTypesData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TankTypesResponseImpl implements _TankTypesResponse {
  const _$TankTypesResponseImpl({this.success = false, required this.data});

  factory _$TankTypesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TankTypesResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  final TankTypesData data;

  @override
  String toString() {
    return 'TankTypesResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TankTypesResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TankTypesResponseImplCopyWith<_$TankTypesResponseImpl> get copyWith =>
      __$$TankTypesResponseImplCopyWithImpl<_$TankTypesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TankTypesResponseImplToJson(
      this,
    );
  }
}

abstract class _TankTypesResponse implements TankTypesResponse {
  const factory _TankTypesResponse(
      {final bool success,
      required final TankTypesData data}) = _$TankTypesResponseImpl;

  factory _TankTypesResponse.fromJson(Map<String, dynamic> json) =
      _$TankTypesResponseImpl.fromJson;

  @override
  bool get success;
  @override
  TankTypesData get data;
  @override
  @JsonKey(ignore: true)
  _$$TankTypesResponseImplCopyWith<_$TankTypesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TankTypesData _$TankTypesDataFromJson(Map<String, dynamic> json) {
  return _TankTypesData.fromJson(json);
}

/// @nodoc
mixin _$TankTypesData {
  List<TankType> get tankTypes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TankTypesDataCopyWith<TankTypesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TankTypesDataCopyWith<$Res> {
  factory $TankTypesDataCopyWith(
          TankTypesData value, $Res Function(TankTypesData) then) =
      _$TankTypesDataCopyWithImpl<$Res, TankTypesData>;
  @useResult
  $Res call({List<TankType> tankTypes});
}

/// @nodoc
class _$TankTypesDataCopyWithImpl<$Res, $Val extends TankTypesData>
    implements $TankTypesDataCopyWith<$Res> {
  _$TankTypesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tankTypes = null,
  }) {
    return _then(_value.copyWith(
      tankTypes: null == tankTypes
          ? _value.tankTypes
          : tankTypes // ignore: cast_nullable_to_non_nullable
              as List<TankType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TankTypesDataImplCopyWith<$Res>
    implements $TankTypesDataCopyWith<$Res> {
  factory _$$TankTypesDataImplCopyWith(
          _$TankTypesDataImpl value, $Res Function(_$TankTypesDataImpl) then) =
      __$$TankTypesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TankType> tankTypes});
}

/// @nodoc
class __$$TankTypesDataImplCopyWithImpl<$Res>
    extends _$TankTypesDataCopyWithImpl<$Res, _$TankTypesDataImpl>
    implements _$$TankTypesDataImplCopyWith<$Res> {
  __$$TankTypesDataImplCopyWithImpl(
      _$TankTypesDataImpl _value, $Res Function(_$TankTypesDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tankTypes = null,
  }) {
    return _then(_$TankTypesDataImpl(
      tankTypes: null == tankTypes
          ? _value._tankTypes
          : tankTypes // ignore: cast_nullable_to_non_nullable
              as List<TankType>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TankTypesDataImpl implements _TankTypesData {
  const _$TankTypesDataImpl({final List<TankType> tankTypes = const []})
      : _tankTypes = tankTypes;

  factory _$TankTypesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TankTypesDataImplFromJson(json);

  final List<TankType> _tankTypes;
  @override
  @JsonKey()
  List<TankType> get tankTypes {
    if (_tankTypes is EqualUnmodifiableListView) return _tankTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tankTypes);
  }

  @override
  String toString() {
    return 'TankTypesData(tankTypes: $tankTypes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TankTypesDataImpl &&
            const DeepCollectionEquality()
                .equals(other._tankTypes, _tankTypes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tankTypes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TankTypesDataImplCopyWith<_$TankTypesDataImpl> get copyWith =>
      __$$TankTypesDataImplCopyWithImpl<_$TankTypesDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TankTypesDataImplToJson(
      this,
    );
  }
}

abstract class _TankTypesData implements TankTypesData {
  const factory _TankTypesData({final List<TankType> tankTypes}) =
      _$TankTypesDataImpl;

  factory _TankTypesData.fromJson(Map<String, dynamic> json) =
      _$TankTypesDataImpl.fromJson;

  @override
  List<TankType> get tankTypes;
  @override
  @JsonKey(ignore: true)
  _$$TankTypesDataImplCopyWith<_$TankTypesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TankType _$TankTypeFromJson(Map<String, dynamic> json) {
  return _TankType.fromJson(json);
}

/// @nodoc
mixin _$TankType {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get shape => throw _privateConstructorUsedError;
  List<TankSize> get predefSizes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TankTypeCopyWith<TankType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TankTypeCopyWith<$Res> {
  factory $TankTypeCopyWith(TankType value, $Res Function(TankType) then) =
      _$TankTypeCopyWithImpl<$Res, TankType>;
  @useResult
  $Res call({String id, String name, String shape, List<TankSize> predefSizes});
}

/// @nodoc
class _$TankTypeCopyWithImpl<$Res, $Val extends TankType>
    implements $TankTypeCopyWith<$Res> {
  _$TankTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shape = null,
    Object? predefSizes = null,
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
      shape: null == shape
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as String,
      predefSizes: null == predefSizes
          ? _value.predefSizes
          : predefSizes // ignore: cast_nullable_to_non_nullable
              as List<TankSize>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TankTypeImplCopyWith<$Res>
    implements $TankTypeCopyWith<$Res> {
  factory _$$TankTypeImplCopyWith(
          _$TankTypeImpl value, $Res Function(_$TankTypeImpl) then) =
      __$$TankTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String shape, List<TankSize> predefSizes});
}

/// @nodoc
class __$$TankTypeImplCopyWithImpl<$Res>
    extends _$TankTypeCopyWithImpl<$Res, _$TankTypeImpl>
    implements _$$TankTypeImplCopyWith<$Res> {
  __$$TankTypeImplCopyWithImpl(
      _$TankTypeImpl _value, $Res Function(_$TankTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shape = null,
    Object? predefSizes = null,
  }) {
    return _then(_$TankTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shape: null == shape
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as String,
      predefSizes: null == predefSizes
          ? _value._predefSizes
          : predefSizes // ignore: cast_nullable_to_non_nullable
              as List<TankSize>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TankTypeImpl implements _TankType {
  const _$TankTypeImpl(
      {required this.id,
      required this.name,
      required this.shape,
      final List<TankSize> predefSizes = const []})
      : _predefSizes = predefSizes;

  factory _$TankTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TankTypeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String shape;
  final List<TankSize> _predefSizes;
  @override
  @JsonKey()
  List<TankSize> get predefSizes {
    if (_predefSizes is EqualUnmodifiableListView) return _predefSizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_predefSizes);
  }

  @override
  String toString() {
    return 'TankType(id: $id, name: $name, shape: $shape, predefSizes: $predefSizes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TankTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shape, shape) || other.shape == shape) &&
            const DeepCollectionEquality()
                .equals(other._predefSizes, _predefSizes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, shape,
      const DeepCollectionEquality().hash(_predefSizes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TankTypeImplCopyWith<_$TankTypeImpl> get copyWith =>
      __$$TankTypeImplCopyWithImpl<_$TankTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TankTypeImplToJson(
      this,
    );
  }
}

abstract class _TankType implements TankType {
  const factory _TankType(
      {required final String id,
      required final String name,
      required final String shape,
      final List<TankSize> predefSizes}) = _$TankTypeImpl;

  factory _TankType.fromJson(Map<String, dynamic> json) =
      _$TankTypeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get shape;
  @override
  List<TankSize> get predefSizes;
  @override
  @JsonKey(ignore: true)
  _$$TankTypeImplCopyWith<_$TankTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TankSize _$TankSizeFromJson(Map<String, dynamic> json) {
  return _TankSize.fromJson(json);
}

/// @nodoc
mixin _$TankSize {
  String get id => throw _privateConstructorUsedError;
  String get tankTypeId => throw _privateConstructorUsedError;
  int get capacityLiter => throw _privateConstructorUsedError;
  int get diameterMm => throw _privateConstructorUsedError;
  int get heightMm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TankSizeCopyWith<TankSize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TankSizeCopyWith<$Res> {
  factory $TankSizeCopyWith(TankSize value, $Res Function(TankSize) then) =
      _$TankSizeCopyWithImpl<$Res, TankSize>;
  @useResult
  $Res call(
      {String id,
      String tankTypeId,
      int capacityLiter,
      int diameterMm,
      int heightMm});
}

/// @nodoc
class _$TankSizeCopyWithImpl<$Res, $Val extends TankSize>
    implements $TankSizeCopyWith<$Res> {
  _$TankSizeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tankTypeId = null,
    Object? capacityLiter = null,
    Object? diameterMm = null,
    Object? heightMm = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tankTypeId: null == tankTypeId
          ? _value.tankTypeId
          : tankTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      capacityLiter: null == capacityLiter
          ? _value.capacityLiter
          : capacityLiter // ignore: cast_nullable_to_non_nullable
              as int,
      diameterMm: null == diameterMm
          ? _value.diameterMm
          : diameterMm // ignore: cast_nullable_to_non_nullable
              as int,
      heightMm: null == heightMm
          ? _value.heightMm
          : heightMm // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TankSizeImplCopyWith<$Res>
    implements $TankSizeCopyWith<$Res> {
  factory _$$TankSizeImplCopyWith(
          _$TankSizeImpl value, $Res Function(_$TankSizeImpl) then) =
      __$$TankSizeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String tankTypeId,
      int capacityLiter,
      int diameterMm,
      int heightMm});
}

/// @nodoc
class __$$TankSizeImplCopyWithImpl<$Res>
    extends _$TankSizeCopyWithImpl<$Res, _$TankSizeImpl>
    implements _$$TankSizeImplCopyWith<$Res> {
  __$$TankSizeImplCopyWithImpl(
      _$TankSizeImpl _value, $Res Function(_$TankSizeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tankTypeId = null,
    Object? capacityLiter = null,
    Object? diameterMm = null,
    Object? heightMm = null,
  }) {
    return _then(_$TankSizeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tankTypeId: null == tankTypeId
          ? _value.tankTypeId
          : tankTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      capacityLiter: null == capacityLiter
          ? _value.capacityLiter
          : capacityLiter // ignore: cast_nullable_to_non_nullable
              as int,
      diameterMm: null == diameterMm
          ? _value.diameterMm
          : diameterMm // ignore: cast_nullable_to_non_nullable
              as int,
      heightMm: null == heightMm
          ? _value.heightMm
          : heightMm // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TankSizeImpl implements _TankSize {
  const _$TankSizeImpl(
      {required this.id,
      required this.tankTypeId,
      required this.capacityLiter,
      required this.diameterMm,
      required this.heightMm});

  factory _$TankSizeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TankSizeImplFromJson(json);

  @override
  final String id;
  @override
  final String tankTypeId;
  @override
  final int capacityLiter;
  @override
  final int diameterMm;
  @override
  final int heightMm;

  @override
  String toString() {
    return 'TankSize(id: $id, tankTypeId: $tankTypeId, capacityLiter: $capacityLiter, diameterMm: $diameterMm, heightMm: $heightMm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TankSizeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tankTypeId, tankTypeId) ||
                other.tankTypeId == tankTypeId) &&
            (identical(other.capacityLiter, capacityLiter) ||
                other.capacityLiter == capacityLiter) &&
            (identical(other.diameterMm, diameterMm) ||
                other.diameterMm == diameterMm) &&
            (identical(other.heightMm, heightMm) ||
                other.heightMm == heightMm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, tankTypeId, capacityLiter, diameterMm, heightMm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TankSizeImplCopyWith<_$TankSizeImpl> get copyWith =>
      __$$TankSizeImplCopyWithImpl<_$TankSizeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TankSizeImplToJson(
      this,
    );
  }
}

abstract class _TankSize implements TankSize {
  const factory _TankSize(
      {required final String id,
      required final String tankTypeId,
      required final int capacityLiter,
      required final int diameterMm,
      required final int heightMm}) = _$TankSizeImpl;

  factory _TankSize.fromJson(Map<String, dynamic> json) =
      _$TankSizeImpl.fromJson;

  @override
  String get id;
  @override
  String get tankTypeId;
  @override
  int get capacityLiter;
  @override
  int get diameterMm;
  @override
  int get heightMm;
  @override
  @JsonKey(ignore: true)
  _$$TankSizeImplCopyWith<_$TankSizeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
