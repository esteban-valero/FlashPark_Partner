import 'package:hello_world_flutter/Model/Parking.dart';

class User {
  String Phone;
  bool admin;
  Parking parking;

  String name;
  String pasword;

  String email;
  String image;

  User(this.Phone);

  Map<String, dynamic> toJson() => {
        'Phone': Phone,
        'admin': admin,
        'Email': email,
        'name': name,
        'image': image
        //'Pasword': pasword,
      };
}
