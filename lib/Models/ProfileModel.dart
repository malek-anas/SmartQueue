import 'dart:convert';

class ProfileModel {
  String? name;
  String? email;
  String? phone;

  ProfileModel({this.name, this.email, this.phone});
  factory ProfileModel.fromJson(dynamic json2) {
    print("DONE");
    dynamic json3 = json.decode(json2.substring(22));

    return ProfileModel(
      name: json3["Name"],
      email: json3["Email"],
      phone: json3["Phone"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['Email'] = email;
    data['Phone'] = phone;
    return data;
  }
}
