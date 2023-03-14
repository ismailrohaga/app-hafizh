import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hafizh/core/credentials.dart';
import 'package:hafizh/core/network/dio_handler.dart';

final locator = GetIt.instance;

class DependencyInjection {
  static Future<void> registerDependencies({
    required Environment env,
  }) async {
    locator.registerSingleton<Credentials>(credentials[env]!);
    registerCoreModule();
  }

  static registerCoreModule() {
    locator.registerLazySingleton<Dio>(() => locator<DioHandler>().dio);
    locator.registerLazySingleton<DioHandler>(
        () => DioHandler(baseUrl: 'https://jsonplaceholder.typicode.com'));
  }
}
