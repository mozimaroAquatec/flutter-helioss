class SuccessResponse {
  late int? status;
  late String? message;
  late dynamic data;
  SuccessResponse({
    this.status,
    this.message,
    this.data,
  });
  factory SuccessResponse.fromJson(Map<String, dynamic> json) {
    SuccessResponse successResponse = SuccessResponse();
    successResponse.status = json["status"];
    successResponse.message = json["message"];
    successResponse.data = json["data"];

    return successResponse;
  }
}
