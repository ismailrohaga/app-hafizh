import 'package:flutter/material.dart';
import 'package:hafizh/common/ui/widget/atoms/circular_percentage_indicator_widget.dart';
import 'package:hafizh/common/ui/widget/atoms/horizontal_progress_bar_indicator_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AtomCircularPercentageIndicatorWidget(
              value: 0.8,
            ),
            SizedBox(height: 24.0),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: AtomHorizontalProgressBarIndicator(
                count: 3,
                value: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
