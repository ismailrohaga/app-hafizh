import 'package:dartz/dartz.dart';
import 'package:hafizh/common/error/failure_response.dart';
import 'package:hafizh/domain/entity/detail_surah_entity.dart';
import 'package:hafizh/domain/repo/quran_repo.dart';

class GetDetailSurahUsecase {
  final QuranRepo repository;

  const GetDetailSurahUsecase({required this.repository});

  Future<Either<FailureResponse, DetailSurahEntity>> call(int id) {
    return repository.getDetailSurah(id);
  }
}
