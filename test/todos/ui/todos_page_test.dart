import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol_finders/patrol_finders.dart';
import 'package:todo_app/core/widgets/error_view.dart';
import 'package:todo_app/todos/cubit/todos_cubit.dart';
import 'package:todo_app/todos/domain/models/todo.dart';
import 'package:todo_app/todos/domain/values/todo_completed.dart';
import 'package:todo_app/todos/domain/values/todo_id.dart';
import 'package:todo_app/todos/domain/values/todo_name.dart';
import 'package:todo_app/todos/ui/todo_item.dart';
import 'package:todo_app/todos/ui/todos_page.dart';

import '../../utils/patrol_tester_x.dart';

class MockTodosCubit extends MockCubit<TodosState> implements TodosCubit {}

void main() {
  late TodosCubit mockTodosCubit;

  setUp(() {
    mockTodosCubit = MockTodosCubit();
    GetIt.instance.registerSingleton(mockTodosCubit);

    when(mockTodosCubit.init).thenAnswer((_) async {});
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  group(
    'TodosPage',
    () {
      patrolWidgetTest(
        'should show loading indicator when state is loading',
        ($) async {
          // arrange
          when(() => mockTodosCubit.state).thenReturn(
            const TodosState(
              loading: true,
              error: false,
            ),
          );

          // act
          await $.pumpApp(const TodosPage());

          // assert
          expect($(CircularProgressIndicator), findsOneWidget);
        },
      );

      patrolWidgetTest(
        'should show ErrorView when state has error',
        ($) async {
          // arrange
          when(() => mockTodosCubit.state).thenReturn(
            const TodosState(
              loading: false,
              error: true,
            ),
          );

          // act
          await $.pumpApp(const TodosPage());

          // assert
          expect($(ErrorView), findsOneWidget);
        },
      );

      patrolWidgetTest(
        'should show list of TodoItems when state has todos',
        ($) async {
          // arrange
          final todos = [
            Todo(
              id: const TodoId(1),
              name: TodoName('Todo 1'),
              completed: TodoCompleted.no,
            ),
            Todo(
              id: const TodoId(2),
              name: TodoName('Todo 2'),
              completed: TodoCompleted.yes,
            ),
          ];
          when(() => mockTodosCubit.state).thenReturn(
            TodosState(
              loading: false,
              error: false,
              todos: todos,
            ),
          );

          // act
          await $.pumpApp(const TodosPage());

          // assert
          expect($(TodoItem), findsNWidgets(2));
        },
      );
    },
  );
}
