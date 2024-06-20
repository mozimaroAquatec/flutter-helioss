import 'package:flutter/material.dart';

class DatePickerYear extends StatefulWidget {
  @override
  _YearPickerExampleState createState() => _YearPickerExampleState();
}

class _YearPickerExampleState extends State<DatePickerYear> {
  int? selectedYear;

  @override
  void initState() {
    super.initState();
    // Set default selected year to the current year
    selectedYear = DateTime.now().year;
  }

  @override
  Widget build(BuildContext context) {
    int currentYear = DateTime.now().year;
    List<int> years = [currentYear, currentYear - 1];

    return Scaffold(
      appBar: AppBar(
        title: Text('Year Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected Year: $selectedYear',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
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
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
