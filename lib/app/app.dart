import 'package:flutter/material.dart';
import 'package:todo_app/app/app_theme.dart';
import 'package:todo_app/todos/ui/todos_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO app',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const TodosPage(),
    );
  }
}
