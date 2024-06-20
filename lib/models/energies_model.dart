class EnergiesInterface {
  double? energieByDate;

  EnergiesInterface({this.energieByDate});

  factory EnergiesInterface.fromJson(Map<String, dynamic> json) {
    EnergiesInterface energiesInterface = EnergiesInterface();
    energiesInterface.energieByDate = json['energieByDate'];
    return energiesInterface;
  }

  Map<String, dynamic> toJson() => {
        "energieByDate": energieByDate,
      };
}
