import 'package:flutter/material.dart';
import 'package:hafizh/common/const/screen_padding_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/ui/widget/atoms/circular_percentage_indicator_widget.dart';
import 'package:hafizh/common/ui/widget/atoms/horizontal_progress_bar_indicator_widget.dart';
import 'package:hafizh/common/ui/widget/molecules/button/hafizh_button_widget.dart';
import 'package:hafizh/common/ui/widget/molecules/card/surah_card_widget.dart';
import 'package:hafizh/common/ui/widget/molecules/tile/surah_tile_title_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 320,
          backgroundColor: context.colors.background,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 42, horizontal: ScreenPaddingConstant.horizontal),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/home_hero.png"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Hi Bayek',
                                style: context.textTheme.headlineMedium,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MoleculeSurahTileTitleWidget(
                                name: 'Al-Mulk',
                                number: 92,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Today’s Tahfidz. Ayah 16',
                                style: context.textTheme.labelLarge,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              AtomHorizontalProgressBarIndicator(
                                count: 3,
                                value: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Great progress! You\'ll finish memorizing al-mulk in 5 days at this rate!',
                                style: context.textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        const AtomCircularPercentageIndicatorWidget(
                          value: 0.8,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: HafizhButtonWidget(
                          text: 'Start New Tahfidz',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20, horizontal: ScreenPaddingConstant.horizontal),
              child: Column(
                children: [
                  MoleculeSurahCardWidget(
                    subtitle: "Last Read at ayah 122",
                    name: "Al-Fatiha",
                    number: 1,
                    onTap: () => {},
                  ),
                ],
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
