class SearchModel {
  SearchModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.information,
    required this.image,
  });

  int id;
  int categoryId;
  String name;
  String information;
  String image;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    id: json["id"],
    categoryId: json["category_id"],
    name: json["name"],
    information: json["information"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "name": name,
    "information": information,
    "image": image,
  };
}
