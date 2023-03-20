import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hafizh/common/dependencies/get_it/get_it.dart';
import 'package:hafizh/common/helper/preference_settings_helper.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjection {
  static Future<void> registerDependencies({
    required Environment env,
  }) async {
    await dotenv.load(fileName: ".env");

    locator.registerSingleton<Credentials>(credentials[env]!);
    locator.registerLazySingleton<DioHandler>(
        () => DioHandler(baseUrl: locator<Credentials>().baseUrl));
    locator.registerLazySingleton<Dio>(() => locator<DioHandler>().dio);

    // Shared Preference
    locator.registerLazySingleton<Future<SharedPreferences>>(
        () => SharedPreferences.getInstance());

    // Shared Preference Settings
    locator.registerLazySingleton<PreferenceSettingsHelper>(
        () => PreferenceSettingsHelper(sharedPreferences: locator()));

    // PreferenceSettingsProvider
    locator.registerLazySingleton<PreferenceSettingsProvider>(
        () => PreferenceSettingsProvider(preferenceSettingsHelper: locator()));

    // Firebase
    locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

    // Google Signin
    locator.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.standard());

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
            preferenceSettingsProvider: locator(),
            firebaseAuth: locator(),
            googleSignIn: locator()));

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
