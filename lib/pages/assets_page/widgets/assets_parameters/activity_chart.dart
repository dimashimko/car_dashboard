import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../resources/theme/custom_theme_extension.dart';

class ActivityChart extends StatefulWidget {
  const ActivityChart({super.key});

  @override
  ActivityChartState createState() => ActivityChartState();
}

class ActivityChartState extends State<ActivityChart> {
  List<ChartData> chartData = [];

  @override
  void initState() {
    chartData = [
      ChartData(time: '1/9', sales: 3.0),
      ChartData(time: '2/9', sales: 3.5),
      ChartData(time: '3/9', sales: 4.4),
      ChartData(time: '4/9', sales: 5.0),
      ChartData(time: '5/9', sales: 5.0),
      ChartData(time: '6/9', sales: 4.7),
      ChartData(time: '7/9', sales: 4.7),
      ChartData(time: '8/9', sales: 5.5),
      ChartData(time: '9/9', sales: 7.5),
      ChartData(time: '10/9', sales: 8.0),
      ChartData(time: '11/9', sales: 8.5),
      ChartData(time: '12/9', sales: 9.0),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.0,
      child: SfCartesianChart(
        legend: const Legend(isVisible: true),
        plotAreaBorderWidth: 0.0,
        series: <CartesianSeries<ChartData, String>>[
          SplineAreaSeries<ChartData, String>(
            dataSource: chartData,
            isVisibleInLegend: false,
            xValueMapper: (ChartData sales, _) => sales.time,
            yValueMapper: (ChartData sales, _) => sales.sales,
            borderWidth: 1,
            borderColor: AppColors.primary.purple,
            gradient: LinearGradient(
              colors: <Color>[
                AppColors.primary.purple.withOpacity(0.38),
                AppColors.primary.purple.withOpacity(0.0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ],
        primaryXAxis: CategoryAxis(
          desiredIntervals: 7,
          minimum: -1,
          // maximum: chartData.length.toDouble(),
          edgeLabelPlacement: EdgeLabelPlacement.none,
          labelStyle: TextStyle(
            color: colors(context).statisticsTextLabel,
          ),
          axisLine: const AxisLine(
            color: Colors.transparent,
          ),
          majorTickLines: const MajorTickLines(
            color: Colors.transparent,
          ),
          majorGridLines: const MajorGridLines(
            color: Colors.transparent,
            // color: Colors.red,
          ),
          plotBands: chartData.asMap().entries.map(
            (entry) {
              int index = entry.key;
              return PlotBand(
                isVisible: index % 2 == 1 ? true : false,
                start: index + 0.5,
                end: index + 0.5,
                borderWidth: index + 1 >= chartData.length ? 0 : 1,
                borderColor: colors(context).statisticsDivider,
              );
            },
          ).toList(),
        ),
        primaryYAxis: const NumericAxis(
          isVisible: false,
        ),
      ),
    );
  }
}

class ChartData {
  ChartData({
    required this.time,
    required this.sales,
  });

  final String time;
  final double sales;
}
