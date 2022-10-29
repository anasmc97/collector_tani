import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/login/domain/repositories/auth_repositories.dart';

class LogoutUsecase implements UseCase<void, NoParams> {
  final AuthRepository repository;

  LogoutUsecase(this.repository);

  @override
  Future<void> call(NoParams params) async {
    return await repository.logout();
  }
}
