import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/login/domain/repositories/auth_repositories.dart';

class LogoutUsecase implements UseCase<void, ParamsLogout> {
  final AuthRepository repository;

  LogoutUsecase(this.repository);

  @override
  Future<void> call(ParamsLogout params) async {
    return await repository.logout(params.token);
  }
}

class ParamsLogout extends Equatable {
  final String? token;


  const ParamsLogout({
    required this.token
  });

  @override
  List<Object?> get props => [
    token
  ];
}
