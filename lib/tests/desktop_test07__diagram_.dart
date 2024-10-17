import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplineAreaChart(),
    );
  }
}

class SplineAreaChart extends StatefulWidget {
  const SplineAreaChart({super.key});

  @override
  SplineAreaChartState createState() => SplineAreaChartState();
}

class SplineAreaChartState extends State<SplineAreaChart> {
  List<ChartData> chartData = [];

  @override
  void initState() {
    chartData = [
      ChartData(2010, 35),
      ChartData(2011, 28),
      ChartData(2012, 34),
      ChartData(2013, 32),
      ChartData(2014, 40)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spline Area Chart'),
      ),
      body: SfCartesianChart(
        title: const ChartTitle(text: 'Sales over the years'),
        legend: const Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries<ChartData, double>>[
          SplineAreaSeries<ChartData, double>(
            dataSource: chartData,
            xValueMapper: (ChartData sales, _) => sales.year,
            yValueMapper: (ChartData sales, _) => sales.sales,
            name: 'Sales',
            gradient: const LinearGradient(
              colors: <Color>[Colors.blue, Colors.transparent],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ],
        primaryXAxis: const NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
        ),
        primaryYAxis: const NumericAxis(
          labelFormat: '{value}k',
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.year, this.sales);

  final double year;
  final double sales;
}
