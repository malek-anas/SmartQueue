import 'dart:convert';

class PlacesModels {
  bool? status;
  List<Places>? places;
  String? message;

  PlacesModels({this.status, this.places, this.message});

  factory PlacesModels.fromJson(dynamic json2) {
    print("DONE");
    dynamic json3 = json.decode(json2.substring(22));
    print(json3["status"]);
    print(json3["message"]);
    print(json3["Places"]);
    return PlacesModels(
      places: List<Places>.from(json3["Places"].map((x) => Places.fromJson(x))),
      status: json3["status"],
      message: json3["message"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (places != null) {
      data['Places'] = places!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Places {
  int? id;
  int? categoryId;
  String? name;
  String? information;
  String? image;

  Places({this.id, this.categoryId, this.name, this.information, this.image});

  Places.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    information = json['information'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['information'] = information;
    data['image'] = image;
    return data;
  }
}
