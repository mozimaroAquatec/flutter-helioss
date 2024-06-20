import 'dart:convert';

import 'package:helioss/logging/logging.dart';
import 'package:helioss/models/energies_model.dart';
import 'package:helioss/models/helioss_model.dart';
import 'package:helioss/api/helioss_responses.dart';
import 'package:helioss/models/wathermap_model.dart';
import 'package:helioss/utils/end_point.dart';
import 'package:http/http.dart';

const String baseUrl = "http://10.0.2.2:5000/";

class HeliossServices {
  late dynamic energiesByDate;
  late dynamic lastFiltration;
  late dynamic temperature;
  late dynamic heliossByDate;

  late dynamic cloud;

  final log = logger;
  Future<List<HeliossInterface>> getHeliossByDate() async {
    try {
      log.i("Endpoint ${Endpoints.baseUrl}");
      final response =
          await get(Uri.parse("${Endpoints.baseUrl}date/?date=2024/06/10"));
      log.i('response $response');
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        energiesByDate = jsonDecode(response.body);

        var heliossRespoonse =
            HeliossResponses().getHeliossByDate(energiesByDate);
        log.i("===================================}");

        // log.i("energiesByDate : ${energiesByDate}");
        log.i("===================================}");
        log.i("heliossRespoonse : ${heliossRespoonse}");

        return heliossRespoonse;
      } else {
        log.e('Error: Unexpected status code ${response.statusCode}');
        throw Exception(
            'Failed to load energiesByDate: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors that occur during the request
      log.e('Error: $e');
      throw Exception('Failed to load energiesByDate');
    }
  }

  Future<WathermapInterface> getTemperature() async {
    try {
      final response = await get(Uri.parse("${baseUrl}wathermap/temperature"));
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        final Map<String, dynamic> temperatureJson = jsonDecode(response.body);

        WathermapInterface temperatureData =
            WathermapInterface.fromJson(temperatureJson);

        log.i("===================================");
        log.i("get temperature : $temperatureData success");
        log.i("===================================");

        return temperatureData;
      } else {
        log.e('Error: Unexpected status code ${response.statusCode}');
        throw Exception('Failed to load temperature: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any errors that occur during the request
      log.e('Error get temperature: $error');
      throw Exception('Error getting current temperature: $error');
    }
  }

  Future<WathermapInterface> getCloud() async {
    try {
      final response = await get(Uri.parse("${baseUrl}wathermap/cloud"));
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        cloud = jsonDecode(response.body);

        WathermapInterface cloudJson = HeliossResponses().getTemperature(cloud);
        log.i("===================================}");
        log.i("get cloud : $cloud success");
        log.i("===================================}");

        return cloudJson;
      } else {
        log.e('Error: Unexpected status code ${response.statusCode}');
        throw Exception('Failed to load cloud: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any errors that occur during the request
      log.e('Error get cloud: $error');
      throw Exception('error get cloud $error');
    }
  }

  Future<HeliossInterface> getLastFiltration() async {
    try {
      final response = await get(Uri.parse("${baseUrl}last"));
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        lastFiltration = jsonDecode(response.body);

        HeliossInterface lastFiltrationJson =
            HeliossResponses().getLastFiltration(lastFiltration);
        log.i("===================================}");
        log.i("get cloud : $lastFiltration success");
        log.i("===================================}");

        return lastFiltrationJson;
      } else {
        log.e('Error: Unexpected status code ${response.statusCode}');
        throw Exception('Failed to load cloud: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any errors that occur during the request
      log.e('Error get cloud: $error');
      throw Exception('error get last filtration $error');
    }
  }
}
