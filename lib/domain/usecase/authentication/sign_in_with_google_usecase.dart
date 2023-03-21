import 'package:dartz/dartz.dart';
import 'package:hafizh/common/error/auth_error.dart';
import 'package:hafizh/domain/entity/user_entity.dart';
import 'package:hafizh/domain/repo/authentication_repo.dart';

class SignInWithGoogleUseCase {
  final AuthenticationRepo repository;

  SignInWithGoogleUseCase({required this.repository});

  Future<Either<LogInWithGoogleFailure, UserEntity>> call() {
    return repository.signInWithGoogle();
  }
}
