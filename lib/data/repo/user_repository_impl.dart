import 'package:hafizh/data/data_source/user_remote_data_source.dart';
import 'package:hafizh/data/model/dto/user_dto.dart';
import 'package:hafizh/domain/entity/user_entity.dart';
import 'package:hafizh/common/error/failure_response.dart';
import 'package:dartz/dartz.dart';
import 'package:hafizh/domain/repo/user_repo.dart';

class UserRepositoryImpl implements UserRepo {
  UserRepositoryImpl({
    required UserRemoteDataSource userRemoteDataSource,
  })  : _userRemoteDataSource = userRemoteDataSource,
        super();

  final UserRemoteDataSource _userRemoteDataSource;

  @override
  Future<Either<FailureResponse, UserEntity>> getUserByEmail(
      String email) async {
    try {
      final result = await _userRemoteDataSource.getUserByEmail(email);
      final userEntity = result?.toEntity() ?? UserEntity.empty;

      return Right(userEntity);
    } catch (e) {
      return Left(FailureResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, void>> createUser(UserEntity user) async {
    try {
      await _userRemoteDataSource.createUser(UserDTO.fromEntity(user));

      return const Right(null);
    } catch (e) {
      return Left(FailureResponse(message: e.toString()));
    }
  }
}
