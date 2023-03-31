import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ui/widget/molecules/molecules.dart';
import 'package:hafizh/domain/entity/surah_entity.dart';

class ListViewSurahWidget extends StatelessWidget {
  final List<SurahEntity> surah;

  const ListViewSurahWidget({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) =>
          SizedBox(height: SpacingConstant.sm),
      padding: const EdgeInsets.all(0),
      itemCount: surah.length,
      itemBuilder: (context, index) {
        final data = surah[index];
        final name = data.name.transliteration.id;
        final numberOfVerses = data.numberOfVerses;
        final number = data.number;

        return SurahCardWidget(
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
