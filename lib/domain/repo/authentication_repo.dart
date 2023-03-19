import 'package:dartz/dartz.dart';
import 'package:hafizh/common/error/auth_error.dart';
import 'package:hafizh/domain/entity/user_entity.dart';

abstract class AuthenticationRepo {
  Future<Either<LogInWithGoogleFailure, UserEntity>> signInWithGoogle();
  Future<Either<LogOutFailure, void>> signOut();
}
