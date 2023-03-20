import 'package:equatable/equatable.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/domain/entity/surah_entity.dart';

class QuranState extends Equatable {
  final ViewData<List<SurahEntity>> statusSurah;

  const QuranState({required this.statusSurah});

  QuranState copyWith({ViewData<List<SurahEntity>>? statusSurah}) {
    return QuranState(statusSurah: statusSurah ?? this.statusSurah);
  }

  @override
  List<Object?> get props => [statusSurah];
}
