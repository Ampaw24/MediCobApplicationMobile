import 'package:flutter/material.dart';
import 'package:newmedicob/presentation/vital%20Check/PPG/model/sensor_model.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartComp extends StatelessWidget {
  final List<SensorValue> allData;

  const ChartComp({Key? key, required this.allData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              getTitlesWidget: (value, meta) {
                // Formatting the DateTime labels on the X-axis
                final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                return Text('${date.hour}:${date.minute}');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              getTitlesWidget: (value, meta) {
                return Text(value.toString());
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(color: Colors.black, width: 1),
            left: BorderSide(color: Colors.black, width: 1),
            right: BorderSide(color: Colors.transparent),
            top: BorderSide(color: Colors.transparent),
          ),
        ),
        minX: allData.isNotEmpty
            ? allData.first.time.millisecondsSinceEpoch.toDouble()
            : 0,
        maxX: allData.isNotEmpty
            ? allData.last.time.millisecondsSinceEpoch.toDouble()
            : 0,
        minY: 0, // Adjust this based on your data's expected range
        maxY: 256, // 8-bit image data range
        lineBarsData: [
          LineChartBarData(
            spots: allData
                .map((data) => FlSpot(
                      data.time.millisecondsSinceEpoch.toDouble(),
                      data.value.toDouble(),
                    ))
                .toList(),
            isCurved: true,
            color: Colors.red,
            barWidth: 2,
            dotData: FlDotData(show: false),
          ),
        ],
      ),
    );
  }
}
