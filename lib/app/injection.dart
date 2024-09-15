// coverage:ignore-file
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:todo_app/app/env.dart';
import 'package:todo_app/app/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio(BaseOptions(baseUrl: Env.apiUrl));
    dio.interceptors.add(TalkerDioLogger());
    return dio;
  }
}
