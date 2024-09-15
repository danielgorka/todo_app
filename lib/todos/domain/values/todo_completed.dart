import 'package:todo_app/core/domain/value.dart';

class TodoCompleted extends Value<bool> {
  const TodoCompleted(super.value) : super.valid();

  static const yes = TodoCompleted(true);
  static const no = TodoCompleted(false);
}
