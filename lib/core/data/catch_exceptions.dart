import 'package:dio/dio.dart';
import 'package:todo_app/core/domain/app_failure.dart';
import 'package:todo_app/core/domain/either.dart';
import 'package:todo_app/core/talker.dart';

Future<Either<AppFailure, T>> catchExceptions<T>(
  Future<T> Function() callback,
) async {
  try {
    return Right(await callback());
  } on DioException catch (e, s) {
    talker.warning('Caught error', e, s);
    return const Left(AppFailure.serverError());
  } on Exception catch (e, s) {
    talker.error('Caught error', e, s);
    return const Left(AppFailure.unknownError());
  }
}

Future<AppFailure?> catchExceptionsVoid(
  Future<void> Function() callback,
) async {
  final either = await catchExceptions(callback);
  return either.fold((failure) => failure, (_) => null);
}
