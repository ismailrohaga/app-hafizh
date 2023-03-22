import 'package:flutter/material.dart';
import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ui/widget/molecules/molecules.dart';
import 'package:hafizh/domain/entity/surah_entity.dart';

class ListViewSurahWidget extends StatelessWidget {
  final List<SurahEntity> surah;

  const ListViewSurahWidget({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: surah.length,
      itemBuilder: (context, index) => SurahCardWidget(
        subtitle: "Number of Verses : ${surah[index].numberOfVerses}",
        name: surah[index].name.transliteration.id,
        number: surah[index].number,
        onTap: () => context.goNamed(NamedRoutes.detailSurahView),
      ),
    );
  }
}
