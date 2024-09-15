import 'package:todo_app/core/domain/value.dart';

class TodoId extends Value<int> {
  const TodoId(super.value) : super.valid();
}
