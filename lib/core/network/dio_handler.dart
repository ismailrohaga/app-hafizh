import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/core/network/api_interceptors.dart';
import 'package:hafizh/core/network/cache_interceptors.dart';

class DioHandler {
  final String baseUrl;

  DioHandler({required this.baseUrl});

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 30),
    );

    CacheOptions cacheOptions = CacheOptions(
      store: MemCacheStore(),
      // All subsequent fields are optional.
      // Default.
      policy: CachePolicy.noCache,
      // Returns a cached response on error but for statuses 401 & 403.
      // Also allows to return a cached response on network errors (e.g. offline usage).
      // Defaults to [null].
      hitCacheOnErrorExcept: [401, 403],
      // Overrides any HTTP directive to delete entry past this duration.
      // Useful only when origin server has no cache config or custom behaviour is desired.
      // Defaults to [null].
      maxStale: const Duration(hours: 1),
      // Default. Allows 3 cache sets and ease cleanup.
      priority: CachePriority.normal,
      // Default. Body and headers encryption with your own algorithm.
      cipher: null,
      // Default. Key builder to retrieve requests.
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      // Default. Allows to cache POST requests.
      // Overriding [keyBuilder] is strongly recommended when [true].
      allowPostMethod: false,
    );

    options.headers = _defaultHeader();
    final dio = Dio(options);
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(CacheInterceptor(options: cacheOptions));

    return dio;
  }

  Dio get dio => _getDio();

  Map<String, dynamic> _defaultHeader() {
    Map<String, String> headers = {};
    headers['Content-Type'] = 'application/json';
    return headers;
  }
}
