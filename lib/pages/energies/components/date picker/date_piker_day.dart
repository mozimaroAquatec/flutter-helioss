import 'package:flutter/material.dart';

class DatePickerDay extends StatefulWidget {
  const DatePickerDay({super.key});

  @override
  _DatePickerExampleState createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerDay> {
  DateTime selectedDate = DateTime.now();
  int currentYear = DateTime.now().year;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(currentYear - 1),
      lastDate: DateTime(currentYear + 1),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        print("picked $picked");
        selectedDate = picked;
        print("picked $picked");
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Date'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Icon(Icons.date_range_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

class YearPickerDialog extends StatelessWidget {
  final int selectedYear;
  final int firstYear;
  final int lastYear;

  YearPickerDialog({
    required this.selectedYear,
    required this.firstYear,
    required this.lastYear,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Year'),
      content: Container(
        width: double.minPositive,
        height: 300,
        child: YearPicker(
          selectedDate: DateTime(selectedYear),
          firstDate: DateTime(firstYear),
          lastDate: DateTime(lastYear),
          onChanged: (DateTime dateTime) {
            Navigator.pop(context, dateTime.year);
          },
        ),
      ),
    );
  }
}
