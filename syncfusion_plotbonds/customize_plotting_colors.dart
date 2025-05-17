import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_sample/diamond_painter.dart';
import 'package:syncfusion_sample/glucose_model.dart';
import 'package:syncfusion_sample/list_glucose_model.dart';

class CustomizePlottingColors extends StatefulWidget {
  final bool isNetworkAvailable;

  const CustomizePlottingColors({required this.isNetworkAvailable, super.key});

  @override
  State<CustomizePlottingColors> createState() =>
      _CustomizePlottingColorsState();
}

class _CustomizePlottingColorsState extends State<CustomizePlottingColors> {
  double criticalLow = 10.0;
  double low = 80.0;
  double beforeMealInRange = 130.0;
  
 double afterMealInRange = 180.0;
  double criticalHigh = 300.0;
  double maxHigh = 600.0;

  List<GlucoseModel> bgmList = GlucoseDummyData.getDailySample();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,

      height: 200,
      width: 200,
      child: Stack(
        children: [
          Column(
            children: [
              // Display the chart
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 24,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 50,
                  width: MediaQuery.of(context).size.width - 50,
                  child: SfCartesianChart(
                    margin: EdgeInsets.zero,
                    plotAreaBorderWidth: 0.5,
                    plotAreaBorderColor: Colors.grey,
                    primaryXAxis: DateTimeAxis(
                      majorTickLines: const MajorTickLines(size: 0),
                      labelPosition: ChartDataLabelPosition.inside,
                      labelStyle: const TextStyle(color: Colors.transparent),
                      minimum: DateTime(2025, 5, 17, 0, 0),
                      maximum: DateTime(2025, 5, 17, 23, 59),
                      intervalType: DateTimeIntervalType.hours,
                      interval: 24,
                      majorGridLines: MajorGridLines(
                        color: Colors.blueGrey,
                        width: 0.5,
                      ),
                      axisLine: const AxisLine(width: 0),
                      labelIntersectAction: AxisLabelIntersectAction.hide,
                    ),
                    primaryYAxis: NumericAxis(
                      axisLine: const AxisLine(
                        width: 0,
                        color: Colors.transparent,
                      ),
                      labelStyle: const TextStyle(color: Colors.transparent),
                      labelPosition: ChartDataLabelPosition.inside,
                      majorGridLines: const MajorGridLines(width: 0),
                      majorTickLines: const MajorTickLines(width: 0),
                      minimum: 10,
                      maximum: criticalHigh,
                      rangePadding: ChartRangePadding.round,
                      plotBands: <PlotBand>[
                        PlotBand(
                          start: criticalLow,
                          end: low,
                          borderColor: Colors.red,
                          borderWidth: 0.5,
                          opacity: 0.4,
                          color: Colors.red,
                        ),
                        PlotBand(
                          start: low,
                          end: beforeMealInRange,
                          opacity: 0.4,
                          borderColor: Colors.green,
                          borderWidth: 0.5,
                          color: Colors.green,
                        ),
                        PlotBand(
                          start: beforeMealInRange,
                          end: afterMealInRange,
                          opacity: 0.4,
                          borderColor: Colors.green,
                          borderWidth: 0.5,
                          color: Colors.green.shade200,
                        ),
                        PlotBand(
                          start: afterMealInRange,
                          end: criticalHigh,
                          borderColor: Colors.amber,
                          borderWidth: 0.5,
                          opacity: 0.4,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                    annotations: <CartesianChartAnnotation>[
                      for (var model in bgmList)
                        CartesianChartAnnotation(
                          widget:
                              model.isManual
                                  ? CustomPaint(
                                    size: const Size(15, 15),
                                    painter: DiamondPainter(
                                      color:
                                          getGlucoseValue(model.value) < low
                                              ? Colors.red.shade700
                                              : (getGlucoseValue(model.value) <=
                                                      afterMealInRange
                                                  ? Colors.green.shade700
                                                  : Colors.amber.shade700),
                                      glucoseValue: 0.0,
                                    ),
                                  )
                                  : Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          getGlucoseValue(model.value) < low
                                              ? Colors.red.shade700
                                              : (getGlucoseValue(model.value) <=
                                                      afterMealInRange
                                                  ? Colors.green.shade700
                                                  : Colors.amber.shade700),
                                    ),
                                  ),
                          coordinateUnit: CoordinateUnit.point,
                          x: DateTime.parse(model.measureDate),
                          y: getGlucoseValue(model.value),
                        ),
                    ],
                    series: <LineSeries<GlucoseModel, DateTime>>[
                      LineSeries<GlucoseModel, DateTime>(
                        dataSource: bgmList,
                        opacity: 0.3,
                        animationDuration: 0,
                        width: 2,
                        enableTooltip: false,
                        color: Colors.grey.shade300,
                        xValueMapper:
                            (GlucoseModel model, _) =>
                                DateTime.parse(model.measureDate),
                        yValueMapper:
                            (GlucoseModel model, _) =>
                                getGlucoseValue(model.value),
                        markerSettings: const MarkerSettings(isVisible: true),
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  getGlucoseValue(double value) {
    final getMeterUnit = 'mg/dL';

    final glucoseValue = getMeterUnit == 'mg/dL' ? value : 0.0;

    return glucoseValue;
  }
}
