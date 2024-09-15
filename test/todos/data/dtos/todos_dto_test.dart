import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/todos/data/dtos/todo_dto.dart';
import 'package:todo_app/todos/data/dtos/todos_dto.dart';
import 'package:todo_app/todos/domain/models/todo.dart';
import 'package:todo_app/todos/domain/values/todo_completed.dart';
import 'package:todo_app/todos/domain/values/todo_id.dart';
import 'package:todo_app/todos/domain/values/todo_name.dart';

void main() {
  group(
    'TodosDto',
    () {
      final todos = [
        Todo(
          id: const TodoId(1),
          name: TodoName('Test'),
          completed: TodoCompleted.yes,
        ),
        Todo(
          id: const TodoId(2),
          name: TodoName('Test 2'),
          completed: TodoCompleted.no,
        ),
      ];
      const todosDto = TodosDto(
        todos: [
          TodoDto(
            id: 1,
            todo: 'Test',
            completed: true,
          ),
          TodoDto(
            id: 2,
            todo: 'Test 2',
            completed: false,
          ),
        ],
      );
      const todosJson = {
        'todos': [
          {
            'id': 1,
            'todo': 'Test',
            'completed': true,
          },
          {
            'id': 2,
            'todo': 'Test 2',
            'completed': false,
          },
        ],
      };

      group(
        'fromJson',
        () {
          test(
            'should return correct TodosDto',
            () {
              // act
              final result = TodosDto.fromJson(todosJson);

              // assert
              expect(result, todosDto);
            },
          );
        },
      );

      group(
        'toDomain',
        () {
          test(
            'should return correct Todos',
            () {
              // act
              final result = todosDto.toDomain();

              // assert
              expect(result, todos);
            },
          );
        },
      );
    },
  );
}
