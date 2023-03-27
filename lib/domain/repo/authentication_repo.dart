import 'package:dartz/dartz.dart';
import 'package:hafizh/common/error/auth_error.dart';
import 'package:hafizh/domain/entity/user_entity.dart';

abstract class AuthenticationRepo {
  Future<Either<LogInWithGoogleFailure, UserEntity>> signInWithGoogle();
  Future<Either<LogInWithEmailAndPasswordFailure, UserEntity>>
      signInWithEmailAndPassword(String email, String password);
  Future<Either<SignUpWithEmailAndPasswordFailure, UserEntity>>
      signUpWithEmailAndPassword({
    required String email,
    required String name,
    required String password,
  });
  Future<Either<LogOutFailure, void>> signOut();
  Stream<UserEntity> get user;
  UserEntity get currentUser;
}
