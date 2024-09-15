import 'package:flutter/material.dart';
import 'package:todo_app/app/app.dart';
import 'package:todo_app/app/injection.dart';

void main() {
  configureDependencies();

  runApp(const App());
}
