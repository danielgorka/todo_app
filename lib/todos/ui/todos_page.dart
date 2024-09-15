import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/injection.dart';
import 'package:todo_app/core/widgets/error_view.dart';
import 'package:todo_app/todos/bloc/todos_bloc.dart';
import 'package:todo_app/todos/ui/todo_item.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TodosBloc>()..add(const TodosEvent.init()),
      child: const Scaffold(
        body: _TodosView(),
      ),
    );
  }
}

class _TodosView extends StatelessWidget {
  const _TodosView();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TodosBloc>().state;

    if (state.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.error) {
      return const ErrorView();
    } else {
      return ListView.builder(
        itemCount: state.todos!.length,
        itemBuilder: (context, index) {
          final todo = state.todos![index];
          return TodoItem(todo: todo);
        },
      );
    }
  }
}
