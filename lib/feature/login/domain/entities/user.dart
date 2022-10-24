import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? id;
  final String? token;

  User({
    this.name,
    this.phoneNumber,
    this.email,
    this.id,
    this.token,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    name,
    phoneNumber,
    email,
    id,
    token,
  ];
}