import 'dart:convert';

class BranchesModel {
  BranchesModel({
    required this.status,
    required this.branches,
    required this.message,
  });

  bool? status;
  List<Branch>? branches;
  String? message;
  factory BranchesModel.fromJson(dynamic json2) {
    print("DONE");
    dynamic json3 = json.decode(json2.substring(22));
    print(json3["status"]);
    print(json3["token"]);

    return BranchesModel(
      status: json3["status"],
      message: json3["message"] as String,
      branches: List<Branch>.from(json3["Branches"].map((x) => Branch.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "Branches": List<dynamic>.from(branches!.map((x) => x.toJson())),
        "message": message,
      };
}

class Branch {
  Branch({
    required this.id,
    required this.placeId,
    required this.name,
    required this.location,
    required this.image,
    required this.isFav,
  });

  int? id;
  int? placeId;
  String? name;
  String? location;
  String? image;
  bool? isFav;
  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        placeId: json["place_id"],
        name: json["name"],
        location: json["location"],
        image: json["image"],
        isFav: json['fav'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "place_id": placeId,
        "name": name,
        "location": location,
        "image": image,
      };
}
