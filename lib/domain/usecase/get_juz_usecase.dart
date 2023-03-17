import 'package:dartz/dartz.dart';
import 'package:hafizh/common/error/failure_response.dart';
import 'package:hafizh/domain/entity/juz_entity.dart';
import 'package:hafizh/domain/repo/quran_repo.dart';

class GetJuzUsecase {
  final QuranRepo repository;

  const GetJuzUsecase({required this.repository});

  Future<Either<FailureResponse, JuzEntity>> call(int id) {
    return repository.getJuz(id);
  }
}
