import 'package:flutter/material.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/ui/widget/atoms/star_badge_widget.dart';

class MoleculeSurahAppBarTitleWidget extends StatelessWidget {
  final String surah;
  final int? verse;
  final int? surahNumber;

  const MoleculeSurahAppBarTitleWidget(
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
            AtomStarBadgeWidget(
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
