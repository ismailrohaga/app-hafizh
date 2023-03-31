import 'package:dartz/dartz.dart';
import 'package:hafizh/common/error/auth_error.dart';
import 'package:hafizh/domain/entity/user_entity.dart';
import 'package:hafizh/domain/repo/authentication_repo.dart';

class SignUpWithEmailAndPasswordUseCase {
  final AuthenticationRepo _repository;

  SignUpWithEmailAndPasswordUseCase({required AuthenticationRepo repository})
      : _repository = repository;

  Future<Either<SignUpWithEmailAndPasswordFailure, UserEntity>> call({
    required String email,
    required String name,
    required String password,
  }) async {
    return _repository.signUpWithEmailAndPassword(
      email: email,
      name: name,
      password: password,
    );
  }
}
