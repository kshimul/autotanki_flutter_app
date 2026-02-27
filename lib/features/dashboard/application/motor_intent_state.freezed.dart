// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'motor_intent_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MotorIntentState {
  String get motorId => throw _privateConstructorUsedError; // 'oht' | 'ugt'
  bool get isRunning => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String motorId, bool isRunning) idle,
    required TResult Function(
            String motorId, bool isRunning, String pendingAction)
        pending,
    required TResult Function(String motorId, bool isRunning) active,
    required TResult Function(String motorId, bool isRunning, String message)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String motorId, bool isRunning)? idle,
    TResult? Function(String motorId, bool isRunning, String pendingAction)?
        pending,
    TResult? Function(String motorId, bool isRunning)? active,
    TResult? Function(String motorId, bool isRunning, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String motorId, bool isRunning)? idle,
    TResult Function(String motorId, bool isRunning, String pendingAction)?
        pending,
    TResult Function(String motorId, bool isRunning)? active,
    TResult Function(String motorId, bool isRunning, String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MotorIdle value) idle,
    required TResult Function(_MotorPending value) pending,
    required TResult Function(_MotorActive value) active,
    required TResult Function(_MotorError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MotorIdle value)? idle,
    TResult? Function(_MotorPending value)? pending,
    TResult? Function(_MotorActive value)? active,
    TResult? Function(_MotorError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MotorIdle value)? idle,
    TResult Function(_MotorPending value)? pending,
    TResult Function(_MotorActive value)? active,
    TResult Function(_MotorError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MotorIntentStateCopyWith<MotorIntentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotorIntentStateCopyWith<$Res> {
  factory $MotorIntentStateCopyWith(
          MotorIntentState value, $Res Function(MotorIntentState) then) =
      _$MotorIntentStateCopyWithImpl<$Res, MotorIntentState>;
  @useResult
  $Res call({String motorId, bool isRunning});
}

/// @nodoc
class _$MotorIntentStateCopyWithImpl<$Res, $Val extends MotorIntentState>
    implements $MotorIntentStateCopyWith<$Res> {
  _$MotorIntentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? motorId = null,
    Object? isRunning = null,
  }) {
    return _then(_value.copyWith(
      motorId: null == motorId
          ? _value.motorId
          : motorId // ignore: cast_nullable_to_non_nullable
              as String,
      isRunning: null == isRunning
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MotorIdleImplCopyWith<$Res>
    implements $MotorIntentStateCopyWith<$Res> {
  factory _$$MotorIdleImplCopyWith(
          _$MotorIdleImpl value, $Res Function(_$MotorIdleImpl) then) =
      __$$MotorIdleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String motorId, bool isRunning});
}

/// @nodoc
class __$$MotorIdleImplCopyWithImpl<$Res>
    extends _$MotorIntentStateCopyWithImpl<$Res, _$MotorIdleImpl>
    implements _$$MotorIdleImplCopyWith<$Res> {
  __$$MotorIdleImplCopyWithImpl(
      _$MotorIdleImpl _value, $Res Function(_$MotorIdleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? motorId = null,
    Object? isRunning = null,
  }) {
    return _then(_$MotorIdleImpl(
      motorId: null == motorId
          ? _value.motorId
          : motorId // ignore: cast_nullable_to_non_nullable
              as String,
      isRunning: null == isRunning
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MotorIdleImpl implements _MotorIdle {
  const _$MotorIdleImpl({required this.motorId, required this.isRunning});

  @override
  final String motorId;
// 'oht' | 'ugt'
  @override
  final bool isRunning;

  @override
  String toString() {
    return 'MotorIntentState.idle(motorId: $motorId, isRunning: $isRunning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MotorIdleImpl &&
            (identical(other.motorId, motorId) || other.motorId == motorId) &&
            (identical(other.isRunning, isRunning) ||
                other.isRunning == isRunning));
  }

  @override
  int get hashCode => Object.hash(runtimeType, motorId, isRunning);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MotorIdleImplCopyWith<_$MotorIdleImpl> get copyWith =>
      __$$MotorIdleImplCopyWithImpl<_$MotorIdleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String motorId, bool isRunning) idle,
    required TResult Function(
            String motorId, bool isRunning, String pendingAction)
        pending,
    required TResult Function(String motorId, bool isRunning) active,
    required TResult Function(String motorId, bool isRunning, String message)
        error,
  }) {
    return idle(motorId, isRunning);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String motorId, bool isRunning)? idle,
    TResult? Function(String motorId, bool isRunning, String pendingAction)?
        pending,
    TResult? Function(String motorId, bool isRunning)? active,
    TResult? Function(String motorId, bool isRunning, String message)? error,
  }) {
    return idle?.call(motorId, isRunning);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String motorId, bool isRunning)? idle,
    TResult Function(String motorId, bool isRunning, String pendingAction)?
        pending,
    TResult Function(String motorId, bool isRunning)? active,
    TResult Function(String motorId, bool isRunning, String message)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(motorId, isRunning);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MotorIdle value) idle,
    required TResult Function(_MotorPending value) pending,
    required TResult Function(_MotorActive value) active,
    required TResult Function(_MotorError value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MotorIdle value)? idle,
    TResult? Function(_MotorPending value)? pending,
    TResult? Function(_MotorActive value)? active,
    TResult? Function(_MotorError value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MotorIdle value)? idle,
    TResult Function(_MotorPending value)? pending,
    TResult Function(_MotorActive value)? active,
    TResult Function(_MotorError value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _MotorIdle implements MotorIntentState {
  const factory _MotorIdle(
      {required final String motorId,
      required final bool isRunning}) = _$MotorIdleImpl;

  @override
  String get motorId;
  @override // 'oht' | 'ugt'
  bool get isRunning;
  @override
  @JsonKey(ignore: true)
  _$$MotorIdleImplCopyWith<_$MotorIdleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MotorPendingImplCopyWith<$Res>
    implements $MotorIntentStateCopyWith<$Res> {
  factory _$$MotorPendingImplCopyWith(
          _$MotorPendingImpl value, $Res Function(_$MotorPendingImpl) then) =
      __$$MotorPendingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String motorId, bool isRunning, String pendingAction});
}

