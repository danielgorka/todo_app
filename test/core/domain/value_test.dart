import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/core/domain/validators/validators.dart';
import 'package:todo_app/core/domain/validators/value_failure.dart';
import 'package:todo_app/core/domain/value.dart';

class TestValue<T> extends Value<T> {
  TestValue(super.value, super.validators);
  const TestValue.valid(super.value) : super.valid();
  const TestValue.invalid(super.value, super.failure) : super.invalid();
}

void main() {
  group(
    'Value',
    () {
      const value = 'Value';

      group(
        'constructor',
        () {
          test(
            'should return correct Value when value is valid',
            () {
              // act
              final result = TestValue(value, [
                Validators.notEmpty,
              ]);

              // assert
              expect(result.value, value);
              expect(result.failure, null);
            },
          );

          test(
            'should return correct Value when validators is empty',
            () {
              // act
              final result = TestValue<String>(value, const []);

              // assert
              expect(result.value, value);
              expect(result.failure, null);
            },
          );

          test(
            'should return correct Value when value is invalid',
            () {
              // act
              final result = TestValue(value, [
                (value) => const ValueFailure.empty(),
              ]);

              // assert
              expect(result.value, value);
              expect(result.failure, const ValueFailure.empty());
            },
          );
        },
      );

      group(
        'Value.valid',
        () {
          test(
            'should return correct Value when value is valid',
            () {
              // act
              const result = TestValue.valid(value);

              // assert
              expect(result.value, value);
              expect(result.failure, null);
            },
          );
        },
      );

      group(
        'Value.invalid',
        () {
          test(
            'should return correct Value when value is invalid',
            () {
              // act
              const result = TestValue.invalid(value, ValueFailure.empty());

              // assert
              expect(result.value, value);
              expect(result.failure, const ValueFailure.empty());
            },
          );
        },
      );

      group(
        'isValid',
        () {
          test(
            'should return true when failure is null',
            () {
              // arrange
              final testValue = TestValue(value, [
                Validators.notEmpty,
              ]);

              // act
              final result = testValue.isValid;

              // assert
              expect(result, true);
            },
          );

          test(
            'should return false when failure is not null',
            () {
              // arrange
              final testValue = TestValue(value, [
                (value) => const ValueFailure.empty(),
              ]);

              // act
              final result = testValue.isValid;

              // assert
              expect(result, false);
            },
          );
        },
      );

      group(
        'operator ==',
        () {
          test(
            'should return true when values and failures are equal',
            () {
              // arrange
              final testValue1 = TestValue(value, [
                Validators.notEmpty,
              ]);
              final testValue2 = TestValue(value, [
                Validators.notEmpty,
              ]);

              // act
              final result = testValue1 == testValue2;

              // assert
              expect(result, true);
            },
          );

          test(
            'should return true when maps are deep equal '
            'but not the same object',
            () {
              // arrange
              const map = {'key': 'value'};
              final testValue1 = TestValue<Map<String, String>>(
                Map<String, String>.from(map),
                const [],
              );
              final testValue2 = TestValue<Map<String, String>>(
                Map<String, String>.from(map),
                const [],
              );

              // act
              final result = testValue1 == testValue2;

              // assert
              expect(result, true);
            },
          );

          test(
            'should return false when values are not equal',
            () {
              // arrange
              final testValue1 = TestValue(value, [
                Validators.notEmpty,
              ]);
              final testValue2 = TestValue('Other value', [
                Validators.notEmpty,
              ]);

              // act
              final result = testValue1 == testValue2;

              // assert
              expect(result, false);
            },
          );
        },
      );

      group(
        'hashCode',
        () {
          test(
            'should return same hashCode when values and failures are equal',
            () {
              // arrange
              final testValue1 = TestValue(value, [
                Validators.notEmpty,
              ]);
              final testValue2 = TestValue(value, [
                Validators.notEmpty,
              ]);

              // act
              final result = testValue1.hashCode == testValue2.hashCode;

              // assert
              expect(result, true);
            },
          );

          test(
            'should return same hashCode when maps are deep equal '
            'but not the same object',
            () {
              // arrange
              const map = {'key': 'value'};
              final testValue1 = TestValue<Map<String, String>>(
                Map<String, String>.from(map),
                const [],
              );
              final testValue2 = TestValue<Map<String, String>>(
                Map<String, String>.from(map),
                const [],
              );

              // act
              final result = testValue1.hashCode == testValue2.hashCode;

              // assert
              expect(result, true);
            },
          );

          test(
            'should return different hashCode when values are not equal',
            () {
              // arrange
              final testValue1 = TestValue(value, [
                Validators.notEmpty,
              ]);
              final testValue2 = TestValue('Other value', [
                Validators.notEmpty,
              ]);

              // act
              final result = testValue1.hashCode == testValue2.hashCode;

              // assert
              expect(result, false);
            },
          );
        },
      );

      group(
        'toString',
        () {
          test(
            'should return correct string when failure is null',
            () {
              // arrange
              final testValue = TestValue(value, [
                Validators.notEmpty,
              ]);

              // act
              final result = testValue.toString();

              // assert
              expect(result, '($value)');
            },
          );

          test(
            'should return correct string when failure is not null',
            () {
              // arrange
              final testValue = TestValue(value, [
                (value) => const ValueFailure.empty(),
              ]);

              // act
              final result = testValue.toString();

              // assert
              expect(
                result,
                '($value, ValueFailure.empty())',
              );
            },
          );
        },
      );
    },
  );
}
