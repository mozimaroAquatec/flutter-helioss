import 'package:flutter/material.dart';
import 'package:helioss/models/wathermap_model.dart';

class TempCloudCard extends StatelessWidget {
  final WathermapInterface? temperatureResponse;
  final WathermapInterface? cloudResponse;

  const TempCloudCard(
      {super.key,
      required this.temperatureResponse,
      required this.cloudResponse});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text(temperatureResponse != null
                      ? 'Temp :${temperatureResponse?.temperature}°C'
                      : "wait"),
                  leading: Image.asset(
                    "images/hot-weather.png",
                    height: 40,
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(cloudResponse != null
                      ? 'Cloud : ${cloudResponse?.cloud}'
                      : "wait"),
                  leading: Image.asset(
                    "images/cloudy.png",
                    height: 40,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
