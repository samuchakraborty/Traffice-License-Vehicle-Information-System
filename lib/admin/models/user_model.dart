
class User {
  User({
    this.msg,
    this.license,
  });

  String? msg;
  List<License>? license;

  factory User.fromJson(Map<String, dynamic> json) => User(
    msg: json["msg"],
    license: List<License>.from(json["license"].map((x) => License.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "license": List<dynamic>.from(license!.map((x) => x.toJson())),
  };
}

class License {
  License({
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
  DateTime? examDate;
  DateTime? lcIssueDate;
  DateTime? lcExpiredDate;
  String? image;
  String? userType;
  String? applicationDate;
  String? name;

  factory License.fromJson(Map<String, dynamic> json) => License(
    id: json["id"],
    uId: json["u_id"],
    lcNo: json["lc_no"],
    lcType: json["lc_type"],
    lcStatus: json["lc_status"],
    examDate: json["exam_date"] == null ? null : DateTime.parse(json["exam_date"]),
    lcIssueDate: json["lc_issue_date"] == null ? null : DateTime.parse(json["lc_issue_date"]),
    lcExpiredDate: json["lc_expired_date"] == null ? null : DateTime.parse(json["lc_expired_date"]),
    image: json["image"],
    userType: json["user_type"],
    applicationDate: json["application_date"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "u_id": uId,
    "lc_no": lcNo,
    "lc_type": lcType,
    "lc_status": lcStatus,
    "exam_date": examDate == null ? null : examDate!.toIso8601String(),
    "lc_issue_date": lcIssueDate == null ? null : lcIssueDate!.toIso8601String(),
    "lc_expired_date": lcExpiredDate == null ? null : lcExpiredDate!.toIso8601String(),
    "image": image,
    "user_type": userType,
    "application_date": applicationDate,
    "name": name,
  };
}
