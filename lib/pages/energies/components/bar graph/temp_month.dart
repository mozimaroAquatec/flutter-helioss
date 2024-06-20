import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarTempMonth extends StatelessWidget {
  const BarTempMonth({super.key});

  @override
  Widget build(BuildContext context) {
    List<double> temprateur = [
      20,
      30,
      40,
      10,
      20,
      20,
      20,
      20,
      12,
      23,
      25,
      31,
      20,
      30,
      40,
      10,
      20,
      20,
      20,
      20,
      12,
      23,
      25,
      12,
      23,
      25,
      23,
      23,
      23,
      25,
      31
    ];

    return Center(
      child: AspectRatio(
        aspectRatio: 6 / 2,
        child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.blue,
            margin: const EdgeInsets.all(2),
            child: BarChart(BarChartData(
              maxY: 99,
              minY: 0,
              barGroups: mapTemperatures(temprateur),
              titlesData: FlTitlesData(
                  bottomTitles: _bottomTitle(),
                  leftTitles: _leftTitle(),
                  rightTitles: _setAxisTitlesFalse(),
                  topTitles: _setAxisTitlesFalse()),
              barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(maxContentWidth: 300)),
              backgroundColor: Colors.white,
            ))),
      ),
    );
  }

  List<BarChartGroupData> mapTemperatures(List<double> temperatures) {
    return List.generate(temperatures.length, (i) {
      return BarChartGroupData(
        x: i,
        barRods: [BarChartRodData(toY: temperatures[i])],
      );
    });
  }

  String formatIndex(int index) {
    return index < 10 ? '0$index' : '$index';
  }

  AxisTitles _setAxisTitlesFalse() {
    return const AxisTitles(
        sideTitles: SideTitles(
      showTitles: false,
    ));
  }

  AxisTitles _leftTitle() {
    return AxisTitles(
        axisNameSize: 30,
        axisNameWidget: const Text(
          'Temperature in degree month',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 20,
          getTitlesWidget: (value, meta) {
            return Text(
              meta.formattedValue,
              style: const TextStyle(color: Colors.red),
            );
          },
        ));
  }

  AxisTitles _bottomTitle() {
    return AxisTitles(
        sideTitles: SideTitles(
      reservedSize: 30,
      showTitles: true,
      getTitlesWidget: (double value, TitleMeta meta) {
        int index = value.toInt();
        return SideTitleWidget(
          axisSide: meta.axisSide,
          child: Text(formatIndex(index)),
        );
      },
    ));
  }
}
