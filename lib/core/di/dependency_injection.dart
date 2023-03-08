import 'package:get_it/get_it.dart';
import 'package:hafizh/core/credentials.dart';

final locator = GetIt.instance;

class DependencyInjection {
  static Future<void> registerDependencies({
    required Environment env,
  }) async {
    locator
      ..registerSingleton<Credentials>(credentials[env]!);
  }
}
