import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hafizh/core/credentials.dart';
import 'package:hafizh/core/network/dio_handler.dart';

final locator = GetIt.instance;

class DependencyInjection {
  static Future<void> registerDependencies({
    required Environment env,
  }) async {
    await dotenv.load(fileName: ".env");

    registerCoreModule(env);
  }

  static registerCoreModule(Environment env) {
    locator.registerSingleton<Credentials>(credentials[env]!);
    locator.registerLazySingleton<DioHandler>(
        () => DioHandler(baseUrl: locator<Credentials>().baseUrl));
    locator.registerLazySingleton<Dio>(() => locator<DioHandler>().dio);
  }
}
