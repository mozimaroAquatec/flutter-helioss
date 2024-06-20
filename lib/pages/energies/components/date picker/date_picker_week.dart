import 'package:flutter/material.dart';

class DatePickerWeek extends StatefulWidget {
  const DatePickerWeek({super.key});

  @override
  State<DatePickerWeek> createState() => _DatePickerWeekState();
}

class _DatePickerWeekState extends State<DatePickerWeek> {
  DateTime? start;
  DateTime? end;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Date range: start: $start and end: $end"),
          ElevatedButton(
            onPressed: () async {
              final result = await showDateRangePicker(
                context: context,
                firstDate: DateTime(DateTime.now().year - 1),
                lastDate: DateTime(DateTime.now().year + 1),
              );

              if (result != null) {
                final int difference =
                    result.end.difference(result.start).inDays;
                print('The difference range : $difference days.');

                if (difference == 6) {
                  setState(() {
                    start = result.start;
                    print('start : $start');

                    end = result.end;
                    print('end : $end');
                  });
                } else {
                  print('The selected range must be exactly 7 days.');
                }
              }
            },
            child: Text("Select Date Range"),
          ),
        ],
      ),
    );
  }
}
