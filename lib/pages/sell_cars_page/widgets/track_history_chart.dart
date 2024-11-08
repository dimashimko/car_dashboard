import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TrackHistoryChart extends StatefulWidget {
  const TrackHistoryChart({super.key});

  @override
  TrackHistoryChartState createState() => TrackHistoryChartState();
}

class TrackHistoryChartState extends State<TrackHistoryChart> {
  final List<TrackHistoryData> data = [
    TrackHistoryData(day: 'Mon', km: 10.0),
    TrackHistoryData(day: 'Tue', km: 7.5),
    TrackHistoryData(day: 'Wed', km: 17.0),
    TrackHistoryData(day: 'Thu', km: 21.0),
    TrackHistoryData(day: 'Fri', km: 17.0),
    TrackHistoryData(day: 'Sat', km: 13.0),
    TrackHistoryData(day: 'Sun', km: 19.0),
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
          ),
        ),
        primaryYAxis: NumericAxis(
          isVisible: true,
          minimum: 0,
          maximum: 30,
          interval: 5,
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
          majorGridLines: MajorGridLines(
            // color: Colors.transparent,
            color: colors(context).sellCarsGridLine,
            dashArray: const [4, 4],
          ),
        ),
        series: <CartesianSeries<TrackHistoryData, String>>[
          ColumnSeries<TrackHistoryData, String>(
            dataSource: data,
            xValueMapper: (TrackHistoryData data, _) => data.day,
            yValueMapper: (TrackHistoryData data, _) => data.km,
            pointColorMapper: (data, index) {
              if (_selectedIndex == null) return AppColors.secondary.red;
              return index == _selectedIndex
                  ? AppColors.secondary.red
                  : colors(context).inactiveRed;
            },
            width: 0.6,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(100.0),
            ),
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
          format: 'point.ykm/h',
          header: '',
          tooltipPosition: TooltipPosition.pointer,
          color: colors(context).sellCarsTooltip,
          textStyle: AppTypography.title12m.copyWith(
            fontWeight: FontWeight.bold,
            color: colors(context).sellCarsTooltipText,
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

class TrackHistoryData {
  TrackHistoryData({
    required this.day,
    required this.km,
  });

  final String day;
  final double km;
}
