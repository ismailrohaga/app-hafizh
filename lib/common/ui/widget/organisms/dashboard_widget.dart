import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

import 'package:hafizh/common/ui/widget/atoms/atoms.dart';
import 'package:hafizh/common/ui/widget/molecules/molecules.dart';

class DashboardWidget extends StatelessWidget {
  final String backgroundImage;
  final HafizhButtonWidget? callToAction;

  const DashboardWidget({
    super.key,
    required this.backgroundImage,
    this.callToAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 42, horizontal: ScreenPaddingConstant.horizontal),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(backgroundImage), fit: BoxFit.cover)),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Expanded(
                  child: DashboardUserProgressWidget(),
                ),
                SizedBox(
                  width: 12,
                ),
                CircularPercentageIndicatorWidget(
                  value: 0.8,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Row(
            children: [
              Expanded(
                child: callToAction ?? Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// TODO: Need to be injected from the outside @mizard
class DashboardUserProgressWidget extends StatelessWidget {
  const DashboardUserProgressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Hi Bayek',
          style: context.textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        const SurahWithBadgeWidget(
          surah: 'Al-Mulk',
          surahNumber: 92,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'Today’s Tahfidz. Ayah 16',
          style: context.textTheme.labelLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        const HorizontalProgressBarIndicator(
          count: 3,
          value: 2,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Great progress! You\'ll finish memorizing al-mulk in 5 days at this rate!',
          style: context.textTheme.labelSmall,
        ),
      ],
    );
  }
}
