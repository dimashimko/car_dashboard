import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() => runApp(
      const ChartApp(),
    );

class ChartApp extends StatelessWidget {
  const ChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Bar Chart Example')),
        body: const BarChart(),
      ),
    );
  }
}

class BarChart extends StatefulWidget {
  const BarChart({super.key});

  @override
  BarChartState createState() => BarChartState();
}

class BarChartState extends State<BarChart> {
  final List<ChartData> data = <ChartData>[
    ChartData('1 PM', 70),
    ChartData('2 PM', 85),
    ChartData('3 PM', 157),
    ChartData('4 PM', 78),
    ChartData('5 PM', 95),
    ChartData('6 PM', 40),
    ChartData('7 PM', 90),
  ];

  int? _selectedIndex; // To track the selected bar
  late SelectionBehavior _selectionBehavior;

  @override
  void initState() {
    super.initState();
    _selectionBehavior = SelectionBehavior(
      enable: true,
      unselectedOpacity: 1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0.0,
      primaryXAxis: CategoryAxis(
        edgeLabelPlacement: EdgeLabelPlacement.none,
        // isVisible: false,
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        axisLine: AxisLine(
          color: Colors.transparent,
        ),
        majorTickLines: MajorTickLines(
          color: Colors.transparent,
        ),
        majorGridLines: const MajorGridLines(
          color: Colors.transparent,
          // color: Colors.red,
        ),
        plotBands: data.asMap().entries.map((entry) {
          int index = entry.key;
          log('*** index: ${index}');
          log('*** data.length: ${data.length}');

          return PlotBand(
            color: Colors.transparent,
            isVisible: true,
            start: index + 0.5,
            // Start between two bars
            end: index + 0.5,
            borderWidth: index + 1 >= data.length ? 0 : 1,
            borderColor: Colors.blue, // Grid line color
          );
        }).toList(),
      ),
      primaryYAxis: const NumericAxis(
        isVisible: false,
        minimum: 0,
        maximum: 160,
        interval: 20,
      ),
      series: <CartesianSeries<ChartData, String>>[
        ColumnSeries<ChartData, String>(
          dataSource: data,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          color: Colors.blue,
          pointColorMapper: (data, index) {
            return index == _selectedIndex ? Colors.orange : Colors.blue;
          },
          width: 0.6,
          borderRadius: BorderRadius.circular(0),
          dataLabelSettings: const DataLabelSettings(
            isVisible: false,
          ),
          enableTooltip: true,
          selectionBehavior: _selectionBehavior,
        ),
      ],
      tooltipBehavior: TooltipBehavior(
        enable: true,
        shouldAlwaysShow: true,
        // canShowMarker: true,
        canShowMarker: false,

        format: 'point.x : point.yk',
        // header: 'header',
        header: '',
        tooltipPosition: TooltipPosition.pointer,
        color: Colors.black,
        textStyle: const TextStyle(
          color: Colors.white,
        ),
        // builder: (
        //   dynamic data,
        //   dynamic point,
        //   dynamic series,
        //   int pointIndex,
        //   int seriesIndex,
        // ) {
        //   return Container(
        //     height: 50,
        //     width: 100,
        //     decoration: const BoxDecoration(
        //       // color: Color.fromRGBO(66, 244, 164, 1),
        //       color: Colors.black,
        //     ),
        //     child: Center(child: Text('$pointIndex')),
        //   );
        // },
      ),
      onSelectionChanged: (SelectionArgs args) {
        setState(() {
          _selectedIndex = args.pointIndex;
        });
      },
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
