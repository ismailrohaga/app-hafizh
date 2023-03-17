import 'package:dartz/dartz.dart';
import 'package:hafizh/common/error/failure_response.dart';
import 'package:hafizh/domain/entity/bookmark_verses_entity.dart';
import 'package:hafizh/domain/repo/quran_repo.dart';

class GetBookmarkVersesUsecase {
  final QuranRepo repository;

  GetBookmarkVersesUsecase({required this.repository});

  Future<Either<FailureResponse, List<BookmarkVersesEntity>>> call() {
    return repository.getBookmarkVerses();
  }
}
