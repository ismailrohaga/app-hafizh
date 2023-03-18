import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hafizh/core/credentials.dart';
import 'package:hafizh/core/network/dio_handler.dart';
import 'package:hafizh/data/data_source/quran_local_data_source.dart';
import 'package:hafizh/data/data_source/quran_remote_data_source.dart';
import 'package:hafizh/data/db/database_helper.dart';
import 'package:hafizh/data/repo/quran_repository_impl.dart';
import 'package:hafizh/domain/repo/quran_repo.dart';
import 'package:hafizh/domain/usecase/get_bookmark_verses_usecase.dart';
import 'package:hafizh/domain/usecase/get_detail_surah_usecase.dart';
import 'package:hafizh/domain/usecase/get_juz_usecase.dart';
import 'package:hafizh/domain/usecase/get_last_read_usecase.dart';
import 'package:hafizh/domain/usecase/get_surah_usecase.dart';
import 'package:hafizh/domain/usecase/remove_bookmark_verses_usecase.dart';
import 'package:hafizh/domain/usecase/save_bookmark_verses_usecase.dart';
import 'package:hafizh/domain/usecase/save_last_read_usecase.dart';
import 'package:hafizh/domain/usecase/status_bookmark_verse_usecase.dart';
import 'package:hafizh/domain/usecase/update_last_read_usecase.dart';

final locator = GetIt.instance;

class DependencyInjection {
  static Future<void> registerDependencies({
    required Environment env,
  }) async {
    await dotenv.load(fileName: ".env");

    locator.registerSingleton<Credentials>(credentials[env]!);
    locator.registerLazySingleton<DioHandler>(
        () => DioHandler(baseUrl: locator<Credentials>().baseUrl));
    locator.registerLazySingleton<Dio>(() => locator<DioHandler>().dio);

    /// Database
    locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

    /// Remote Data Source
    locator.registerLazySingleton<QuranRemoteDataSource>(
        () => QuranRemoteDataSourceImpl(dio: locator()));

    /// Local Data Source
    locator.registerLazySingleton<QuranLocalDataSource>(
        () => QuranLocalDataSourceImpl(databaseHelper: locator()));

    /// Repository
    locator.registerLazySingleton<QuranRepo>(() => QuranRepositoryImpl(
        remoteDataSource: locator(), localDataSource: locator()));

    /// Use Case
    locator.registerLazySingleton<GetSurahUsecase>(
        () => GetSurahUsecase(repository: locator()));

    locator.registerLazySingleton<GetDetailSurahUsecase>(
        () => GetDetailSurahUsecase(repository: locator()));

    locator.registerLazySingleton<GetJuzUsecase>(
        () => GetJuzUsecase(repository: locator()));

    locator.registerLazySingleton<SaveLastReadUsecase>(
        () => SaveLastReadUsecase(repository: locator()));

    locator.registerLazySingleton<UpdateLastReadUsecase>(
        () => UpdateLastReadUsecase(repository: locator()));

    locator.registerLazySingleton<GetLastReadUsecase>(
        () => GetLastReadUsecase(repository: locator()));

    locator.registerLazySingleton<SaveBookmarkVersesUseCase>(
        () => SaveBookmarkVersesUseCase(repository: locator()));

    locator.registerLazySingleton<RemoveBookmarkVersesUsecase>(
        () => RemoveBookmarkVersesUsecase(repository: locator()));

    locator.registerLazySingleton<GetBookmarkVersesUsecase>(
        () => GetBookmarkVersesUsecase(repository: locator()));

    locator.registerLazySingleton<StatusBookmarkVerseUsecase>(
        () => StatusBookmarkVerseUsecase(repository: locator()));
  }
}