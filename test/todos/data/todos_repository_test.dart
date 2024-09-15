import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/core/domain/app_failure.dart';
import 'package:todo_app/todos/data/dtos/todo_dto.dart';
import 'package:todo_app/todos/data/dtos/todos_dto.dart';
import 'package:todo_app/todos/data/todos_data_source.dart';
import 'package:todo_app/todos/data/todos_repository.dart';
import 'package:todo_app/todos/domain/models/todo.dart';
import 'package:todo_app/todos/domain/values/todo_completed.dart';
import 'package:todo_app/todos/domain/values/todo_id.dart';
import 'package:todo_app/todos/domain/values/todo_name.dart';

class MockTodosDataSource extends Mock implements TodosDataSource {}

void main() {
  group(
    'TodosRepository',
    () {
      late TodosDataSource todosDataSource;
      late TodosRepository todosRepository;

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
      const todosDto = TodosDto(
        todos: [todoDto],
      );

      setUp(() {
        todosDataSource = MockTodosDataSource();
        todosRepository = TodosRepository(
          todosDataSource: todosDataSource,
        );
      });

      group(
        'getTodos',
        () {
          test(
            'should return Todos from data source',
            () async {
              // arrange
              when(
                () => todosDataSource.getTodos(),
              ).thenAnswer((_) => Future.value(todosDto));

              // act
              final result = await todosRepository.getTodos();

              // assert
              expect(result.right, [todo]);
              verify(() => todosDataSource.getTodos()).called(1);
              verifyNoMoreInteractions(todosDataSource);
            },
          );

          test(
            'should return AppFailure when data source throws Exception',
            () async {
              // arrange
              when(
                () => todosDataSource.getTodos(),
              ).thenThrow(Exception());

              // act
              final result = await todosRepository.getTodos();

              // assert
              expect(result.left, const AppFailure.unknownError());
              verify(() => todosDataSource.getTodos()).called(1);
              verifyNoMoreInteractions(todosDataSource);
            },
          );
        },
      );

      group(
        'add',
        () {
          test(
            'should return Todo from data source',
            () async {
              // arrange
              when(
                () => todosDataSource.add(
                  name: todo.name.value,
                  completed: todo.completed.value,
                ),
              ).thenAnswer((_) => Future.value(todoDto));

              // act
              final result = await todosRepository.add(
                name: todo.name,
                completed: todo.completed,
              );

              // assert
              expect(result.right, todo);
              verify(
                () => todosDataSource.add(
                  name: todo.name.value,
                  completed: todo.completed.value,
                ),
              ).called(1);
              verifyNoMoreInteractions(todosDataSource);
            },
          );

          test(
            'should return AppFailure when data source throws Exception',
            () async {
              // arrange
              when(
                () => todosDataSource.add(
                  name: todo.name.value,
                  completed: todo.completed.value,
                ),
              ).thenThrow(Exception());

              // act
              final result = await todosRepository.add(
                name: todo.name,
                completed: todo.completed,
              );

              // assert
              expect(result.left, const AppFailure.unknownError());
              verify(
                () => todosDataSource.add(
                  name: todo.name.value,
                  completed: todo.completed.value,
                ),
              ).called(1);
              verifyNoMoreInteractions(todosDataSource);
            },
          );
        },
      );

      group(
        'update',
        () {
          test(
            'should return Todo from data source',
            () async {
              // arrange
              when(
                () => todosDataSource.update(
                  id: todo.id.value,
                  name: todo.name.value,
                  completed: todo.completed.value,
                ),
              ).thenAnswer((_) => Future.value(todoDto));

              // act
              final result = await todosRepository.update(todo);

              // assert
              expect(result.right, todo);
              verify(
                () => todosDataSource.update(
                  id: todo.id.value,
                  name: todo.name.value,
                  completed: todo.completed.value,
                ),
              ).called(1);
              verifyNoMoreInteractions(todosDataSource);
            },
          );

          test(
            'should return AppFailure when data source throws Exception',
            () async {
              // arrange
              when(
                () => todosDataSource.update(
                  id: todo.id.value,
                  name: todo.name.value,
                  completed: todo.completed.value,
                ),
              ).thenThrow(Exception());

              // act
              final result = await todosRepository.update(todo);

              // assert
              expect(result.left, const AppFailure.unknownError());
              verify(
                () => todosDataSource.update(
                  id: todo.id.value,
                  name: todo.name.value,
                  completed: todo.completed.value,
                ),
              ).called(1);
              verifyNoMoreInteractions(todosDataSource);
            },
          );
        },
      );

      group(
        'remove',
        () {
          test(
            'should return null when call to data source was successful',
            () async {
              // arrange
              when(
                () => todosDataSource.remove(todo.id.value),
              ).thenAnswer((_) => Future.value());

              // act
              final result = await todosRepository.remove(todo.id);

              // assert
              expect(result, isNull);
              verify(
                () => todosDataSource.remove(todo.id.value),
              ).called(1);
              verifyNoMoreInteractions(todosDataSource);
            },
          );

          test(
            'should return AppFailure when data source throws Exception',
            () async {
              // arrange
              when(
                () => todosDataSource.remove(todo.id.value),
              ).thenThrow(Exception());

              // act
              final result = await todosRepository.remove(todo.id);

              // assert
              expect(result, const AppFailure.unknownError());
              verify(
                () => todosDataSource.remove(todo.id.value),
              ).called(1);
              verifyNoMoreInteractions(todosDataSource);
            },
          );
        },
      );
    },
  );
}
