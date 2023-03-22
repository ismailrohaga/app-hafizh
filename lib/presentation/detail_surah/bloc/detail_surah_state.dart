import 'package:equatable/equatable.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/domain/entity/detail_surah_entity.dart';

class DetailSurahState extends Equatable {
  final ViewData<DetailSurahEntity> statusSurahDetail;

  const DetailSurahState({required this.statusSurahDetail});

  DetailSurahState copyWith({
    ViewData<DetailSurahEntity>? statusSurahDetail,
    List<String>? cacheSurah,
  }) {
    return DetailSurahState(
        statusSurahDetail: statusSurahDetail ?? this.statusSurahDetail);
  }

  @override
  List<Object?> get props => [statusSurahDetail];
}
