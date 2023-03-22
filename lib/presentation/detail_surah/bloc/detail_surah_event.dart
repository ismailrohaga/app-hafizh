import 'package:hafizh/common/dependencies/dependencies.dart';

abstract class DetailSurahEvent extends Equatable {
  final int number;
  const DetailSurahEvent(this.number);
}

class FetchDetailSurah extends DetailSurahEvent {
  const FetchDetailSurah(super.number);

  @override
  List<Object?> get props => [number];
}
