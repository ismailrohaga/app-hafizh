import 'package:dartz/dartz.dart';
import 'package:hafizh/common/error/failure_response.dart';
import 'package:hafizh/domain/entity/last_read_surah_entity.dart';
import 'package:hafizh/domain/repo/quran_repo.dart';

class GetLastReadUsecase {
  final QuranRepo repository;

  const GetLastReadUsecase({required this.repository});

  Future<Either<FailureResponse, List<LastReadSurahEntity>>> call() {
    return repository.getLastReadQuran();
  }
}
