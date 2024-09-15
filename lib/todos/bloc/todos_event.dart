part of 'todos_bloc.dart';

@freezed
class TodosEvent with _$TodosEvent {
  const factory TodosEvent.init() = _Init;

  const factory TodosEvent.toggle(Todo todo) = _Toggle;
}
