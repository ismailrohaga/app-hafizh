import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/domain/usecase/get_surah_usecase.dart';

import 'bloc.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  final GetSurahUsecase getSurahUsecase;

  QuranBloc({required this.getSurahUsecase})
      : super(QuranState(
            statusSurah: ViewData.initial(), filteredSurah: const [])) {
    on<FetchSurah>(_fetchSurah);
    on<FilterSurah>(_filterSurah);
  }

  void _fetchSurah(FetchSurah event, Emitter<QuranState> emit) async {
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
            (data) => emit(state.copyWith(
                statusSurah: ViewData.loaded(data: data),
                filteredSurah: data)));
      }
    } catch (e) {
      emit(state.copyWith(
          statusSurah: ViewData.error(message: "Error Fetch Surah: $e")));
    }
  }

  void _filterSurah(FilterSurah event, Emitter<QuranState> emit) async {
    emit(state.copyWith(query: event.query));

    final query = event.query;
    final surah = state.statusSurah.data;

    if (query.isEmpty) {
      emit(state.copyWith(filteredSurah: surah));
    } else {
      final filteredSurah = surah!.where((surah) {
        final surahName = surah.name.transliteration.id.toLowerCase();
        final surahNameTranslate = surah.numberOfVerses.toString();
        final surahNumber = surah.number.toString();
        final queryLowerCase = query.toLowerCase();

        return surahName.contains(queryLowerCase) ||
            surahNameTranslate.contains(queryLowerCase) ||
            surahNumber.contains(queryLowerCase);
      }).toList();

      emit(state.copyWith(filteredSurah: filteredSurah));
    }
  }
}
