import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MilesChart extends StatefulWidget {
  const MilesChart({super.key});

  @override
  MilesChartState createState() => MilesChartState();
}

class MilesChartState extends State<MilesChart> {
  final List<ChartData> data = [
    ChartData('1 PM', 70),
    ChartData('2 PM', 85),
    ChartData('3 PM', 57),
    ChartData('4 PM', 78),
    ChartData('5 PM', 95),
    ChartData('6 PM', 40),
    ChartData('7 PM', 90),
  ];

  int? _selectedIndex;
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
    return Expanded(
      child: SfCartesianChart(
        plotAreaBorderWidth: 0.0,
        primaryXAxis: CategoryAxis(
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
          plotBands: data.asMap().entries.map(
            (entry) {
              int index = entry.key;
              return PlotBand(
                isVisible: true,
                start: index + 0.5,
                end: index + 0.5,
                borderWidth: index + 1 >= data.length ? 0 : 1,
                borderColor: colors(context).statisticsDivider,
              );
            },
          ).toList(),
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
            pointColorMapper: (data, index) {
              if (_selectedIndex == null) return AppColors.secondary.blue;
              return index == _selectedIndex
                  ? AppColors.secondary.blue
                  : colors(context).inactive;
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
          canShowMarker: false,
          format: 'point.x : point.y',
          header: '',
          tooltipPosition: TooltipPosition.pointer,
          color: AppColors.statisticsTooltipBackground,
          textStyle: TextStyle(
            color: AppColors.gray.white,
          ),
        ),
        onSelectionChanged: (SelectionArgs args) {
          setState(() {
            if (args.pointIndex == _selectedIndex) {
              _selectedIndex = null;
              return;
            }
            _selectedIndex = args.pointIndex;
          });
        },
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
