import 'dart:convert';

class ReservationModel {
  ReservationModel({
    required this.data,
    required this.message,
  });

  Data? data;
  String message;
  factory ReservationModel.fromJson(dynamic json2) {
    print("DONE");
    dynamic json3 = json.decode(json2.substring(22));

    return ReservationModel(
      //message: json3["messege"],
      data: Data.fromJson(json3['data']),
      message: json3['message'] ?? '',
    );
  }
}

class Data {
  Data({
    required this.userId,
    required this.branchId,
    required this.status,
    required this.turn,
    required this.currentReservation,
    required this.id,
    required this.serviceId,
  });

  int userId;
  int branchId;
  int status;
  int turn;
  int currentReservation;
  int id;
  int serviceId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        branchId: json["branch_id"],
        status: json["status"],
        turn: json["turn"],
        currentReservation: json["current_reservation"],
        id: json["id"],
        serviceId: json['service_id'],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "branch_id": branchId,
        "status": status,
        "turn": turn,
        "current_reservation": currentReservation,
        "id": id,
      };
}
