import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:newmedicob/presentation/vital%20Check/PPG/model/sensor_model.dart';

class Chart extends StatelessWidget {
  final List<SensorValue> data;

  Chart(this.data);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: data
                .map((e) => FlSpot(
                      e.time.millisecondsSinceEpoch.toDouble(),
                      e.value,
                    ))
                .toList(),
            isCurved: true,
            barWidth: 2,
            belowBarData: BarAreaData(show: false),
            dotData: FlDotData(show: false),
          ),
        ],
      ),
    );
  }
}
