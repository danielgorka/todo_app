import 'package:todo_app/core/domain/validators/validators.dart';
import 'package:todo_app/core/domain/value.dart';

class TodoName extends Value<String> {
  TodoName(String value)
      : super(value, [
          Validators.notEmpty,
        ]);
}
