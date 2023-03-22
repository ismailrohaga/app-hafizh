import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/ui/widget/atoms/atoms.dart';

class SurahAppBarTitleWidget extends StatelessWidget {
  final int? verse;
  final bool? loading;
  final SurahWithBadgeWidget surahWithBadgeWidget;

  const SurahAppBarTitleWidget(
      {super.key,
      this.verse,
      required this.surahWithBadgeWidget,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    final verseText = verse != null ? "Ayah $verse" : "";

    if (loading ?? false) {
      return const AppBarWithShimmerEffectWidget();
    }

    return Column(
      children: [
        surahWithBadgeWidget,
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
                const StarBadgeWidget(
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
