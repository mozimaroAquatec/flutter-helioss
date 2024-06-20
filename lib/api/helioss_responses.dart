import 'package:helioss/logging/logging.dart';
import 'package:helioss/models/energies_model.dart';
import 'package:logger/logger.dart';
import 'package:helioss/models/helioss_model.dart';
import 'package:helioss/models/sucess_response_model.dart';
import 'package:helioss/models/wathermap_model.dart';

class HeliossResponses {
  late List<HeliossInterface> heliossByDate;
  late List<EnergiesInterface> energiesByDate;
  late List<EnergiesInterface> energies;

  late List<HeliossInterface> helioss;
  late HeliossInterface lastFiltration;
  late SuccessResponse successResponse;
  late WathermapInterface temperature;
  late WathermapInterface cloud;

  HeliossResponses();

  // Define the getHeliossByDate method
  List<HeliossInterface> getHeliossByDate(List<dynamic> data) {
    Logger log = logger;
    heliossByDate = [];
    for (dynamic heiloss in data) {
      HeliossInterface energies = HeliossInterface.fromJson(heiloss);
      heliossByDate.add(energies);
    }
    log.i("heliossByDate $heliossByDate");
    return heliossByDate;
  }

  // Define the getEnergies method
  // Define the getEnergies method

  // Define the getHeliossByDate method
  List<HeliossInterface> getHelioss(List<dynamic> data) {
    helioss = [];
    for (dynamic item in data) {
      HeliossInterface energies = HeliossInterface.fromJson(item);
      heliossByDate.add(energies);
    }
    return helioss;
  }

  // Define the getEenergiesByDate method
  List<EnergiesInterface> getEenergiesByDate(List<dynamic> data) {
    energies = [];
    for (dynamic item in data) {
      EnergiesInterface listEnergies = EnergiesInterface.fromJson(item);
      energiesByDate.add(listEnergies);
    }
    return energies;
  }

  HeliossInterface getLastFiltration(Map<String, dynamic> data) {
    return lastFiltration = HeliossInterface.fromJson(data);
  }

  SuccessResponse convertSuccessResponse(Map<String, dynamic> data) {
    return successResponse = SuccessResponse.fromJson(data);
  }

  WathermapInterface getTemperature(Map<String, dynamic> data) {
    return temperature = WathermapInterface.fromJson(data);
  }

  WathermapInterface getCloud(Map<String, dynamic> data) {
    return cloud = WathermapInterface.fromJson(data);
  }
}
