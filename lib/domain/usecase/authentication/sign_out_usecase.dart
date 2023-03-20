import 'package:dartz/dartz.dart';
import 'package:hafizh/common/error/auth_error.dart';
import 'package:hafizh/domain/repo/authentication_repo.dart';

class SignOutUseCase {
  final AuthenticationRepo repository;

  SignOutUseCase({required this.repository});

  Future<Either<LogOutFailure, void>> call() {
    return repository.signOut();
  }
}
