import 'package:flutter/material.dart';
import 'package:hafizh/common/ui/widget/atoms/circular_percentage_indicator_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AtomCircularPercentageIndicatorWidget(
          value: 0.8,
        ),
      ),
    );
  }
}
