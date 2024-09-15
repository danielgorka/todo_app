import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/core/domain/app_failure.dart';
import 'package:todo_app/core/domain/either.dart';
import 'package:todo_app/todos/bloc/todos_bloc.dart';
import 'package:todo_app/todos/domain/i_todos_repository.dart';
import 'package:todo_app/todos/domain/models/todo.dart';
import 'package:todo_app/todos/domain/values/todo_completed.dart';
import 'package:todo_app/todos/domain/values/todo_id.dart';
import 'package:todo_app/todos/domain/values/todo_name.dart';

class MockTodosRepository extends Mock implements ITodosRepository {}

void main() {
  late MockTodosRepository mockTodosRepository;
  late TodosBloc todosBloc;

  setUp(() {
    mockTodosRepository = MockTodosRepository();
    todosBloc = TodosBloc(todosRepository: mockTodosRepository);
  });

  tearDown(() {
    todosBloc.close();
  });

  final todo = Todo(
    id: const TodoId(1),
    name: TodoName('Todo 1'),
    completed: TodoCompleted.yes,
  );
  final toggledTodo = todo.copyWith(
    completed: TodoCompleted.no,
  );

  final todos = [todo];

  group(
    'TodosBloc',
    () {
      group(
        'init',
        () {
          blocTest<TodosBloc, TodosState>(
            'should emit [loading, loaded] when TodosRepository.getTodos '
            'is successful',
            build: () {
              when(() => mockTodosRepository.getTodos()).thenAnswer(
                (_) async => Right(todos),
              );
              return todosBloc;
            },
            act: (bloc) => bloc.add(const TodosEvent.init()),
            expect: () => [
              const TodosState(loading: true, error: false),
              TodosState(
                loading: false,
                error: false,
                todos: todos,
              ),
            ],
          );

          blocTest<TodosBloc, TodosState>(
            'should emit [loading, error] when TodosRepository.getTodos fails',
            build: () {
              when(() => mockTodosRepository.getTodos()).thenAnswer(
                (_) async => const Left(AppFailure.serverError()),
              );
              return todosBloc;
            },
            act: (bloc) => bloc.add(const TodosEvent.init()),
            expect: () => [
              const TodosState(loading: true, error: false),
              const TodosState(loading: false, error: true),
            ],
          );
        },
      );

      group(
        'toggle',
        () {
          blocTest<TodosBloc, TodosState>(
            'should emit updated state when TodosRepository.update '
            'is successful',
            build: () {
              when(() => mockTodosRepository.update(toggledTodo))
                  .thenAnswer((_) async => Right(toggledTodo));
              return todosBloc;
            },
            seed: () => TodosState(
              loading: false,
              error: false,
              todos: todos,
            ),
            act: (bloc) => bloc.add(TodosEvent.toggle(todo)),
            expect: () => [
              TodosState(
                loading: false,
                error: false,
                todos: [toggledTodo],
              ),
            ],
          );

          blocTest<TodosBloc, TodosState>(
            'should emit updated state and error when TodosRepository.update '
            'fails',
            build: () {
              when(() => mockTodosRepository.update(toggledTodo)).thenAnswer(
                (_) async => const Left(AppFailure.serverError()),
              );
              return todosBloc;
            },
            seed: () => TodosState(
              loading: false,
              error: false,
              todos: todos,
            ),
            act: (bloc) => bloc.add(TodosEvent.toggle(todo)),
            expect: () => [
              TodosState(
                loading: false,
                error: false,
                todos: [toggledTodo],
              ),
              TodosState(
                loading: false,
                error: true,
                todos: todos,
              ),
            ],
          );
        },
      );
    },
  );
}
