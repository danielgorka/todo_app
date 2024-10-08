import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

@freezed
abstract class AppFailure with _$AppFailure {
  const factory AppFailure.serverError() = AppFailureServerError;
  const factory AppFailure.unknownError() = AppFailureUnknownError;
}
