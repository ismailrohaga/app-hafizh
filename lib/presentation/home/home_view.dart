import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hafizh/common/const/screen_padding_constant.dart';
import 'package:hafizh/common/const/spacing_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/ui/widget/atoms/circular_percentage_indicator_widget.dart';
import 'package:hafizh/common/ui/widget/atoms/horizontal_progress_bar_indicator_widget.dart';
import 'package:hafizh/common/ui/widget/molecules/button/hafizh_button_widget.dart';
import 'package:hafizh/common/ui/widget/molecules/card/surah_card_widget.dart';
import 'package:hafizh/common/ui/widget/molecules/chart/bar_chart_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: ScreenPaddingConstant.horizontal,
                      vertical: SpacingConstant.lg),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Hi Bayek'),
                                Text('Hi Bayek'),
                                AtomHorizontalProgressBarIndicator(
                                  count: 3,
                                  value: 2,
                                ),
                                Text('Hi Bayek')
                              ],
                            ),
                          ),
                          const AtomCircularPercentageIndicatorWidget(
                            value: 0.8,
                          )
                        ],
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
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: ScreenPaddingConstant.horizontal),
                  child: Column(children: [
                    MoleculeBarChartWidget(
                      dataSource: [
                        ChartData('10 Days', 2),
                        ChartData('6 Days', 3),
                        ChartData('4 Days', 4),
                        ChartData('2 Days', 5),
                        ChartData('1 Days', 6),
                      ],
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    MoleculeSurahCardWidget(
                      subtitle: "Last Read at ayah 122",
                      name: "Al-Fatiha",
                      number: 1,
                      onTap: () => {},
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
