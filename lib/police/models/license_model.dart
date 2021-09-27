
class LicenseInfo {
  LicenseInfo({
    this.msg,
    this.licenseInformation,
    this.userInformation,
  });

  String? msg;
  List<LicenseInformation>? licenseInformation;
  List<UserInformation>? userInformation;

  factory LicenseInfo.fromJson(Map<String, dynamic> json) => LicenseInfo(
    msg: json["msg"],
    licenseInformation: List<LicenseInformation>.from(json["licenseInformation"].map((x) => LicenseInformation.fromJson(x))),
    userInformation: List<UserInformation>.from(json["userInformation"].map((x) => UserInformation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "licenseInformation": List<dynamic>.from(licenseInformation!.map((x) => x.toJson())),
    "userInformation": List<dynamic>.from(userInformation!.map((x) => x.toJson())),
  };
}

class LicenseInformation {
  LicenseInformation({
    this.id,
    this.uId,
    this.lcNo,
    this.lcType,
    this.lcStatus,
    this.examDate,
    this.lcIssueDate,
    this.lcExpiredDate,
    this.image,
    this.userType,
    this.applicationDate,
    this.name,
  });

  int? id;
  int? uId;
  String? lcNo;
  String? lcType;
  String? lcStatus;
  dynamic examDate;
  dynamic lcIssueDate;
  dynamic lcExpiredDate;
  String? image;
  String? userType;
  DateTime? applicationDate;
  String? name;

  factory LicenseInformation.fromJson(Map<String, dynamic> json) => LicenseInformation(
    id: json["id"],
    uId: json["u_id"],
    lcNo: json["lc_no"],
    lcType: json["lc_type"],
    lcStatus: json["lc_status"],
    examDate: json["exam_date"],
    lcIssueDate: json["lc_issue_date"],
    lcExpiredDate: json["lc_expired_date"],
    image: json["image"],
    userType: json["user_type"],
    applicationDate: DateTime.parse(json["application_date"]),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "u_id": uId,
    "lc_no": lcNo,
    "lc_type": lcType,
    "lc_status": lcStatus,
    "exam_date": examDate,
    "lc_issue_date": lcIssueDate,
    "lc_expired_date": lcExpiredDate,
    "image": image,
    "user_type": userType,
    "application_date": applicationDate!.toIso8601String(),
    "name": name,
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
