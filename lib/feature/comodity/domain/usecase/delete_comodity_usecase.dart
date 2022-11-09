import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/comodity/domain/repositories/comodity_repositories.dart';

class DeleteComodityUsecase implements UseCase<void, ParamsDeleteComodity> {
  final ComodityRepository repository;

  DeleteComodityUsecase(this.repository);

  @override
  Future<void> call(ParamsDeleteComodity params) async {
    return await repository.deleteComodity(params.token, params.id);
  }
}

class ParamsDeleteComodity extends Equatable {
  final String? token;
  final String? id;

  const ParamsDeleteComodity({
    required this.token,
    required this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [token, id];
}
