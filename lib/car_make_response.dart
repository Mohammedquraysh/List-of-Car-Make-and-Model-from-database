

import 'dart:convert';

List<CarMakeResponse> carMakeResponseFromJson(String str) => List<CarMakeResponse>.from(json.decode(str).map((x) => CarMakeResponse.fromJson(x)));

String carMakeResponseToJson(List<CarMakeResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarMakeResponse {
  CarMakeResponse({
    required this.make,
    required this.makeId,
  });

  String make;
  String makeId;

  factory CarMakeResponse.fromJson(Map<String, dynamic> json) => CarMakeResponse(
    make: json["make"],
    makeId: json["make_id"],
  );

  Map<String, dynamic> toJson() => {
    "make": make,
    "make_id": makeId,
  };
}
