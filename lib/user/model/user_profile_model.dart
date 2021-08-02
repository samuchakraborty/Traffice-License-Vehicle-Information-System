//
//
// class UserProfile {
//   UserProfile({
//     this.status,
//     this.userInfo,
//     this.license,
//   });
//
//   String? status;
//   UserInfo? userInfo;
//   List<License>? license;
//
//   factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
//     status: json["status"],
//     userInfo: UserInfo.fromJson(json["userInfo"]),
//     license: List<License>.from(json["license"].map((x) => License.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "userInfo": userInfo!.toJson(),
//     "license": List<dynamic>.from(license!.map((x) => x.toJson())),
//   };
// }
//
// class License {
//   License({
//     this.id,
//     this.uName,
//     this.mobile,
//     this.password,
//     this.otp,
//     this.nId,
//     this.uId,
//     this.lcNo,
//     this.lcType,
//     this.lcStatus,
//     this.examDate,
//   });
//
//   int? id;
//   String? uName;
//   int? mobile;
//   String? password;
//   int? otp;
//   int? nId;
//   int? uId;
//   String? lcNo;
//   String? lcType;
//   String? lcStatus;
//   DateTime? examDate;
//
//   factory License.fromJson(Map<String, dynamic> json) => License(
//     id: json["id"],
//     uName: json["u_name"],
//     mobile: json["mobile"],
//     password: json["password"],
//     otp: json["otp"],
//     nId: json["n_id"],
//     uId: json["u_id"],
//     lcNo: json["lc_no"],
//     lcType: json["lc_type"],
//     lcStatus: json["lc_status"],
//     examDate: (json["exam_date"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "u_name": uName,
//     "mobile": mobile,
//     "password": password,
//     "otp": otp,
//     "n_id": nId,
//     "u_id": uId,
//     "lc_no": lcNo,
//     "lc_type": lcType,
//     "lc_status": lcStatus,
//     "exam_date": examDate,
//   };
// }
//
// class UserInfo {
//   UserInfo({
//     this.uName,
//     this.mobile,
//     this.id,
//     this.image,
//     this.pAddress,
//     this.dob,
//   });
//
//   String? uName;
//   int? mobile;
//   int? id;
//   String? image;
//   String? pAddress;
//   String? dob;
//
//   factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
//     uName: json["u_name"],
//     mobile: json["mobile"],
//     id: json["id"],
//     image: json["image"],
//     pAddress: json["p_address"],
//     dob: json["dob"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "u_name": uName,
//     "mobile": mobile,
//     "id": id,
//     "image": image,
//     "p_address": pAddress,
//     "dob": dob,
//   };
// }
