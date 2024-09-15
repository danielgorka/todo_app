import 'package:todo_app/core/domain/app_failure.dart';
import 'package:todo_app/core/domain/either.dart';
import 'package:todo_app/todos/domain/models/todo.dart';
import 'package:todo_app/todos/domain/values/todo_completed.dart';
import 'package:todo_app/todos/domain/values/todo_id.dart';
import 'package:todo_app/todos/domain/values/todo_name.dart';

abstract class ITodosRepository {
  Future<Either<AppFailure, List<Todo>>> getTodos();
  Future<Either<AppFailure, Todo>> add({
    required TodoName name,
    required TodoCompleted completed,
  });
  Future<Either<AppFailure, Todo>> update(Todo todo);
  Future<AppFailure?> remove(TodoId todoId);
}
