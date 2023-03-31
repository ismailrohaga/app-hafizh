import 'package:dartz/dartz.dart';
import 'package:hafizh/common/error/auth_error.dart';
import 'package:hafizh/domain/entity/user_entity.dart';
import 'package:hafizh/domain/repo/authentication_repo.dart';

class SignInWithEmailAndPasswordUseCase {
  final AuthenticationRepo repository;

  SignInWithEmailAndPasswordUseCase({required this.repository});

  Future<Either<LogInWithEmailAndPasswordFailure, UserEntity>> call(
      String email, String password) {
    return repository.signInWithEmailAndPassword(email, password);
  }
}
