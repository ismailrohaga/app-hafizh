import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

import 'package:hafizh/common/ui/widget/atoms/atoms.dart';
import 'package:hafizh/common/ui/widget/molecules/molecules.dart';

class DashboardWidget extends StatelessWidget {
  final String backgroundImage;
  final HafizhButtonWidget? callToAction;
  final Widget contractWidget;

  const DashboardWidget({
    super.key,
    required this.backgroundImage,
    required this.contractWidget,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: contractWidget,
              ),
              const SizedBox(
                width: 12,
              ),
              const CircularPercentageIndicatorWidget(
                value: 0.8,
              )
            ],
          ),
          const SizedBox(
            height: SpacingConstant.lg,
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

class DashboardFullContractWidget extends StatelessWidget {
  const DashboardFullContractWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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

class DashboardSurahContractWidget extends StatelessWidget {
  const DashboardSurahContractWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SurahWithBadgeWidget(
          surah: 'Al-Mulk',
          surahNumber: 92,
        ),
        const SizedBox(
          height: SpacingConstant.md,
        ),
        Text(
          'You’re on the  5 day streaks !',
          style: context.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
