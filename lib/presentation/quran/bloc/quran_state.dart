import 'package:equatable/equatable.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/domain/entity/surah_entity.dart';

class QuranState extends Equatable {
  final ViewData<List<SurahEntity>> statusSurah;
  final String? query;
  final String? category;

  const QuranState(
      {required this.statusSurah, this.query, this.category = "surah"});

  QuranState copyWith(
      {ViewData<List<SurahEntity>>? statusSurah,
      String? query,
      String? category}) {
    return QuranState(
        statusSurah: statusSurah ?? this.statusSurah,
        query: query ?? this.query,
        category: category ?? this.category);
  }

  @override
  List<Object?> get props => [statusSurah, query, category];
}
