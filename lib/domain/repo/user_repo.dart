import 'package:dartz/dartz.dart';
import 'package:hafizh/common/error/failure_response.dart';
import 'package:hafizh/domain/entity/user_entity.dart';

abstract class UserRepo {
  Future<Either<FailureResponse, UserEntity>> getUserByEmail(String email);
  Future<Either<FailureResponse, void>> createUser(UserEntity user);
}
