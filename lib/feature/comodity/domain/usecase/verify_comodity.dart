import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/comodity/domain/repositories/comodity_repositories.dart';

class VerifyComodityUsecase implements UseCase<void, ParamsVerifyComodity> {
  final ComodityRepository repository;

  VerifyComodityUsecase(this.repository);

  @override
  Future<void> call(ParamsVerifyComodity params) async {
    return await repository.verifyComodity(params.token, params.id);
  }
}

class ParamsVerifyComodity extends Equatable {
  final String? token;
  final String? id;

  const ParamsVerifyComodity({
    required this.token,
    required this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [token, id];
}
