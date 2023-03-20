import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/domain/usecase/get_surah_usecase.dart';

import 'bloc.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  final GetSurahUsecase getSurahUsecase;

  QuranBloc({required this.getSurahUsecase})
      : super(QuranState(statusSurah: ViewData.initial())) {
    on<FetchSurah>(fetchSurah);
  }

  void fetchSurah(FetchSurah event, Emitter<QuranState> emit) async {
    try {
      emit(state.copyWith(
        statusSurah: ViewData.loading(message: 'Loading Fetch Surah...'),
      ));

      final response = await getSurahUsecase.call();

      if (response.length() == 0) {
        emit(state.copyWith(
            statusSurah: ViewData.noData(message: "Surah is Empty")));
      } else {
        response.fold(
            (failure) => emit(state.copyWith(
                statusSurah: ViewData.error(message: failure.message))),
            (data) =>
                emit(state.copyWith(statusSurah: ViewData.loaded(data: data))));
      }
    } catch (e) {
      emit(state.copyWith(
          statusSurah: ViewData.error(message: "Error Fetch Surah: $e")));
    }
  }
}
