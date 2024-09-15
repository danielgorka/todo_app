import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol_finders/patrol_finders.dart';
import 'package:todo_app/todos/bloc/todos_bloc.dart';
import 'package:todo_app/todos/domain/models/todo.dart';
import 'package:todo_app/todos/domain/values/todo_completed.dart';
import 'package:todo_app/todos/domain/values/todo_id.dart';
import 'package:todo_app/todos/domain/values/todo_name.dart';
import 'package:todo_app/todos/ui/todo_item.dart';

import '../../utils/patrol_tester_x.dart';
import 'todos_page_test.dart';

void main() {
  group(
    'TodoItem',
    () {
      patrolWidgetTest(
        'should show todo name and completed status',
        ($) async {
          // arrange
          final todo = Todo(
            id: const TodoId(1),
            name: TodoName('Test'),
            completed: TodoCompleted.yes,
          );

          // act
          await $.pumpApp(TodoItem(todo: todo));

          // assert
          expect($(todo.name.value), findsOneWidget);
          expect($('Completed'), findsOneWidget);
          expect($.widget<Checkbox>().value, todo.completed.value);
        },
      );

      patrolWidgetTest(
        'should add TodosEvent.toggle when checkbox is tapped',
        ($) async {
          // arrange
          final bloc = MockTodosBloc();
          when(() => bloc.stream).thenAnswer((_) => const Stream.empty());

          final todo = Todo(
            id: const TodoId(1),
            name: TodoName('Test'),
            completed: TodoCompleted.yes,
          );

          // act
          await $.pumpApp(
            BlocProvider<TodosBloc>.value(
              value: bloc,
              child: TodoItem(
                todo: todo,
              ),
            ),
          );

          await $(Checkbox).tap();

          // assert
          verify(() => bloc.add(TodosEvent.toggle(todo)));
        },
      );
    },
  );
}
