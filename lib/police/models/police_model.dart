
class PoliceInfo {
  PoliceInfo({
    this.message,
    this.policeInfo,
    this.policeInformation,
  });

  String? message;
  PoliceDesignations? policeInfo;
  PoliceInformation? policeInformation;

  factory PoliceInfo.fromJson(Map<String, dynamic> json) => PoliceInfo(
    message: json["message"],
    policeInfo: PoliceDesignations.fromJson(json["data"]),
    policeInformation: PoliceInformation.fromJson(json["policeInformation"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": policeInfo!.toJson(),
    "policeInformation": policeInformation!.toJson(),
  };
}

class PoliceDesignations {
  PoliceDesignations({
    this.id,
    this.nId,
    this.thana,
    this.position,
    this.district,
    this.name,
  });

  int? id;
  int? nId;
  String? thana;
  String? position;
  String? district;
  String? name;

  factory PoliceDesignations.fromJson(Map<String, dynamic> json) => PoliceDesignations(
    id: json["id"],
    nId: json["n_id"],
    thana: json["thana"],
    position: json["position"],
    district: json["district"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "n_id": nId,
    "thana": thana,
    "position": position,
    "district": district,
    "name": name,
  };
}

class PoliceInformation {
  PoliceInformation({
    this.nId,
    this.firstName,
    this.lastName,
    this.dob,
    this.image,
    this.pAddress,
  });

  int? nId;
  String? firstName;
  String? lastName;
  DateTime? dob;
  String? image;
  String? pAddress;

  factory PoliceInformation.fromJson(Map<String, dynamic> json) => PoliceInformation(
    nId: json["n_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    dob: DateTime.parse(json["dob"]),
    image: json["image"],
    pAddress: json["p_address"],
  );

  Map<String, dynamic> toJson() => {
    "n_id": nId,
    "first_name": firstName,
    "last_name": lastName,
    "dob": dob!.toIso8601String(),
    "image": image,
    "p_address": pAddress,
  };
}
