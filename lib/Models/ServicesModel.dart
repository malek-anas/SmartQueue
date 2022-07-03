class ServiceModel {
  ServiceModel({
    required this.id,
    required this.name,
    required this.branchId,
  });

  int id;
  String name;
  int branchId;

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json["id"],
        name: json["name"],
        branchId: json["branch_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "branch_id": branchId,
      };
}
