import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/ui/app_colors.dart';
import 'package:hafizh/common/ui/widget/atoms/surah_with_badge_widget.dart';

class SliverTahfidzHistoryCardWidget extends StatelessWidget {
  const SliverTahfidzHistoryCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 20, horizontal: ScreenPaddingConstant.horizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HistoryResultOfTahfidzWidget(),
              MemorizedInfoWidget(
                juzMemorizedCount: '2',
                surahMemorizedCount: '102',
              ),
            ],
          )),
    );
  }
}

class MemorizedInfoWidget extends StatelessWidget {
  final String juzMemorizedCount;
  final String surahMemorizedCount;

  const MemorizedInfoWidget({
    super.key,
    this.juzMemorizedCount = '0',
    this.surahMemorizedCount = '0',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 22, top: 12, right: 22, bottom: 22),
      decoration: const BoxDecoration(
        color: AppColors.kLightDeepGreen,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(CircularConstant.lg),
            bottomRight: Radius.circular(CircularConstant.lg)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          MemorizedResultCountWidget(
            image: AssetConstant.quranOneImage,
            title: 'Juz Memorized',
            count: juzMemorizedCount,
          ),
          MemorizedResultCountWidget(
            image: AssetConstant.quranTwoImage,
            title: 'Surah Memorized',
            count: surahMemorizedCount,
          ),
        ],
      ),
    );
  }
}

class MemorizedResultCountWidget extends StatelessWidget {
  final String title;
  final String count;
  final String image;

  const MemorizedResultCountWidget({
    super.key,
    required this.title,
    required this.count,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(image), width: 54, height: 70),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.textTheme.bodyMedium),
                Text(
                  count,
                  style: context.textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryResultOfTahfidzWidget extends StatelessWidget {
  const HistoryResultOfTahfidzWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 22, top: 24, right: 22, bottom: 14),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Tahfidz History',
                  style: context.textTheme.titleMedium,
                ),
                const SizedBox(width: SpacingConstant.xs),
                Icon(Icons.keyboard_arrow_right, color: colors.surface)
              ],
            ),
          ),
          const SizedBox(
            height: SpacingConstant.lg,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("2 weeks ago, you’ve memorized"),
              SizedBox(height: SpacingConstant.xs),
              SurahWithBadgeWidget(surah: "An-Nisa", surahNumber: 92)
            ],
          )
        ],
      ),
    );
  }
}