/// @nodoc
class __$$MotorPendingImplCopyWithImpl<$Res>
    extends _$MotorIntentStateCopyWithImpl<$Res, _$MotorPendingImpl>
    implements _$$MotorPendingImplCopyWith<$Res> {
  __$$MotorPendingImplCopyWithImpl(
      _$MotorPendingImpl _value, $Res Function(_$MotorPendingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? motorId = null,
    Object? isRunning = null,
    Object? pendingAction = null,
  }) {
    return _then(_$MotorPendingImpl(
      motorId: null == motorId
          ? _value.motorId
          : motorId // ignore: cast_nullable_to_non_nullable
              as String,
      isRunning: null == isRunning
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      pendingAction: null == pendingAction
          ? _value.pendingAction
          : pendingAction // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MotorPendingImpl implements _MotorPending {
  const _$MotorPendingImpl(
      {required this.motorId,
      required this.isRunning,
      required this.pendingAction});

  @override
  final String motorId;
  @override
  final bool isRunning;
// current state (what we're switching away from)
  @override
  final String pendingAction;

  @override
  String toString() {
    return 'MotorIntentState.pending(motorId: $motorId, isRunning: $isRunning, pendingAction: $pendingAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MotorPendingImpl &&
            (identical(other.motorId, motorId) || other.motorId == motorId) &&
            (identical(other.isRunning, isRunning) ||
                other.isRunning == isRunning) &&
            (identical(other.pendingAction, pendingAction) ||
                other.pendingAction == pendingAction));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, motorId, isRunning, pendingAction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MotorPendingImplCopyWith<_$MotorPendingImpl> get copyWith =>
      __$$MotorPendingImplCopyWithImpl<_$MotorPendingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String motorId, bool isRunning) idle,
    required TResult Function(
            String motorId, bool isRunning, String pendingAction)
        pending,
    required TResult Function(String motorId, bool isRunning) active,
    required TResult Function(String motorId, bool isRunning, String message)
        error,
  }) {
    return pending(motorId, isRunning, pendingAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String motorId, bool isRunning)? idle,
    TResult? Function(String motorId, bool isRunning, String pendingAction)?
        pending,
    TResult? Function(String motorId, bool isRunning)? active,
    TResult? Function(String motorId, bool isRunning, String message)? error,
  }) {
    return pending?.call(motorId, isRunning, pendingAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String motorId, bool isRunning)? idle,
    TResult Function(String motorId, bool isRunning, String pendingAction)?
        pending,
    TResult Function(String motorId, bool isRunning)? active,
    TResult Function(String motorId, bool isRunning, String message)? error,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(motorId, isRunning, pendingAction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MotorIdle value) idle,
    required TResult Function(_MotorPending value) pending,
    required TResult Function(_MotorActive value) active,
    required TResult Function(_MotorError value) error,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MotorIdle value)? idle,
    TResult? Function(_MotorPending value)? pending,
    TResult? Function(_MotorActive value)? active,
    TResult? Function(_MotorError value)? error,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MotorIdle value)? idle,
    TResult Function(_MotorPending value)? pending,
    TResult Function(_MotorActive value)? active,
    TResult Function(_MotorError value)? error,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class _MotorPending implements MotorIntentState {
  const factory _MotorPending(
      {required final String motorId,
      required final bool isRunning,
      required final String pendingAction}) = _$MotorPendingImpl;

  @override
  String get motorId;
  @override
  bool get isRunning; // current state (what we're switching away from)
  String get pendingAction;
  @override
  @JsonKey(ignore: true)
  _$$MotorPendingImplCopyWith<_$MotorPendingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MotorActiveImplCopyWith<$Res>
    implements $MotorIntentStateCopyWith<$Res> {
  factory _$$MotorActiveImplCopyWith(
          _$MotorActiveImpl value, $Res Function(_$MotorActiveImpl) then) =
      __$$MotorActiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String motorId, bool isRunning});
}

