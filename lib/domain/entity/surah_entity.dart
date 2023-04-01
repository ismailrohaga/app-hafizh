import 'package:equatable/equatable.dart';

extension ListSurahEntityFilterByQueryExtension on List<SurahEntity> {
  List<SurahEntity> filterByQuery(String? query) {
    if (query == null || query.isEmpty) {
      return this;
    }

    return where((surah) {
      final surahName = surah.name.transliteration.id.toLowerCase();
      final surahNameTranslate = surah.numberOfVerses.toString();
      final surahNumber = surah.number.toString();
      final queryLowerCase = query.toLowerCase();

      return surahName.contains(queryLowerCase) ||
          surahNameTranslate.contains(queryLowerCase) ||
          surahNumber.contains(queryLowerCase);
    }).toList();
  }
}

class SurahResponseEntity extends Equatable {
  const SurahResponseEntity({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  final int code;
  final String status;
  final String message;
  final List<SurahEntity> data;

  @override
  List<Object?> get props => [code, status, message, data];
}

class SurahEntity extends Equatable {
  const SurahEntity({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
  });

  final int number;
  final int sequence;
  final int numberOfVerses;
  final NameEntity name;
  final RevelationEntity revelation;
  final TafsirEntity tafsir;

  @override
  List<Object?> get props =>
      [number, sequence, numberOfVerses, name, revelation, tafsir];
}

class NameEntity extends Equatable {
  const NameEntity({
    required this.short,
    required this.long,
    required this.transliteration,
    required this.translation,
  });

  final String short;
  final String long;
  final TranslationEntity transliteration;
  final TranslationEntity translation;

  @override
  List<Object?> get props => [short, long, transliteration, translation];
}

class TranslationEntity extends Equatable {
  const TranslationEntity({
    required this.en,
    required this.id,
  });

  final String en;
  final String id;

  @override
  List<Object?> get props => [en, id];
}

class RevelationEntity extends Equatable {
  const RevelationEntity({
    required this.arab,
    required this.en,
    required this.id,
  });

  final String arab;
  final String en;
  final String id;

  @override
  List<Object?> get props => [arab, en, id];
}

class TafsirEntity extends Equatable {
  const TafsirEntity({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}
