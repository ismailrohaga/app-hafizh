import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/error/auth_error.dart';
import 'package:hafizh/common/ext/firebase_auth_ext.dart';
import 'package:hafizh/common/provider/provider.dart';
import 'package:hafizh/data/data_source/user_remote_data_source.dart';
import 'package:hafizh/data/model/dto/user_dto.dart';
import 'package:hafizh/domain/repo/authentication_repo.dart';
import 'package:hafizh/domain/entity/user_entity.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepo {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final UserRemoteDataSource _userRemoteDataSource;
  final PreferenceSettingsProvider _preferenceSettingsProvider;

  AuthenticationRepositoryImpl({
    required PreferenceSettingsProvider preferenceSettingsProvider,
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
    required UserRemoteDataSource userRemoteDataSource,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn,
        _userRemoteDataSource = userRemoteDataSource,
        _preferenceSettingsProvider = preferenceSettingsProvider,
        super();

  @visibleForTesting
  bool isWeb = kIsWeb;

  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  @override
  Stream<UserEntity> get user {
    return _firebaseAuth.authStateChanges().map(
      (firebaseUser) {
        final user = firebaseUser?.toUserEntity ?? UserEntity.empty;

        _preferenceSettingsProvider.setUser(user);

        return user;
      },
    );
  }

  @override
  UserEntity get currentUser {
    final firebaseUser = _firebaseAuth.currentUser;
    return firebaseUser?.toUserEntity ?? _preferenceSettingsProvider.user;
  }

  @override
  Future<Either<LogInWithGoogleFailure, UserEntity>> signInWithGoogle() async {
    try {
      late final AuthCredential credential;

      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;

      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final user = await _firebaseAuth.signInWithCredential(credential);

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
  Future<Either<LogInWithEmailAndPasswordFailure, UserEntity>>
      signInWithEmailAndPassword(String email, String password) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = response.user?.toUserEntity ?? UserEntity.empty;

      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(LogInWithEmailAndPasswordFailure.fromCode(e.code));
    }
  }

  @override
  Future<Either<SignUpWithEmailAndPasswordFailure, UserEntity>>
      signUpWithEmailAndPassword(String email, String password) async {
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      final user = response.user?.toUserEntity ?? UserEntity.empty;

      await _userRemoteDataSource.createUser(UserDTO.fromEntity(user));

      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(SignUpWithEmailAndPasswordFailure.fromCode(e.code));
    } catch (_) {
      return const Left(SignUpWithEmailAndPasswordFailure());
    }
  }

  @override
  Future<Either<LogOutFailure, void>> signOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);

      return const Right(null);
    } catch (e) {
      return Left(LogOutFailure());
    }
  }
}
