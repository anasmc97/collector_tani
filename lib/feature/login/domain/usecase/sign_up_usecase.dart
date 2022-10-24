import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/login/data/models/auth_model.dart';
import 'package:project_tani/feature/login/domain/entities/user.dart';
import 'package:project_tani/feature/login/domain/repositories/auth_repositories.dart';

class SignUpUsecase implements UseCase<User, ParamsSignUp> {
  final AuthRepository repository;

  SignUpUsecase(this.repository);

  @override
  Future<AuthModel?> call(ParamsSignUp params) async {
    return await repository.signUp(params.name, params.phoneNumber, params.email, params.password);
  }
}

class ParamsSignUp extends Equatable {
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? password;

  const ParamsSignUp({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.password
  });

  @override
  List<Object?> get props => [
    name,
    phoneNumber,
    email,
    password
  ];
}