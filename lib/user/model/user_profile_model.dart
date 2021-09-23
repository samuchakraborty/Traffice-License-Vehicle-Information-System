

class UserInfo {
  UserInfo({
    this.status,
    this.userInfo,
    this.license,
  });

  String? status;
  UserInfoClass? userInfo;
  List<License>? license;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    status: json["status"],
    userInfo: UserInfoClass.fromJson(json["userInfo"]),
    license: List<License>.from(json["license"].map((x) => License.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "userInfo": userInfo!.toJson(),
    "license": List<dynamic>.from(license!.map((x) => x.toJson())),
  };
}

class License {
  License({
    this.id,
    this.uName,
    this.mobile,
    this.password,
    this.otp,
    this.nId,
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
  String? uName;
  int? mobile;
  String? password;
  int? otp;
  int? nId;
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

  factory License.fromJson(Map<String, dynamic> json) => License(
    id: json["id"],
    uName: json["u_name"],
    mobile: json["mobile"],
    password: json["password"],
    otp: json["otp"],
    nId: json["n_id"],
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
    "u_name": uName,
    "mobile": mobile,
    "password": password,
    "otp": otp,
    "n_id": nId,
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

class UserInfoClass {
  UserInfoClass({
    this.uName,
    this.mobile,
    this.id,
    this.image,
    this.pAddress,
    this.dob,
  });

  String? uName;
  int? mobile;
  int? id;
  String? image;
  String? pAddress;
  DateTime? dob;

  factory UserInfoClass.fromJson(Map<String, dynamic> json) => UserInfoClass(
    uName: json["u_name"],
    mobile: json["mobile"],
    id: json["id"],
    image: json["image"],
    pAddress: json["p_address"],
    dob: DateTime.parse(json["dob"]),
  );

  Map<String, dynamic> toJson() => {
    "u_name": uName,
    "mobile": mobile,
    "id": id,
    "image": image,
    "p_address": pAddress,
    "dob": dob!.toIso8601String(),
  };
}
