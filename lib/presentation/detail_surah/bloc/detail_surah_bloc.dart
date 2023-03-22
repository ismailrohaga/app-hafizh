import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/domain/usecase/get_detail_surah_usecase.dart';
import 'package:hafizh/presentation/detail_surah/bloc/detail_surah_event.dart';
import 'package:hafizh/presentation/detail_surah/bloc/detail_surah_state.dart';

class DetailSurahBloc extends Bloc<DetailSurahEvent, DetailSurahState> {
  final GetDetailSurahUsecase getDetailSurahUsecase;

  DetailSurahBloc({
    required this.getDetailSurahUsecase,
  }) : super(DetailSurahState(statusSurahDetail: ViewData.initial())) {
    on<FetchDetailSurah>(_fetchDetailSurah);
  }
  void _fetchDetailSurah(
      FetchDetailSurah event, Emitter<DetailSurahState> emit) async {
    try {
      var surahNumber = event.number;

      emit(state.copyWith(
          statusSurahDetail: ViewData.loading(message: "Loading...")));

      final response = await getDetailSurahUsecase(surahNumber);

      response.fold(
        (faillure) => emit(state.copyWith(
            statusSurahDetail: ViewData.error(message: faillure.message))),
        (data) => emit(state.copyWith(
          statusSurahDetail: ViewData.loaded(data: data),
        )),
      );
    } catch (e) {
      emit(state.copyWith(
          statusSurahDetail: ViewData.error(message: e.toString())));
    }
  }
}
