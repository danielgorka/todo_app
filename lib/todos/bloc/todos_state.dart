part of 'todos_bloc.dart';

@freezed
class TodosState with _$TodosState {
  const factory TodosState({
    required bool loading,
    required bool error,
    List<Todo>? todos,
  }) = _TodosState;

  factory TodosState.initial() => const TodosState(
        loading: true,
        error: false,
      );
}
