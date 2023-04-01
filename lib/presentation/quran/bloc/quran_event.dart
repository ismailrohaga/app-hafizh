import 'package:equatable/equatable.dart';

abstract class QuranEvent extends Equatable {
  const QuranEvent();

  @override
  List<Object?> get props => [];
}

class FetchSurah extends QuranEvent {
  final bool? forceRefresh;

  const FetchSurah({this.forceRefresh});
}

class SearchSurahChanged extends QuranEvent {
  final String query;

  const SearchSurahChanged({required this.query});

  @override
  List<Object?> get props => [query];
}

class CategoryChanged extends QuranEvent {
  final String category;

  const CategoryChanged({required this.category});

  @override
  List<Object?> get props => [category];
}
