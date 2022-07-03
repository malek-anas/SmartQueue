import 'dart:convert';
import 'package:smartqueue/Models/Branch-models.dart';

class FavoritesModel {
  FavoritesModel({
    required this.data,
    required this.message,
    required this.status,
  });

  List<FavModel> data;
  String message;
  bool status;
  factory FavoritesModel.fromJson(text) {
    dynamic _json = json.decode(text.substring(22));
    return FavoritesModel(
      data: List<FavModel>.from(_json["data"].map((x) => FavModel.fromJson(x))),
      message: _json["message"],
      status: _json["status"],
    );
  }
}

class FavModel {
  FavModel({
    required this.id,
    required this.userId,
    required this.branchId,
    required this.branch,
  });

  int id;
  int userId;
  int branchId;
  Branch branch;

  factory FavModel.fromJson(Map<String, dynamic> json) => FavModel(
        id: json["id"],
        userId: json["user_id"],
        branchId: json["branch_id"],
        branch: Branch.fromJson(json['branch']),
      );
}

class AddFavoritesModel {
  List<String>? message;
  bool? status;

  AddFavoritesModel({this.message, this.status});
  factory AddFavoritesModel.fromJson(dynamic json2) {
    print("DONE");
    dynamic json3 = json.decode(json2.substring(22));
    print(json3["message"]);
    print(json3["status"]);

    return AddFavoritesModel(
      status: json3["status"],
      message: json3["message"].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
