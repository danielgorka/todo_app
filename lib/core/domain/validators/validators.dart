import 'package:todo_app/core/domain/validators/value_failure.dart';

/// A function that validates a [value] and returns a [ValueFailure] if the
/// validation fails. Otherwise returns `null`.
typedef Validator<T> = ValueFailure? Function(T value);

/// A collection of [Validator]s.
///
/// Every [Validator] is a function that validates a value and returns a
/// [ValueFailure] if the validation fails. Otherwise returns `null`.
///
/// If `value` is `null` then the validation is skipped and `null` is returned.
abstract class Validators {
  // String validators

  /// Validates that value is not empty string.
  ///
  /// Returns [ValueFailure.empty] if value is empty string.
  static Validator<String?> notEmpty = (String? value) {
    if (value != null && value.trim().isEmpty) {
      return const ValueFailure.empty();
    } else {
      return null;
    }
  };
}
