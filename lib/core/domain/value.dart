import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/core/domain/validators/validators.dart';
import 'package:todo_app/core/domain/validators/value_failure.dart';

/// Base class for all values.
///
/// It is used to represent values used in domain models.
/// Value can be validated using [Validator]s.
///
/// The real value is stored in [value] field.
/// If value is invalid then [failure] is not `null`.
@immutable
abstract class Value<T> {
  /// Creates a [Value] from [value] and [validators].
  Value(this.value, List<Validator<T>> validators)
      : failure = validators
            .map((validator) => validator(value))
            .firstWhereOrNull((failure) => failure != null);

  /// Creates an always valid [Value] from [value].
  const Value.valid(this.value) : failure = null;

  /// Creates an always invalid [Value] from [value].
  const Value.invalid(this.value, [ValueFailure? failure])
      : failure = failure ?? const ValueFailure.invalidValue();

  /// If `true` then runtime type is printed in [toString].
  ///
  /// Default is `false`. Useful for debugging.
  static bool printRuntimeType = false;

  /// The real value.
  final T value;

  /// Failure if value is invalid.
  final ValueFailure? failure;

  /// Returns `true` if value is valid.
  bool get isValid => failure == null;

  @override
  bool operator ==(Object other) {
    return other is Value<T> &&
        failure == other.failure &&
        const DeepCollectionEquality().equals(value, other.value);
  }

  @override
  int get hashCode => Object.hash(
        const DeepCollectionEquality().hash(failure),
        const DeepCollectionEquality().hash(value),
      );

  @override
  String toString() =>
      (printRuntimeType ? runtimeType.toString() : '') +
      (isValid ? '($value)' : '($value, $failure)');
}
