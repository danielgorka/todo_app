import 'package:injectable/injectable.dart';
import 'package:todo_app/core/data/catch_exceptions.dart';
import 'package:todo_app/core/domain/app_failure.dart';
import 'package:todo_app/core/domain/either.dart';
import 'package:todo_app/todos/data/todos_data_source.dart';
import 'package:todo_app/todos/domain/i_todos_repository.dart';
import 'package:todo_app/todos/domain/models/todo.dart';
import 'package:todo_app/todos/domain/values/todo_completed.dart';
import 'package:todo_app/todos/domain/values/todo_id.dart';
import 'package:todo_app/todos/domain/values/todo_name.dart';

@LazySingleton(as: ITodosRepository)
class TodosRepository extends ITodosRepository {
  TodosRepository({
    required this.todosDataSource,
  });

  final TodosDataSource todosDataSource;

  @override
  Future<Either<AppFailure, List<Todo>>> getTodos() =>
      catchExceptions(() async {
        final todosDto = await todosDataSource.getTodos();
        return todosDto.toDomain().toList();
      });

  @override
  Future<Either<AppFailure, Todo>> add({
    required TodoName name,
    required TodoCompleted completed,
  }) =>
      catchExceptions(() async {
        final todoDto = await todosDataSource.add(
          name: name.value,
          completed: completed.value,
        );
        return todoDto.toDomain();
      });

  @override
  Future<Either<AppFailure, Todo>> update(Todo todo) =>
      catchExceptions(() async {
        final todoDto = await todosDataSource.update(
          id: todo.id.value,
          name: todo.name.value,
          completed: todo.completed.value,
        );
        return todoDto.toDomain();
      });

  @override
  Future<AppFailure?> remove(TodoId todoId) =>
      catchExceptionsVoid(() => todosDataSource.remove(todoId.value));
}
