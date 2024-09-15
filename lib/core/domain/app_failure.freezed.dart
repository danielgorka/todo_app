// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppFailureServerError value) serverError,
    required TResult Function(AppFailureUnknownError value) unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppFailureServerError value)? serverError,
    TResult? Function(AppFailureUnknownError value)? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppFailureServerError value)? serverError,
    TResult Function(AppFailureUnknownError value)? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFailureCopyWith<$Res> {
  factory $AppFailureCopyWith(
          AppFailure value, $Res Function(AppFailure) then) =
      _$AppFailureCopyWithImpl<$Res, AppFailure>;
}

/// @nodoc
class _$AppFailureCopyWithImpl<$Res, $Val extends AppFailure>
    implements $AppFailureCopyWith<$Res> {
  _$AppFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppFailureServerErrorImplCopyWith<$Res> {
  factory _$$AppFailureServerErrorImplCopyWith(
          _$AppFailureServerErrorImpl value,
          $Res Function(_$AppFailureServerErrorImpl) then) =
      __$$AppFailureServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppFailureServerErrorImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$AppFailureServerErrorImpl>
    implements _$$AppFailureServerErrorImplCopyWith<$Res> {
  __$$AppFailureServerErrorImplCopyWithImpl(_$AppFailureServerErrorImpl _value,
      $Res Function(_$AppFailureServerErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppFailureServerErrorImpl implements AppFailureServerError {
  const _$AppFailureServerErrorImpl();

  @override
  String toString() {
    return 'AppFailure.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppFailureServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() unknownError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? unknownError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppFailureServerError value) serverError,
    required TResult Function(AppFailureUnknownError value) unknownError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppFailureServerError value)? serverError,
    TResult? Function(AppFailureUnknownError value)? unknownError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppFailureServerError value)? serverError,
    TResult Function(AppFailureUnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class AppFailureServerError implements AppFailure {
  const factory AppFailureServerError() = _$AppFailureServerErrorImpl;
}

/// @nodoc
abstract class _$$AppFailureUnknownErrorImplCopyWith<$Res> {
  factory _$$AppFailureUnknownErrorImplCopyWith(
          _$AppFailureUnknownErrorImpl value,
          $Res Function(_$AppFailureUnknownErrorImpl) then) =
      __$$AppFailureUnknownErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppFailureUnknownErrorImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$AppFailureUnknownErrorImpl>
    implements _$$AppFailureUnknownErrorImplCopyWith<$Res> {
  __$$AppFailureUnknownErrorImplCopyWithImpl(
      _$AppFailureUnknownErrorImpl _value,
      $Res Function(_$AppFailureUnknownErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppFailureUnknownErrorImpl implements AppFailureUnknownError {
  const _$AppFailureUnknownErrorImpl();

  @override
  String toString() {
    return 'AppFailure.unknownError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppFailureUnknownErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() unknownError,
  }) {
    return unknownError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? unknownError,
  }) {
    return unknownError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppFailureServerError value) serverError,
    required TResult Function(AppFailureUnknownError value) unknownError,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppFailureServerError value)? serverError,
    TResult? Function(AppFailureUnknownError value)? unknownError,
  }) {
    return unknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppFailureServerError value)? serverError,
    TResult Function(AppFailureUnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }
}

abstract class AppFailureUnknownError implements AppFailure {
  const factory AppFailureUnknownError() = _$AppFailureUnknownErrorImpl;
}
