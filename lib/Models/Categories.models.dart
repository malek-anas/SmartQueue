import 'dart:convert';

class CategoriesModel {
  CategoriesModel({
    required this.status,
    required this.errNum,
    required this.msg,
    required this.categories,
  });

  bool? status;
  String? errNum;
  String? msg;
  List<Category>? categories;
  factory CategoriesModel.fromJson(dynamic json2) {
    print("DONE");
    dynamic json3 = json.decode(json2.substring(22));
    print(json3["status"]);
    print(json3["token"]);
    // print(Map.);

    return CategoriesModel(

      categories: List<Category>.from(json3["Categories"].map((x) => Category.fromJson(x))),
      status: json3["status"],
      msg: json3["msg"],
      errNum: json3["errNum"],

    );
  }
  Map<String, dynamic> toJson() => {
    "status": status,
    "errNum": errNum,
    "msg": msg,
    "Categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  int? id;
  String? name;
  String? image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}
