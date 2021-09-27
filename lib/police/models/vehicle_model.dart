

class VehicleInfo {
  VehicleInfo({
    this.msg,
    this.vehicleInformation,
    this.userInformation,
  });

  String? msg;
  List<VehicleInformation>? vehicleInformation;
  List<UserInformation>? userInformation;

  factory VehicleInfo.fromJson(Map<String, dynamic> json) => VehicleInfo(
    msg: json["msg"],
    vehicleInformation: List<VehicleInformation>.from(json["vehicleInformation"].map((x) => VehicleInformation.fromJson(x))),
    userInformation: List<UserInformation>.from(json["userInformation"].map((x) => UserInformation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "vehicleInformation": List<dynamic>.from(vehicleInformation!.map((x) => x.toJson())),
    "userInformation": List<dynamic>.from(userInformation!.map((x) => x.toJson())),
  };
}
class UserInformation {
  UserInformation({
    this.id,
    this.uName,
    this.mobile,
    this.password,
    this.otp,
    this.nId,
  });

  int? id;
  String? uName;
  int? mobile;
  String? password;
  int? otp;
  int? nId;

  factory UserInformation.fromJson(Map<String, dynamic> json) => UserInformation(
    id: json["id"],
    uName: json["u_name"],
    mobile: json["mobile"],
    password: json["password"],
    otp: json["otp"],
    nId: json["n_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "u_name": uName,
    "mobile": mobile,
    "password": password,
    "otp": otp,
    "n_id": nId,
  };
}

class VehicleInformation {
  VehicleInformation({
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

  factory VehicleInformation.fromJson(Map<String, dynamic> json) => VehicleInformation(
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
