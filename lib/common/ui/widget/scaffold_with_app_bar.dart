import 'package:flutter/material.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/ui/widget/star_badge_widget.dart';

class ScaffoldWithDetailSurahAppBar extends StatelessWidget {
  final Widget child;
  final String surah;
  final int? verse;
  final int? surahNumber;

  final void Function()? onBackPressed;

  const ScaffoldWithDetailSurahAppBar(
      {super.key,
      required this.child,
      required this.surah,
      this.verse,
      this.onBackPressed,
      this.surahNumber = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 80,
          title: SurahAppBarTitle(
            surah: surah,
            verse: verse,
            surahNumber: surahNumber,
          ),
          leading: BackButton(
            color: context.theme.colorScheme.onSecondary,
            onPressed: onBackPressed,
          )),
      body: child,
    );
  }
}

class SurahAppBarTitle extends StatelessWidget {
  final String surah;
  final int? verse;
  final int? surahNumber;

  const SurahAppBarTitle(
      {super.key, required this.surah, this.verse, this.surahNumber = 0});

  @override
  Widget build(BuildContext context) {
    final verseText = verse != null ? "Ayah $verse" : "";

    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(surah, style: context.theme.typography.white.titleMedium),
            const SizedBox(
              width: 4,
            ),
            StarBadgeWidget(
              count: surahNumber,
            ),
          ],
        ),
        if (verse != null)
          Text(verseText, style: context.theme.textTheme.titleSmall),
      ],
    );
  }
}
