part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable{}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}
class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}
class AuthEmpty extends AuthState {
  @override
  List<Object?> get props => [];
}
class AuthDataLoaded extends AuthState {
  final User? user;
  AuthDataLoaded({required this.user});
  @override
  List<Object?> get props => [user];
}
class AuthDataError extends AuthState {
  final String? message;
  AuthDataError({required this.message});
  @override
  List<Object?> get props => [message];
}
