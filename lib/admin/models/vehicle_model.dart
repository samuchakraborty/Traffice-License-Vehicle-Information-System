
class Vechile {
  Vechile({
    this.msg,
    this.vehicles,
  });

  String? msg;
  List<Vehicle>? vehicles;

  factory Vechile.fromJson(Map<String, dynamic> json) => Vechile(
    msg: json["msg"],
    vehicles: List<Vehicle>.from(json["vehicles"].map((x) => Vehicle.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "vehicles": List<dynamic>.from(vehicles!.map((x) => x.toJson())),
  };
}

class Vehicle {
  Vehicle({
    this.id,
    this.nationalId,
    this.vehiclesNo,
    this.insuranceDate,
    this.type,
    this.uId,
    this.image,
    this.fitnessReportNumber,
    this.insurnceNumber,
  });

  int? id;
  int? nationalId;
  String? vehiclesNo;
  String? insuranceDate;
  String? type;
  int? uId;
  String? image;
  int? fitnessReportNumber;
  int? insurnceNumber;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    id: json["id"],
    nationalId: json["national_id"],
    vehiclesNo: json["vehicles_no"],
    insuranceDate: json["insurance_date"],
    type: json["type"],
    uId: json["u_id"],
    image: json["image"],
    fitnessReportNumber: json["fitness_report_number"],
    insurnceNumber: json["insurnce_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "national_id": nationalId,
    "vehicles_no": vehiclesNo,
    "insurance_date": insuranceDate,
    "type": type,
    "u_id": uId,
    "image": image,
    "fitness_report_number": fitnessReportNumber,
    "insurnce_number": insurnceNumber,
  };
}
