import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/common/const/screen_padding_constant.dart';
import 'package:hafizh/common/ui/widget/atoms/circular_percentage_indicator_widget.dart';
import 'package:hafizh/common/ui/widget/atoms/horizontal_progress_bar_indicator_widget.dart';
import 'package:hafizh/common/ui/widget/molecules/chart/bar_chart_widget.dart';
import 'package:hafizh/presentation/bloc/app_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state.status == AppStatus.unauthenticated) {
          context.goNamed(NamedRoutes.loginView);
        }
      },
      child: Scaffold(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
