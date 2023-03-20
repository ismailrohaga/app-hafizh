import 'package:hafizh/common/error/auth_error.dart';
import 'package:hafizh/common/ext/firebase_auth_ext.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';
import 'package:hafizh/domain/repo/authentication_repo.dart';
import 'package:hafizh/domain/entity/user_entity.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepo {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final PreferenceSettingsProvider preferenceSettingsProvider;

  AuthenticationRepositoryImpl({
    required this.preferenceSettingsProvider,
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  @visibleForTesting
  bool isWeb = kIsWeb;

  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  @override
  Stream<UserEntity> get user {
    return firebaseAuth.authStateChanges().map(
      (firebaseUser) {
        // If the firebaseUser is null, return an empty user.
        final user = firebaseUser?.toUserEntity ?? UserEntity.empty;

        // TODO: Save the user to shared preferences @ismail
        preferenceSettingsProvider.setUser(user);

        return user;
      },
    );
  }

  @override
  UserEntity get currentUser {
    final firebaseUser = firebaseAuth.currentUser;
    return firebaseUser?.toUserEntity ?? preferenceSettingsProvider.user;
  }

  @override
  Future<Either<LogInWithGoogleFailure, UserEntity>> signInWithGoogle() async {
    try {
      late final AuthCredential credential;

      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;

      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final user = await firebaseAuth.signInWithCredential(credential);

      return Right(
        user.user?.toUserEntity ?? UserEntity.empty,
      );
    } on FirebaseAuthException catch (e) {
      return Left(LogInWithGoogleFailure.fromCode(e.code));
    } catch (_) {
      return const Left(LogInWithGoogleFailure());
    }
  }

  @override
  Future<Either<LogOutFailure, void>> signOut() async {
    try {
      await Future.wait([
        firebaseAuth.signOut(),
        googleSignIn.signOut(),
      ]);

      return const Right(null);
    } catch (e) {
      return Left(LogOutFailure());
    }
  }
}
