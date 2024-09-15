import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/todos/domain/models/todo.dart';
import 'package:todo_app/todos/domain/values/todo_completed.dart';
import 'package:todo_app/todos/domain/values/todo_id.dart';
import 'package:todo_app/todos/domain/values/todo_name.dart';

part 'todo_dto.freezed.dart';
part 'todo_dto.g.dart';

@freezed
class TodoDto with _$TodoDto {
  const factory TodoDto({
    required int id,
    required String todo,
    required bool completed,
  }) = _TodoDto;

  const TodoDto._();

  factory TodoDto.fromDomain(Todo todo) {
    return TodoDto(
      id: todo.id.value,
      todo: todo.name.value,
      completed: todo.completed.value,
    );
  }

  factory TodoDto.fromJson(Map<String, dynamic> json) =>
      _$TodoDtoFromJson(json);

  Todo toDomain() {
    return Todo(
      id: TodoId(id),
      name: TodoName(todo),
      completed: TodoCompleted(completed),
    );
  }
}
