class HeliossInterface {
  late String? id;
  late String? message;
  late String? energie;
  late String? filtration;
  late String? date;
  late String? time;
  HeliossInterface(
      {this.message,
      this.filtration,
      this.date,
      this.energie,
      this.time,
      this.id});
  factory HeliossInterface.fromJson(Map<String, dynamic> json) {
    HeliossInterface heliossInstance = HeliossInterface();
    heliossInstance.id = json["_id"];
    heliossInstance.message = json["message"];
    heliossInstance.energie = json["energie"];
    heliossInstance.filtration = json["filtration"];
    heliossInstance.date = json["date"];
    heliossInstance.time = json["time"];
    return heliossInstance;
  }
}
