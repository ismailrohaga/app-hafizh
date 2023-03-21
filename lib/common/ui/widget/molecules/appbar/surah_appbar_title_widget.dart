import 'package:flutter/material.dart';
import 'package:hafizh/common/const/spacing_constant.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/ui/widget/atoms/star_badge_widget.dart';

class MoleculeSurahAppBarTitleWidget extends StatelessWidget {
  final String surah;
  final int? verse;
  final int? surahNumber;
  final bool? loading;

  const MoleculeSurahAppBarTitleWidget(
      {super.key,
      required this.surah,
      this.verse,
      this.surahNumber = 0,
      this.loading});

  @override
  Widget build(BuildContext context) {
    final verseText = verse != null ? "Ayah $verse" : "";

    if (loading ?? false) {
      return const AppBarWithShimmerEffectWidget();
    }

    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(surah, style: context.textTheme.titleLarge),
            const SizedBox(
              width: SpacingConstant.sm,
            ),
            AtomStarBadgeWidget(
              count: surahNumber,
            ),
          ],
        ),
        if (verse != null)
          Text(verseText, style: context.textTheme.titleMedium),
      ],
    );
  }
}

class AppBarWithShimmerEffectWidget extends StatelessWidget {
  const AppBarWithShimmerEffectWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[500]!,
        highlightColor: Colors.grey[50]!,
        enabled: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 10,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: SpacingConstant.xs,
                ),
                const AtomStarBadgeWidget(
                  count: 0,
                ),
              ],
            ),
            Container(
              width: 50,
              height: 6,
              color: Colors.white,
            ),
          ],
        ));
  }
}
