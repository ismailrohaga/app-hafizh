import 'package:flutter/material.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/ui/widget/atoms/surah_with_badge_widget.dart';

class SurahAppBarTitleWidget extends StatelessWidget {
  final int? verse;
  final SurahWithBadgeWidget surahWithBadgeWidget;

  const SurahAppBarTitleWidget(
      {super.key, this.verse, required this.surahWithBadgeWidget});

  @override
  Widget build(BuildContext context) {
    final verseText = verse != null ? "Ayah $verse" : "";

    return Column(
      children: [
        surahWithBadgeWidget,
        if (verse != null)
          Text(verseText, style: context.textTheme.titleMedium),
      ],
    );
  }
}
