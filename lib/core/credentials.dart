import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Environment { dev, prod }

abstract class Credentials {
  const Credentials({
    required this.baseUrl,
    required this.env,
  });

  final String baseUrl;
  final Environment env;
}

class DevCredentials extends Credentials {
  DevCredentials()
      : super(
          baseUrl: dotenv.get('BASE_URL_DEV'),
          env: Environment.dev,
        );
}

class ProdCredentials extends Credentials {
  ProdCredentials()
      : super(
          baseUrl: dotenv.get('BASE_URL_PROD'),
          env: Environment.prod,
        );
}

final credentials = {
  Environment.dev: DevCredentials(),
  Environment.prod: ProdCredentials(),
};
