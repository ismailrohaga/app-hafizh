import 'package:equatable/equatable.dart';

abstract class QuranEvent extends Equatable {
  const QuranEvent();

  @override
  List<Object?> get props => [];
}

class FetchSurah extends QuranEvent {}

class FilterSurah extends QuranEvent {
  final String query;

  const FilterSurah({required this.query});

  @override
  List<Object?> get props => [query];
}
