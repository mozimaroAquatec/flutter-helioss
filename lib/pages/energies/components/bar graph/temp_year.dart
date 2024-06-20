import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarTempYear extends StatelessWidget {
  const BarTempYear({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, double>> temperatures = [
      {"January": 10.0},
      {"February": 20.0},
      {"March": 30.0},
      {"April": 25.0},
      {"May": 22.5},
      {"June": 28.3},
      {"July": 31.7},
      {"August": 30.5},
      {"September": 27.8},
      {"October": 23.6},
      {"November": 18.9},
      {"December": 15.2},
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
        return 'Jan';
      case 1:
        return 'Feb';
      case 2:
        return 'Mar'; // Abbreviation for March
      case 3:
        return 'Apr'; // Abbreviation for April
      case 4:
        return 'May';
      case 5:
        return 'Jun'; // Abbreviation for June
      case 6:
        return 'Jul'; // Abbreviation for July
      case 7:
        return 'Aug';
      case 8:
        return 'Sep'; // Abbreviation for September
      case 9:
        return 'Oct';
      case 10:
        return 'Nov';
      case 11:
        return 'Dec';
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
          'Temperature in degree year',
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
