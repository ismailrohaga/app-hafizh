import 'package:flutter/material.dart';
import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ui/widget/atoms/atoms.dart';
import 'package:hafizh/common/ui/widget/molecules/appbar/surah_appbar_title_widget.dart';
import 'package:hafizh/common/ui/widget/organisms/organisms.dart';

class DetailSurahView extends StatelessWidget {
  const DetailSurahView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithDetailSurahAppBar(
        title: const SurahAppBarTitleWidget(
            surahWithBadgeWidget:
                SurahWithBadgeWidget(surah: "Surah Al-Baqarah", surahNumber: 2),
            verse: 1),
        onBackPressed: () => context.canPop()
            ? context.pop()
            : context.goNamed(NamedRoutes.quranView),
        child: const Center(child: Text("DetailSurah View")));
  }
}
