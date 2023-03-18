import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/common/ui/widget/organisms/appbar/scaffold_with_app_bar.dart';

class DetailSurahView extends StatelessWidget {
  const DetailSurahView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithDetailSurahAppBar(
        surah: "Surah Al-Baqarah",
        verse: 1,
        surahNumber: 2,
        onBackPressed: () => context.go(NamedRoutes.homeView),
        child: const Center(child: Text("DetailSurah View")));
  }
}
