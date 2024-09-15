// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:todo_app/app/injection.dart' as _i117;
import 'package:todo_app/todos/bloc/todos_bloc.dart' as _i830;
import 'package:todo_app/todos/data/todos_data_source.dart' as _i858;
import 'package:todo_app/todos/data/todos_repository.dart' as _i808;
import 'package:todo_app/todos/domain/i_todos_repository.dart' as _i99;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i858.TodosDataSource>(
        () => _i858.TodosDataSource(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i99.ITodosRepository>(() =>
        _i808.TodosRepository(todosDataSource: gh<_i858.TodosDataSource>()));
    gh.factory<_i830.TodosBloc>(
        () => _i830.TodosBloc(todosRepository: gh<_i99.ITodosRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i117.RegisterModule {}
