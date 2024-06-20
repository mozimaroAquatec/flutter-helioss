import 'package:flutter/material.dart';

class YearMonthPickerExample extends StatefulWidget {
  const YearMonthPickerExample({super.key});

  @override
  _YearMonthPickerExampleState createState() => _YearMonthPickerExampleState();
}

class _YearMonthPickerExampleState extends State<YearMonthPickerExample> {
  int? selectedYear;
  String? selectedMonth;

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  void initState() {
    super.initState();
    // Set default selected year to the current year
    selectedYear = DateTime.now().year;
    selectedMonth = null; // Initially, no month is selected
  }

  @override
  Widget build(BuildContext context) {
    int currentYear = DateTime.now().year;
    List<int> years = [currentYear, currentYear - 1];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Year and Month Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected Year: $selectedYear',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            DropdownButton<int>(
              value: selectedYear,
              items: years.map((int year) {
                return DropdownMenuItem<int>(
                  value: year,
                  child: Text(year.toString()),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  selectedYear = newValue;
                  selectedMonth =
                      null; // Reset month selection when year changes
                });
              },
            ),
            const SizedBox(height: 20),
            if (selectedYear != null)
              Column(
                children: [
                  Text(
                    'Selected Month: $selectedMonth',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  DropdownButton<String>(
                    value: selectedMonth,
                    hint: const Text("Select Month"),
                    items: months.map((String month) {
                      return DropdownMenuItem<String>(
                        value: month,
                        child: Text(month),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedMonth = newValue;
                      });
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
