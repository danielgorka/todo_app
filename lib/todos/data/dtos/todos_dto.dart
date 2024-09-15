import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/todos/data/dtos/todo_dto.dart';
import 'package:todo_app/todos/domain/models/todo.dart';

part 'todos_dto.freezed.dart';
part 'todos_dto.g.dart';

@freezed
class TodosDto with _$TodosDto {
  const factory TodosDto({
    required List<TodoDto> todos,
  }) = _TodosDto;

  const TodosDto._();

  factory TodosDto.fromJson(Map<String, dynamic> json) =>
      _$TodosDtoFromJson(json);

  List<Todo> toDomain() {
    return todos.map((todoDto) => todoDto.toDomain()).toList();
  }
}
