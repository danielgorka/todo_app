import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/todos/domain/values/todo_completed.dart';
import 'package:todo_app/todos/domain/values/todo_id.dart';
import 'package:todo_app/todos/domain/values/todo_name.dart';

part 'todo.freezed.dart';

@freezed
abstract class Todo with _$Todo {
  const factory Todo({
    required TodoId id,
    required TodoName name,
    required TodoCompleted completed,
  }) = _Todo;
}