/// @nodoc
class __$$MotorActiveImplCopyWithImpl<$Res>
    extends _$MotorIntentStateCopyWithImpl<$Res, _$MotorActiveImpl>
    implements _$$MotorActiveImplCopyWith<$Res> {
  __$$MotorActiveImplCopyWithImpl(
      _$MotorActiveImpl _value, $Res Function(_$MotorActiveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? motorId = null,
    Object? isRunning = null,
  }) {
    return _then(_$MotorActiveImpl(
      motorId: null == motorId
          ? _value.motorId
          : motorId // ignore: cast_nullable_to_non_nullable
              as String,
      isRunning: null == isRunning
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MotorActiveImpl implements _MotorActive {
  const _$MotorActiveImpl({required this.motorId, required this.isRunning});

  @override
  final String motorId;
  @override
  final bool isRunning;

  @override
  String toString() {
    return 'MotorIntentState.active(motorId: $motorId, isRunning: $isRunning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MotorActiveImpl &&
            (identical(other.motorId, motorId) || other.motorId == motorId) &&
            (identical(other.isRunning, isRunning) ||
                other.isRunning == isRunning));
  }

  @override
  int get hashCode => Object.hash(runtimeType, motorId, isRunning);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MotorActiveImplCopyWith<_$MotorActiveImpl> get copyWith =>
      __$$MotorActiveImplCopyWithImpl<_$MotorActiveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String motorId, bool isRunning) idle,
    required TResult Function(
            String motorId, bool isRunning, String pendingAction)
        pending,
    required TResult Function(String motorId, bool isRunning) active,
    required TResult Function(String motorId, bool isRunning, String message)
        error,
  }) {
    return active(motorId, isRunning);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String motorId, bool isRunning)? idle,
    TResult? Function(String motorId, bool isRunning, String pendingAction)?
        pending,
    TResult? Function(String motorId, bool isRunning)? active,
    TResult? Function(String motorId, bool isRunning, String message)? error,
  }) {
    return active?.call(motorId, isRunning);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String motorId, bool isRunning)? idle,
    TResult Function(String motorId, bool isRunning, String pendingAction)?
        pending,
    TResult Function(String motorId, bool isRunning)? active,
    TResult Function(String motorId, bool isRunning, String message)? error,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(motorId, isRunning);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MotorIdle value) idle,
    required TResult Function(_MotorPending value) pending,
    required TResult Function(_MotorActive value) active,
    required TResult Function(_MotorError value) error,
  }) {
    return active(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MotorIdle value)? idle,
    TResult? Function(_MotorPending value)? pending,
    TResult? Function(_MotorActive value)? active,
    TResult? Function(_MotorError value)? error,
  }) {
    return active?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MotorIdle value)? idle,
    TResult Function(_MotorPending value)? pending,
    TResult Function(_MotorActive value)? active,
    TResult Function(_MotorError value)? error,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(this);
    }
    return orElse();
  }
}

