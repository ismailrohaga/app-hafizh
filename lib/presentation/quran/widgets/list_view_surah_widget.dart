import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/common/ui/widget/molecules/card/surah_card_widget.dart';
import 'package:hafizh/domain/entity/surah_entity.dart';

class ListViewSurahWidget extends StatelessWidget {
  final List<SurahEntity> surah;

  const ListViewSurahWidget({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: surah.length,
      itemBuilder: (context, index) {
        final data = surah[index];
        final name = data.name.transliteration.id;
        final numberOfVerses = data.numberOfVerses;
        final number = data.number;

        return MoleculeSurahCardWidget(
          subtitle: "Number of Verses : $numberOfVerses",
          name: name,
          number: number,
          onTap: () => context.goNamed(NamedRoutes.detailSurahView,
              params: {'id': number.toString()}),
        );
      },
    );
  }
}
