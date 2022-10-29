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

   AuthModel copyWith({
     String? name,
     String? phoneNumber,
     String? email,
     String? id,
     String? token
   }){
     return AuthModel(
         name: name ?? this.name,
         phoneNumber: phoneNumber ?? this.phoneNumber,
         email: email ?? this.email,
         id: id ?? this.id,
         token: token ?? this.token);
   }

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      name: json['name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      id: json['id'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone_number': phoneNumber,
      'email': email,
      'id': id,
      'token': token,
    };
  }
}