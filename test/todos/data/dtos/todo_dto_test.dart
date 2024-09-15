import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/todos/data/dtos/todo_dto.dart';
import 'package:todo_app/todos/domain/models/todo.dart';
import 'package:todo_app/todos/domain/values/todo_completed.dart';
import 'package:todo_app/todos/domain/values/todo_id.dart';
import 'package:todo_app/todos/domain/values/todo_name.dart';

void main() {
  group(
    'TodoDto',
    () {
      final todo = Todo(
        id: const TodoId(1),
        name: TodoName('Test'),
        completed: TodoCompleted.yes,
      );
      const todoDto = TodoDto(
        id: 1,
        todo: 'Test',
        completed: true,
      );
      const todoJson = {
        'id': 1,
        'todo': 'Test',
        'completed': true,
      };
      group(
        'fromDomain',
        () {
          test(
            'should return correct TodoDto',
            () {
              // act
              final result = TodoDto.fromDomain(todo);

              // assert
              expect(result, todoDto);
            },
          );
        },
      );

      group(
        'fromJson',
        () {
          test(
            'should return correct TodoDto',
            () {
              // act
              final result = TodoDto.fromJson(todoJson);

              // assert
              expect(result, todoDto);
            },
          );
        },
      );

      group(
        'toDomain',
        () {
          test(
            'should return correct Todo',
            () {
              // act
              final result = todoDto.toDomain();

              // assert
              expect(result, todo);
            },
          );
        },
      );
    },
  );
}
