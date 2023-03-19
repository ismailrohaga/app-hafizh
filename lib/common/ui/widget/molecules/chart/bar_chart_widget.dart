import 'package:flutter/material.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MoleculeBarChartWidget extends StatelessWidget {
  final List<ChartData> dataSource;

  const MoleculeBarChartWidget({super.key, required this.dataSource});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 6, interval: 1),
        series: <ChartSeries<ChartData, String>>[
          BarSeries(
              dataSource: dataSource,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              dataLabelMapper: (ChartData data, _) => data.x.toString(),
              color: context.colors.tertiary),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
