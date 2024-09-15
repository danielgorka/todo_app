import 'package:freezed_annotation/freezed_annotation.dart';

part 'either.freezed.dart';

/// A function that maps a value of type [A] to a value of type [B].
typedef MapFunction<A, B> = B Function(A value);

/// Either type.
@freezed
sealed class Either<L, R> with _$Either<L, R> {
  /// Creates a right value.
  const factory Either.right(R value) = Right<L, R>;

  /// Creates a left value.
  const factory Either.left(L value) = Left<L, R>;

  const Either._();

  /// Returns true if this is a right value.
  bool get isRight => this is Right<L, R>;

  /// Returns true if this is a left value.
  bool get isLeft => this is Left<L, R>;

  /// Returns the right value.
  ///
  /// Throws a [StateError] if this is a left value.
  R get right => isRight
      ? (this as Right<L, R>).value
      : throw StateError('Unexpected left value');

  /// Returns the left value.
  ///
  /// Throws a [StateError] if this is a right value.
  L get left => isLeft
      ? (this as Left<L, R>).value
      : throw StateError('Unexpected right value');

  /// Folds this value to a value of type [T].
  ///
  /// If this is a right value, [ifRight] is called with the right value.
  /// If this is a left value, [ifLeft] is called with the left value.
  T fold<T>(MapFunction<L, T> ifLeft, MapFunction<R, T> ifRight) {
    return isRight ? ifRight(right) : ifLeft(left);
  }
}
