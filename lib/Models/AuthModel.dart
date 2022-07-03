import 'dart:convert';



class AuthModel {
  AuthModel({
    required this.data,
    required this.token,
    required this.message,
    required this.status,
    required this.success,
    this.id,
  });

  Data data;
  String token;
  String message;
  bool status;
  bool success;
  double? id;
  factory AuthModel.fromJson(dynamic json2) {
    print("DONE");
    dynamic json3 = json.decode(json2.substring(22));
    print(json3["status"]);
    print("starrrrrrrrrrrrrrrrrrrt");
    print(json3["token"]);
    print("endddddddddddddddddddddddd");
    // print(Map.);

    return AuthModel(
      data: Data.fromJson(json3['data']),
      // data: Data(id: 777, name: "name", email: "email", password: "password", phone: "phone"),
      status: json3["status"],
      token: json3["token"] as String,
      // token: "555",
      // message: "55",
      message: json3["message"] as String,
      // success: json3["success"] ?? '',
      success: true,
      id: double.parse(json3['data']['id'].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "token": token,
        "message": message,
        "status": status,
        "success": success,
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  int id;
  String name;
  String email;
  String password;
  String phone;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
      };
}
