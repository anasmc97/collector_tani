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
  final AuthModel? authModel;
  AuthDataLoaded({required this.authModel});
  @override
  List<Object?> get props => [authModel];
}
class AuthDataError extends AuthState {
  final String? message;
  AuthDataError({required this.message});
  @override
  List<Object?> get props => [message];
}
