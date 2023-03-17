import 'package:dartz/dartz.dart';
import 'package:hafizh/common/error/failure_response.dart';
import 'package:hafizh/domain/entity/surah_entity.dart';
import 'package:hafizh/domain/repo/quran_repo.dart';

class GetSurahUsecase {
  final QuranRepo repository;

  const GetSurahUsecase({required this.repository});

  Future<Either<FailureResponse, List<SurahEntity>>> call() {
    return repository.getAllSurah();
  }
}
