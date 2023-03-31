import 'package:dartz/dartz.dart';

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

  // This function is used to get the user details from the Firebase.
  // It uses the authStateChanges() function to get the user details from Firebase.
  // The asyncMap() function is used to map the user details to the UserEntity class.
  // The asyncMap() function is also used to convert the firebaseUser to user.
  // The toUserEntity() function is used to convert the firebaseUser to user.
  // The catch block is used to catch any exception that might occur and return an empty UserEntity object.
  @override
  Stream<UserEntity> get user =>
      _firebaseAuth.authStateChanges().asyncMap(_authStateChanges);

  Future<UserEntity> _authStateChanges(User? firebaseUser) async {
    if (firebaseUser == null) {
      _preferenceSettingsProvider.setUser(UserEntity.empty);
      return UserEntity.empty;
    }

    final userPrefs = _preferenceSettingsProvider.user;
    if (userPrefs.isEmpty) {
      final userEntity = firebaseUser.toUserEntity;
      final userRemote =
          await _userRemoteDataSource.getUserByEmail(userEntity.email);

      if (userRemote == null) {
        _preferenceSettingsProvider.setUser(userEntity);
        return userEntity;
      }

      _preferenceSettingsProvider.setUser(userRemote.toEntity());
      return userRemote.toEntity();
    }

    return userPrefs;
  }

  // via Firebase. Otherwise, return the user entity that was saved in shared preferences.
  @override
  UserEntity get currentUser => _preferenceSettingsProvider.user;

  AuthCredential _getGoogleCredential(GoogleSignInAuthentication googleAuth) =>
      GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

  /// Implements the logic for signing in with Google.
  /// If the user is not found in the database, it creates a new user
  @override
  Future<Either<LogInWithGoogleFailure, UserEntity>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;

      final credential = _getGoogleCredential(googleAuth);

      final user = await _firebaseAuth.signInWithCredential(credential);
      final userRemote = await _userRemoteDataSource
          .getUserByEmail(user.user?.toUserEntity.email ?? '');

      if (userRemote == null) {
        await _userRemoteDataSource.createUser(UserDTO.fromEntity(
          user.user?.toUserEntity ?? UserEntity.empty,
        ));
      }

      final userEntity =
          userRemote?.toEntity() ?? user.user?.toUserEntity ?? UserEntity.empty;

      return Right(
        userEntity,
      );
    } on FirebaseAuthException catch (e) {
      return Left(LogInWithGoogleFailure.fromCode(e.code));
    } catch (_) {
      return const Left(LogInWithGoogleFailure());
    }
  }

  // Sign in with email and password using Firebase Authentication.
  // If the sign in is successful, return the user entity.
  // If the user does not exist, return the user-not-found failure code.
  // If the sign in fails, return the appropriate failure code.
  @override
  Future<Either<LogInWithEmailAndPasswordFailure, UserEntity>>
      signInWithEmailAndPassword(String email, String password) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = response.user?.toUserEntity ?? UserEntity.empty;
      final userRemote = await _userRemoteDataSource.getUserByEmail(user.email);

      if (userRemote == null) {
        return Left(
            LogInWithEmailAndPasswordFailure.fromCode('user-not-found'));
      }

      return Right(userRemote.toEntity());
    } on FirebaseAuthException catch (e) {
      return Left(LogInWithEmailAndPasswordFailure.fromCode(e.code));
    }
  }

  /// This method is used to sign up a new user with email and password.
  /// If the sign up is successful, the user's [UserEntity] is returned.
  /// Otherwise, a [SignUpWithEmailAndPasswordFailure] is thrown.
  /// This method uses the [FirebaseAuth] and [UserRemoteDataSource] classes.
  /// See the documentation for each of these classes for more information.
  @override
  Future<Either<SignUpWithEmailAndPasswordFailure, UserEntity>>
      signUpWithEmailAndPassword({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      final userEntity = response.user?.toUserEntity ?? UserEntity.empty;

      final userDTO = UserDTO.fromEntity(userEntity.copyWith(
        name: name,
        photo: defaultImageURL,
      ));
      final userRemote = await _userRemoteDataSource.createUser(userDTO);

      if (userRemote == null) {
        return const Left(SignUpWithEmailAndPasswordFailure());
      }

      return Right(userRemote.toEntity());
    } on FirebaseAuthException catch (e) {
      return Left(SignUpWithEmailAndPasswordFailure.fromCode(e.code));
    } on FirebaseException catch (e) {
      return Left(SignUpWithEmailAndPasswordFailure.fromCode(e.code));
    } catch (_) {
      return const Left(SignUpWithEmailAndPasswordFailure());
    }
  }

  /// This function will sign out the user from both google and firebase.
  ///
  /// @return Right(null) if the user successfully signs out of both google and firebase.
  /// @return Left(LogOutFailure()) if the user fails to sign out of both google and firebase.
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
