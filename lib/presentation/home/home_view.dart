import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/ui/widget/atoms/atoms.dart';
import 'package:hafizh/common/ui/widget/molecules/molecules.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(ScreenPaddingConstant.horizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AtomCircularPercentageIndicatorWidget(
              value: 0.8,
            ),
            const SizedBox(height: 24.0),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: AtomHorizontalProgressBarIndicator(
                count: 3,
                value: 2,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            MoleculeBarChartWidget(
              dataSource: [
                ChartData('10 Days', 2),
                ChartData('6 Days', 3),
                ChartData('4 Days', 4),
                ChartData('2 Days', 5),
                ChartData('1 Days', 6),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Next'))
          ],
        ),
      ),
    );
  }
}
