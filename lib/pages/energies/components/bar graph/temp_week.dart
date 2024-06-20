import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarTempWeek extends StatelessWidget {
  const BarTempWeek({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, double>> temperatures = [
      {"Monday": 10.0},
      {"Tuesday": 12.0},
      {"Wednesday": 15.0},
      {"Thursday": 13.0},
      {"Friday": 11.0},
      {"Saturday": 14.0},
      {"Sunday": 9.0},
    ];

    return Center(
      child: AspectRatio(
        aspectRatio: 6 / 2,
        child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.blue,
            margin: const EdgeInsets.all(2),
            child: BarChart(BarChartData(
              maxY: 50,
              barGroups: mapTemperatures(temperatures),
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

  List<BarChartGroupData> mapTemperatures(
      List<Map<String, double>> temperatures) {
    return List.generate(temperatures.length, (i) {
      String day = temperatures[i].keys.first;
      double temperature =
          temperatures[i][day] ?? 0.0; // Default value if temperature is null
      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: temperature,
          ),
        ],
      );
    });
  }

  String formatIndex(int index) {
    switch (index) {
      case 0:
        return 'Monday';
      case 1:
        return 'Tuesday';
      case 2:
        return 'Wednesday';
      case 3:
        return 'Thursday';
      case 4:
        return 'Friday';
      case 5:
        return 'Saturday';
      case 6:
        return 'Sunday';
      default:
        return '';
    }
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
          'Temperature in degree day',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 5,
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
