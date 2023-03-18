import 'package:flutter/material.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/ui/widget/atoms/star_badge_widget.dart';

class SurahAppBarTitle extends StatelessWidget {
  final String surah;
  final int? verse;
  final int? surahNumber;

  const SurahAppBarTitle(
      {super.key, required this.surah, this.verse, this.surahNumber = 0});

  @override
  Widget build(BuildContext context) {
    final verseText = verse != null ? "Ayah $verse" : "";

    print("MoleculeSurahAppBarTitle build");

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
