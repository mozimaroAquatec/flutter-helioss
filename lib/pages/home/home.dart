import 'package:flutter/material.dart';
import 'package:helioss/logging/logging.dart';
import 'package:helioss/api/helioss_api.dart';
import 'package:helioss/models/helioss_model.dart';
import 'package:helioss/models/wathermap_model.dart';
import 'package:helioss/pages/home/components/navigator_buttons.dart';
import 'package:helioss/pages/home/components/temp_cloud_card.dart';
import 'package:logger/logger.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  late HeliossServices helioss;
  late List<HeliossInterface> allHelioos = [];
  late WathermapInterface? temperatureResponse = null;
  late WathermapInterface? cloudResponse = null;

  @override
  void initState() {
    super.initState();
    helioss = HeliossServices();
    getCurrentTemperature();
    getNextDayCloud();
  }

  Logger log = logger;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Helioss",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 173, 64, 192),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TempCloudCard(
            temperatureResponse: temperatureResponse,
            cloudResponse: cloudResponse,
          ),
          const NavigatorButton(
            route: "energies",
          ),
          const NavigatorButton(
            route: "filtrations",
          ),
        ],
      ),
    );
  }

  Future<void> getCurrentTemperature() async {
    WathermapInterface value = await helioss.getTemperature();

    setState(() {
      temperatureResponse = value;
    });
  }

  Future<void> getNextDayCloud() async {
    WathermapInterface value = await helioss.getCloud();

    setState(() {
      cloudResponse = value;
    });
  }
}
