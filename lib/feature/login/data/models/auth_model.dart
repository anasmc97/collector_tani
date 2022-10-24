import 'package:project_tani/feature/login/domain/entities/user.dart';

class AuthModel extends User {
   AuthModel({
    required String? name,
    required String? phoneNumber,
    required String? email,
    required String? id,
    required String? token,
  }) : super(
    name: name,
    phoneNumber: phoneNumber,
    email: email,
    id: id,
    token: token,
  );

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      name: json['data']['user']['name'],
      phoneNumber: json['data']['user']['phone_number'],
      email: json['data']['user']['email'],
      id: json['data']['user']['id'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'id': id,
      'token': token,
    };
  }
}