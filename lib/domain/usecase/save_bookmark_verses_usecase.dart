import 'package:dartz/dartz.dart';
import 'package:hafizh/common/error/failure_response.dart';
import 'package:hafizh/domain/entity/detail_surah_entity.dart';
import 'package:hafizh/domain/repo/quran_repo.dart';

class SaveBookmarkVersesUseCase {
  QuranRepo repository;

  SaveBookmarkVersesUseCase({required this.repository});

  Future<Either<FailureResponse, String>> call(
      VerseEntity verseEntity, String surah) {
    return repository.saveBookmarkVerses(verseEntity, surah);
  }
}
