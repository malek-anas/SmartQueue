class GetReservationModel {
  GetReservationModel({
    required this.id,
    required this.userId,
    required this.branchId,
    required this.status,
    required this.turn,
    required this.currentReservation,
    required this.branch,
    required this.serviceId,
    required this.serviceName,
  });

  String id;
  int userId;
  int branchId;
  int status;
  int turn;
  int currentReservation;
  Branch branch;
  String serviceName;
  int serviceId;
  factory GetReservationModel.fromJson(dynamic json3) {
    return GetReservationModel(
      id: json3["id"].toString(),
      userId: json3["user_id"],
      branchId: json3["branch_id"],
      status: json3["status"],
      turn: json3["turn"],
      serviceId: json3['service']['id'],
      serviceName: json3['service']['name'],
      currentReservation: json3["current_reservation"],
      branch: Branch.fromJson(json3['branch']),
    );
  }
}

class Branch {
  Branch({
    required this.id,
    required this.placeId,
    required this.name,
    required this.location,
    required this.image,
    // required this.place,
  });

  int id;
  int placeId;
  String name;
  String location;
  String image;
  // Place? place;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        placeId: json["place_id"],
        name: json["name"],
        location: json["location"],
        image: json["image"],
        //  place: Place.fromJson(json['place']),
      );
}

class Place {
  Place({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.information,
    required this.image,
    required this.category,
  });

  int id;
  int categoryId;
  String name;
  String information;
  String image;
  Category category;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        information: json["information"],
        image: json["image"],
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "information": information,
        "image": image,
        "category": category.toJson(),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  int id;
  String name;
  String image;

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
