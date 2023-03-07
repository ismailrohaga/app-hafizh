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
          baseUrl: 'https://api.thecatapi.com/v1/',
          env: Environment.dev,
        );
}

class ProdCredentials extends Credentials {
  ProdCredentials()
      : super(
          baseUrl: 'https://api.thecatapi.com/v1/',
          env: Environment.prod,
        );
}

final credentials = {
  Environment.dev: DevCredentials(),
  Environment.prod: ProdCredentials(),
};
