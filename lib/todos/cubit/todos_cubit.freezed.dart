// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todos_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodosState {
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  List<Todo>? get todos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodosStateCopyWith<TodosState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodosStateCopyWith<$Res> {
  factory $TodosStateCopyWith(
          TodosState value, $Res Function(TodosState) then) =
      _$TodosStateCopyWithImpl<$Res, TodosState>;
  @useResult
  $Res call({bool loading, bool error, List<Todo>? todos});
}

/// @nodoc
class _$TodosStateCopyWithImpl<$Res, $Val extends TodosState>
    implements $TodosStateCopyWith<$Res> {
  _$TodosStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? todos = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      todos: freezed == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodosStateImplCopyWith<$Res>
    implements $TodosStateCopyWith<$Res> {
  factory _$$TodosStateImplCopyWith(
          _$TodosStateImpl value, $Res Function(_$TodosStateImpl) then) =
      __$$TodosStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, bool error, List<Todo>? todos});
}

/// @nodoc
class __$$TodosStateImplCopyWithImpl<$Res>
    extends _$TodosStateCopyWithImpl<$Res, _$TodosStateImpl>
    implements _$$TodosStateImplCopyWith<$Res> {
  __$$TodosStateImplCopyWithImpl(
      _$TodosStateImpl _value, $Res Function(_$TodosStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? todos = freezed,
  }) {
    return _then(_$TodosStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      todos: freezed == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>?,
    ));
  }
}

/// @nodoc

class _$TodosStateImpl implements _TodosState {
  const _$TodosStateImpl(
      {required this.loading, required this.error, final List<Todo>? todos})
      : _todos = todos;

  @override
  final bool loading;
  @override
  final bool error;
  final List<Todo>? _todos;
  @override
  List<Todo>? get todos {
    final value = _todos;
    if (value == null) return null;
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TodosState(loading: $loading, error: $error, todos: $todos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodosStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._todos, _todos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, error, const DeepCollectionEquality().hash(_todos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodosStateImplCopyWith<_$TodosStateImpl> get copyWith =>
      __$$TodosStateImplCopyWithImpl<_$TodosStateImpl>(this, _$identity);
}

abstract class _TodosState implements TodosState {
  const factory _TodosState(
      {required final bool loading,
      required final bool error,
      final List<Todo>? todos}) = _$TodosStateImpl;

  @override
  bool get loading;
  @override
  bool get error;
  @override
  List<Todo>? get todos;
  @override
  @JsonKey(ignore: true)
  _$$TodosStateImplCopyWith<_$TodosStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
