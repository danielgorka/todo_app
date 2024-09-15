import 'package:flutter/material.dart';
import 'package:patrol_finders/patrol_finders.dart';
import 'package:todo_app/app/app_theme.dart';

extension PatrolTesterX on PatrolTester {
  /// Pumps the given [widget] and wraps it with a [MaterialApp] and [Material].
  Future<void> pumpApp(Widget widget) => pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          home: Material(
            child: widget,
          ),
        ),
      );

  /// Returns the widget of type [T] that is found by this type.
  T widget<T extends Widget>() => tester.widget<T>(call(T));
}
