// coverage:ignore-file
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todo_app/todos/data/dtos/todo_dto.dart';
import 'package:todo_app/todos/data/dtos/todos_dto.dart';

part 'todos_data_source.g.dart';

@lazySingleton
@RestApi()
abstract class TodosDataSource {
  @factoryMethod
  factory TodosDataSource({
    required Dio dio,
  }) =>
      _TodosDataSource(dio);

  @GET('/todos')
  Future<TodosDto> getTodos();

  @POST('/todos')
  Future<TodoDto> add({
    @Field('todo') required String name,
    @Field('completed') required bool completed,
    @Field('userId') int userId = 0,
  });

  @PUT('/todos/{id}')
  Future<TodoDto> update({
    @Path('id') required int id,
    @Field('todo') required String name,
    @Field('completed') required bool completed,
  });

  @DELETE('/todos/{id}')
  Future<void> remove(@Path('id') int id);
}