abstract class _MotorActive implements MotorIntentState {
  const factory _MotorActive(
      {required final String motorId,
      required final bool isRunning}) = _$MotorActiveImpl;

  @override
  String get motorId;
  @override
  bool get isRunning;
  @override
  @JsonKey(ignore: true)
  _$$MotorActiveImplCopyWith<_$MotorActiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MotorErrorImplCopyWith<$Res>
    implements $MotorIntentStateCopyWith<$Res> {
  factory _$$MotorErrorImplCopyWith(
          _$MotorErrorImpl value, $Res Function(_$MotorErrorImpl) then) =
      __$$MotorErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String motorId, bool isRunning, String message});
}

/// @nodoc
class __$$MotorErrorImplCopyWithImpl<$Res>
    extends _$MotorIntentStateCopyWithImpl<$Res, _$MotorErrorImpl>
    implements _$$MotorErrorImplCopyWith<$Res> {
  __$$MotorErrorImplCopyWithImpl(
      _$MotorErrorImpl _value, $Res Function(_$MotorErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? motorId = null,
    Object? isRunning = null,
    Object? message = null,
  }) {
    return _then(_$MotorErrorImpl(
      motorId: null == motorId
          ? _value.motorId
          : motorId // ignore: cast_nullable_to_non_nullable
              as String,
      isRunning: null == isRunning
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MotorErrorImpl implements _MotorError {
  const _$MotorErrorImpl(
      {required this.motorId, required this.isRunning, required this.message});

  @override
  final String motorId;
  @override
  final bool isRunning;
// rolled back to previous state
  @override
  final String message;

  @override
  String toString() {
    return 'MotorIntentState.error(motorId: $motorId, isRunning: $isRunning, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MotorErrorImpl &&
            (identical(other.motorId, motorId) || other.motorId == motorId) &&
            (identical(other.isRunning, isRunning) ||
                other.isRunning == isRunning) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, motorId, isRunning, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MotorErrorImplCopyWith<_$MotorErrorImpl> get copyWith =>
      __$$MotorErrorImplCopyWithImpl<_$MotorErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String motorId, bool isRunning) idle,
    required TResult Function(
            String motorId, bool isRunning, String pendingAction)
        pending,
    required TResult Function(String motorId, bool isRunning) active,
    required TResult Function(String motorId, bool isRunning, String message)
        error,
  }) {
    return error(motorId, isRunning, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String motorId, bool isRunning)? idle,
    TResult? Function(String motorId, bool isRunning, String pendingAction)?
        pending,
    TResult? Function(String motorId, bool isRunning)? active,
    TResult? Function(String motorId, bool isRunning, String message)? error,
  }) {
    return error?.call(motorId, isRunning, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String motorId, bool isRunning)? idle,
    TResult Function(String motorId, bool isRunning, String pendingAction)?
        pending,
    TResult Function(String motorId, bool isRunning)? active,
    TResult Function(String motorId, bool isRunning, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(motorId, isRunning, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MotorIdle value) idle,
    required TResult Function(_MotorPending value) pending,
    required TResult Function(_MotorActive value) active,
    required TResult Function(_MotorError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MotorIdle value)? idle,
    TResult? Function(_MotorPending value)? pending,
    TResult? Function(_MotorActive value)? active,
    TResult? Function(_MotorError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MotorIdle value)? idle,
    TResult Function(_MotorPending value)? pending,
    TResult Function(_MotorActive value)? active,
    TResult Function(_MotorError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _MotorError implements MotorIntentState {
  const factory _MotorError(
      {required final String motorId,
      required final bool isRunning,
      required final String message}) = _$MotorErrorImpl;

  @override
  String get motorId;
  @override
  bool get isRunning; // rolled back to previous state
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$MotorErrorImplCopyWith<_$MotorErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
