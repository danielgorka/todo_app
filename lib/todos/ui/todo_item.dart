import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/todos/bloc/todos_bloc.dart';
import 'package:todo_app/todos/domain/models/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    required this.todo,
    super.key,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.name.value),
      subtitle: Text(todo.completed.value ? 'Completed' : 'Not completed'),
      leading: Checkbox(
        value: todo.completed.value,
        onChanged: (_) =>
              context.read<TodosBloc>().add(TodosEvent.toggle(todo)),
      ),
    );
  }
}
