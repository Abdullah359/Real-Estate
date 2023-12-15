import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/slider_chart_model.dart';

class MySliderChartWidget extends StatefulWidget {
  const MySliderChartWidget({super.key});

  @override
  State<MySliderChartWidget> createState() => _MySliderChartWidgetState();
}

class _MySliderChartWidgetState extends State<MySliderChartWidget> {
  final SfRangeValues _values = const SfRangeValues(4, 7);

  late RangeController _rangeController;

  late List<int> selectedItems;

  @override
  void initState() {
    super.initState();
    _rangeController = RangeController(start: _values.start, end: _values.end);
  }

  @override
  void dispose() {
    _rangeController.dispose();
    super.dispose();
  }

  final List<Data> chartData = <Data>[
    Data(x: 2, y: 2.2),
    Data(x: 3, y: 3.4),
    Data(x: 4, y: 2.8),
    Data(x: 5, y: 1.6),
    Data(x: 6, y: 2.3),
    Data(x: 7, y: 2.5),
    Data(x: 8, y: 2.9),
    Data(x: 9, y: 3.8),
    Data(x: 10, y: 3.7),
  ];

  @override
  Widget build(BuildContext context) {
    selectedItems = <int>[];
    for (int i = 0; i < chartData.length; i++) {
      if (chartData[i].x!.hashCode >= _rangeController.start.hashCode &&
          chartData[i].x!.hashCode <= _rangeController.end.hashCode) {
        selectedItems.add(chartData.indexOf(chartData[i]));
      }
    }

    return SizedBox(
      child: SfRangeSelectorTheme(
        data: SfRangeSelectorThemeData(
          overlappingTooltipStrokeColor: Colors.transparent,
          thumbColor: Colors.white,
          overlayColor: Colors.transparent,
          overlayRadius: 0.0,
          inactiveTrackColor: Colors.grey,
          activeTrackColor: Colors.black,
        ),
        child: SfRangeSelector(
          min: 2,
          max: 10,
          interval: 1,
          startThumbIcon:
              Image.asset('assets/images/icons/scroll.png', fit: BoxFit.fill),
          endThumbIcon:
              Image.asset('assets/images/icons/scroll.png', fit: BoxFit.fill),
          controller: _rangeController,
          child: SizedBox(
            height: 130,
            child: SfCartesianChart(
              margin: const EdgeInsets.all(0),
              borderColor: Colors.transparent,
              plotAreaBorderColor: Colors.transparent,
              primaryXAxis:
                  NumericAxis(minimum: 2, maximum: 10, isVisible: false),
              primaryYAxis: NumericAxis(isVisible: false),
              plotAreaBackgroundColor: Colors.transparent,
              series: <ColumnSeries<Data, int>>[
                ColumnSeries<Data, int>(
                    initialSelectedDataIndexes: selectedItems,
                    selectionBehavior: SelectionBehavior(
                        enable: true,
                        unselectedOpacity: 0,
                        selectedBorderColor: const Color(0xffff5500),
                        selectedColor: const Color(0xffff5500),
                        unselectedColor: Colors.orange.shade200,
                        selectionController: _rangeController),
                    color: const Color.fromRGBO(255, 255, 255, 0),
                    dashArray: <double>[5, 4],
                    borderColor: const Color.fromRGBO(194, 194, 194, 1),
                    animationDuration: 0,
                    borderWidth: 1,
                    dataSource: chartData,
                    xValueMapper: (Data sales, int index) => sales.x,
                    yValueMapper: (Data sales, int index) => sales.y)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
