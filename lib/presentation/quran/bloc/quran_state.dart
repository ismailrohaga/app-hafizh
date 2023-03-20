import 'package:equatable/equatable.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/domain/entity/surah_entity.dart';

class QuranState extends Equatable {
  final ViewData<List<SurahEntity>> statusSurah;
  final List<SurahEntity> filteredSurah;
  final String? query;

  const QuranState(
      {required this.statusSurah, this.filteredSurah = const [], this.query});

  QuranState copyWith(
      {ViewData<List<SurahEntity>>? statusSurah,
      List<SurahEntity>? filteredSurah,
      String? query}) {
    return QuranState(
        statusSurah: statusSurah ?? this.statusSurah,
        filteredSurah: filteredSurah ?? this.filteredSurah,
        query: query ?? this.query);
  }

  @override
  List<Object?> get props => [statusSurah, filteredSurah, query];
}
