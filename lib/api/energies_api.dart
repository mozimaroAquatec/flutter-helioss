import 'dart:convert';

import 'package:helioss/api/helioss_responses.dart';
import 'package:helioss/logging/logging.dart';
import 'package:helioss/models/energies_model.dart';

import 'package:helioss/utils/end_point.dart';
import 'package:http/http.dart';

const String baseUrl = "http://10.0.2.2:5000/";

class EnergiesService {
  final log = logger;
  late dynamic energies;

  Future<List<EnergiesInterface>> getEnergieByDate() async {
    try {
      final response =
          await get(Uri.parse("${Endpoints.baseUrl}date/?date=2024/06/10"));
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        energies = jsonDecode(response.body);

        List<EnergiesInterface> energiesJson =
            HeliossResponses().getEenergiesByDate(energies);
        log.i("===================================}");
        log.i("get cloud : $energies success");
        log.i("===================================}");

        return energiesJson;
      } else {
        log.e('Error: Unexpected status code ${response.statusCode}');
        throw Exception('Failed to load cloud: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any errors that occur during the request
      log.e('Error get cloud: $error');
      throw Exception('error get last cloud $error');
    }
  }
}
