class WathermapInterface {
  double? temperature;
  double? cloud;

  WathermapInterface({this.temperature, this.cloud});

  factory WathermapInterface.fromJson(Map<String, dynamic> json) {
    return WathermapInterface(
      temperature:
          json["temperature"] != null ? json["temperature"] as double : null,
      cloud: json["cloud"] != null ? json["cloud"] as double : null,
    );
  }
}
