import 'package:dartz/dartz.dart';
import 'package:hafizh/common/error/failure_response.dart';
import 'package:hafizh/domain/entity/bookmark_verses_entity.dart';
import 'package:hafizh/domain/entity/detail_surah_entity.dart';
import 'package:hafizh/domain/entity/juz_entity.dart';
import 'package:hafizh/domain/entity/last_read_surah_entity.dart';
import 'package:hafizh/domain/entity/surah_entity.dart';

abstract class QuranRepo {
  Future<Either<FailureResponse, List<SurahEntity>>> getAllSurah();
  Future<Either<FailureResponse, JuzEntity>> getJuz(int id);
  Future<Either<FailureResponse, DetailSurahEntity>> getDetailSurah(int id);
  // LAST READ QURAN
  Future<Either<FailureResponse, String>> saveLastReadQuran(
      DetailSurahEntity detailSurahEntity);
  Future<Either<FailureResponse, String>> updateLastReadQuran(
      DetailSurahEntity detailSurahEntity);
  Future<Either<FailureResponse, List<LastReadSurahEntity>>> getLastReadQuran();
  // BOOKMARK VERSES
  Future<Either<FailureResponse, String>> saveBookmarkVerses(
      VerseEntity verseEntity, String surah);
  Future<Either<FailureResponse, String>> removeBookmarkVerses(
      VerseEntity verseEntity, String surah);
  Future<Either<FailureResponse, List<BookmarkVersesEntity>>>
      getBookmarkVerses();
  Future<bool> isAddedBookmarkVerses(int id);
}
