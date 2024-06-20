import 'package:flutter/material.dart';
import 'package:helioss/api/energies_api.dart';
import 'package:helioss/logging/logging.dart';
import 'package:helioss/models/energies_model.dart';
import 'package:helioss/pages/energies/components/bar%20graph/temp_day.dart';
import 'package:helioss/pages/energies/components/bar%20graph/temp_month.dart';
import 'package:helioss/pages/energies/components/bar%20graph/temp_week.dart';
import 'package:logger/logger.dart';

class Energies extends StatefulWidget {
  const Energies({super.key});
  @override
  State<Energies> createState() {
    return _EnergiesState();
  }
}

class _EnergiesState extends State<Energies> {
  late EnergiesService energiesService;
  late List<EnergiesInterface> energieByDate;
  @override
  void initState() {
    super.initState();
    energiesService = EnergiesService();

    energieByDate = [];
    getEnergiesByDate();
  }

  Logger log = logger;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "energy page",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            bottom: const TabBar(
              labelStyle: TextStyle(color: Colors.green, fontSize: 20),
              indicatorColor: Colors.amber,
              unselectedLabelStyle:
                  TextStyle(color: Colors.black, fontSize: 14),
              tabs: [
                Tab(
                  icon: Icon(Icons.calendar_view_day),
                  child: Text(
                    "Day",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.calendar_view_week),
                  child: Text(
                    "Week",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.calendar_view_month),
                  child: Text(
                    "Month",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.blue,
          ),
          body: const TabBarView(
            children: [
              BarTempDay(
                energiesByDate: [11.5],
              ),
              BarTempWeek(),
              BarTempMonth()
            ],
          ),
        ));
  }

  getEnergiesByDate() async {
    void result = await energiesService.getEnergieByDate();

    // setState(() {
    //   energieByDate = result;
    //   logger.i("energiesByDay $energieByDate");
    // });
  }
}
