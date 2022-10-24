part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable{}

class LoginEvent extends AuthEvent {
  final String? email;
  final String? password;
  LoginEvent({
  this.email,
  this.password
  });
  @override
  List<Object?> get props => [
    email,
    password
  ];
}
class AutoLoginEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class SignUpEvent extends AuthEvent {
  final String? email;
  final String? name;
  final String? phoneNumber;
  final String? password;
  SignUpEvent({
    this.email,
    this.name,
    this.phoneNumber,
    this.password,
  });
  @override
  List<Object?> get props => [
    email,
    name,
    phoneNumber,
    password
  ];
}

class LogoutEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

