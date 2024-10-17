import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../resources/theme/custom_theme_extension.dart';

class CarChart extends StatefulWidget {
  const CarChart({super.key});

  @override
  CarChartState createState() => CarChartState();
}

class CarChartState extends State<CarChart> {
  List<ChartData> chartData = [];

  @override
  void initState() {
    chartData = [
      ChartData(time: '6 am', sales: 2.0),
      ChartData(time: '7 am', sales: 4.0),
      ChartData(time: '8 am', sales: 4.5),
      ChartData(time: '9 am', sales: 6),
      ChartData(time: '10 am', sales: 8),
      ChartData(time: '11 am', sales: 7),
      ChartData(time: '12 am', sales: 6),
      ChartData(time: '1 pm', sales: 7),
      ChartData(time: '2 pm', sales: 5),
      ChartData(time: '3 pm', sales: 3),
      ChartData(time: '4 pm', sales: 4.0),
      ChartData(time: '5 pm', sales: 4.5),
      ChartData(time: '6 pm', sales: 4.0),
      ChartData(time: '7 pm', sales: 5),
      ChartData(time: '8 pm', sales: 6),
      ChartData(time: '9 pm', sales: 5.5),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            borderColor: AppColors.secondary.orange,
            gradient: LinearGradient(
              colors: <Color>[
                AppColors.secondary.orange.withOpacity(0.24),
                const Color(0xffFF7E07).withOpacity(0.0),
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
