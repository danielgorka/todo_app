import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/todos/domain/i_todos_repository.dart';
import 'package:todo_app/todos/domain/models/todo.dart';
import 'package:todo_app/todos/domain/values/todo_completed.dart';

part 'todos_cubit.freezed.dart';
part 'todos_state.dart';

@injectable
class TodosCubit extends Cubit<TodosState> {
  TodosCubit({
    required this.todosRepository,
  }) : super(TodosState.initial());

  final ITodosRepository todosRepository;

  Future<void> init() async {
    emit(TodosState.initial());

    final either = await todosRepository.getTodos();

    emit(
      state.copyWith(
        loading: false,
        error: either.isLeft,
        todos: either.fold(
          (l) => null,
          (r) => r,
        ),
      ),
    );
  }

  Future<void> toggle(Todo todo) async {
    final updatedTodo = todo.copyWith(
      completed: TodoCompleted(!todo.completed.value),
    );
    final todos = state.todos!;
    final updatedTodos =
        todos.map((todo) => todo.id == todo.id ? updatedTodo : todo).toList();

    // Update the state immediately
    emit(
      state.copyWith(
        todos: updatedTodos,
      ),
    );

    // Update item in the repository
    final either = await todosRepository.update(updatedTodo);

    if (either.isLeft) {
      // Revert the state if the update failed
      emit(
        state.copyWith(
          error: true,
          todos: todos,
        ),
      );
    }
  }
}
