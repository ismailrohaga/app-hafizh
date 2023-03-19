import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/core/credentials.dart';
import 'package:hafizh/core/network/dio_handler.dart';
import 'package:hafizh/data/data_source/quran_local_data_source.dart';
import 'package:hafizh/data/data_source/quran_remote_data_source.dart';
import 'package:hafizh/data/db/database_helper.dart';
import 'package:hafizh/data/repo/authentication_repository_impl.dart';
import 'package:hafizh/data/repo/quran_repository_impl.dart';
import 'package:hafizh/domain/repo/authentication_repo.dart';
import 'package:hafizh/domain/repo/quran_repo.dart';
import 'package:hafizh/domain/usecase/authentication/sign_in_with_google_usecase.dart';
import 'package:hafizh/domain/usecase/authentication/sign_out_usecase.dart';
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

class DependencyInjection {
  static Future<void> registerDependencies({
    required Environment env,
  }) async {
    await dotenv.load(fileName: ".env");

    locator.registerSingleton<Credentials>(credentials[env]!);
    locator.registerLazySingleton<DioHandler>(
        () => DioHandler(baseUrl: locator<Credentials>().baseUrl));
    locator.registerLazySingleton<Dio>(() => locator<DioHandler>().dio);

    // Firebase
    locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

    // Google Signin
    locator.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn(
            clientId:
                "440550480887-cp6hsnjdv75ccnkbnkkvelpsqmnij72c.apps.googleusercontent.com",
            scopes: [
              'email',
              'https://www.googleapis.com/auth/contacts.readonly',
            ]));

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

    locator.registerLazySingleton<AuthenticationRepo>(() =>
        AuthenticationRepositoryImpl(
            firebaseAuth: locator<FirebaseAuth>(),
            googleSignIn: locator<GoogleSignIn>()));

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

    // Authentication Use Case
    locator.registerLazySingleton<SignInWithGoogleUseCase>(
        () => SignInWithGoogleUseCase(repository: locator()));

    locator.registerLazySingleton<SignOutUseCase>(
        () => SignOutUseCase(repository: locator()));
  }
}
