import 'package:dartz/dartz.dart';
import 'package:hafizh/common/error/failure_response.dart';
import 'package:hafizh/domain/entity/detail_surah_entity.dart';
import 'package:hafizh/domain/repo/quran_repo.dart';

class SaveLastReadUsecase {
  final QuranRepo repository;

  const SaveLastReadUsecase({required this.repository});

  Future<Either<FailureResponse, String>> call(
      DetailSurahEntity detailSurahEntity) {
    return repository.saveLastReadQuran(detailSurahEntity);
  }
}
