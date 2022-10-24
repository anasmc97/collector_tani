import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/login/data/models/auth_model.dart';
import 'package:project_tani/feature/login/domain/entities/user.dart';
import 'package:project_tani/feature/login/domain/repositories/auth_repositories.dart';

class LoginUsecase implements UseCase<User, ParamsLogin> {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<AuthModel?> call(ParamsLogin params) async {
    return await repository.login(params.email, params.password);
  }
}

class ParamsLogin extends Equatable {
  final String? email;
  final String? password;


  const ParamsLogin({
    required this.email,
    required this.password
  });

  @override
  List<Object?> get props => [
    email,
    password
  ];
}