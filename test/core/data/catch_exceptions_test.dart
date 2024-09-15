import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/core/data/catch_exceptions.dart';
import 'package:todo_app/core/domain/app_failure.dart';

void main() {
  group(
    'catchExceptions',
    () {
      test(
        'should return callback result when it finished without exceptions',
        () async {
          // arrange
          Future<int> callback() async {
            return 10;
          }

          // act
          final result = await catchExceptions(callback);

          // assert
          expect(result.right, 10);
        },
      );

      test(
        'should return an AppFailure.serverError when DioException is thrown',
        () async {
          // arrange
          Future<int> callback() async {
            throw DioException(requestOptions: RequestOptions());
          }

          // act
          final result = await catchExceptions(callback);

          // assert
          expect(result.left, const AppFailure.serverError());
        },
      );

      test(
        'should return an AppFailure.unknownError when an exception is thrown',
        () async {
          // arrange
          Future<int> callback() async {
            throw Exception('error');
          }

          // act
          final result = await catchExceptions(callback);

          // assert
          expect(result.left, const AppFailure.unknownError());
        },
      );
    },
  );
}
