import 'package:hafizh/domain/repo/quran_repo.dart';

class StatusBookmarkVerseUsecase {
  final QuranRepo repository;

  StatusBookmarkVerseUsecase({required this.repository});

  Future<bool> call(int id) async {
    return repository.isAddedBookmarkVerses(id);
  }
}
