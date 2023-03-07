import 'package:get_it/get_it.dart';
import 'package:hafizh/core/credentials.dart';
import 'package:hafizh/core/hive/hive_service.dart';

final locator = GetIt.instance;

class DependencyInjection {
  static Future<void> registerDependencies({
    required Environment env,
  }) async {
    locator
      ..registerSingleton<Credentials>(credentials[env]!)
      ..registerSingleton<HiveService>(HiveService());
  }
}
