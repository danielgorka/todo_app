import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

/// Value failure when value does not pass validation.
@freezed
sealed class ValueFailure with _$ValueFailure {
  /// Value is empty.
  const factory ValueFailure.empty() = Empty;

  /// Value is not valid.
  ///
  /// Use this failure when you want to validate value that is set by system
  /// and you want to make sure that it is valid.
  ///
  /// This failure should not be used for user input validation.
  const factory ValueFailure.invalidValue([String? message]) = InvalidValue;
}
