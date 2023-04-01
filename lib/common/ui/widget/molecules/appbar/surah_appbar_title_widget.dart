import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ui/widget/atoms/atoms.dart';

class SurahAppBarTitleWidget extends StatelessWidget {
  final bool? loading;
  final SurahWithBadgeWidget title;
  final Widget? subtitle;

  const SurahAppBarTitleWidget(
      {super.key, this.subtitle, required this.title, this.loading = false});

  @override
  Widget build(BuildContext context) {
    if (loading ?? false) {
      return const AppBarWithShimmerEffectWidget();
    }

    return Column(
      children: [
        title,
        if (subtitle != null) subtitle!,
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
                SizedBox(
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
