import 'package:hafizh/common/dependencies/dependencies.dart';

import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/domain/usecase/get_surah_usecase.dart';

import 'bloc.dart';

const _duration = Duration(milliseconds: 500);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  final GetSurahUsecase getSurahUsecase;

  QuranBloc({required this.getSurahUsecase})
      : super(QuranState(statusSurah: ViewData.initial())) {
    on<FetchSurah>(_fetchSurah);
    on<SearchSurahChanged>(_searchSurahChanged,
        transformer: debounce(_duration));
    on<CategoryChanged>(_categoryChanged);
  }

  void _categoryChanged(CategoryChanged event, Emitter<QuranState> emit) {
    emit(state.copyWith(category: event.category));
  }

  void _fetchSurah(FetchSurah event, Emitter<QuranState> emit) async {
    try {
      final hasData = state.statusSurah.status.isHasData;
      final forceRefresh = event.forceRefresh ?? false;

      if (hasData && !forceRefresh) {
        return;
      }

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

  void _searchSurahChanged(
      SearchSurahChanged event, Emitter<QuranState> emit) async {
    emit(state.copyWith(query: event.query));
  }
}
