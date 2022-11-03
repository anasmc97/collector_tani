import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/comodity/domain/repositories/comodity_repositories.dart';

class AddComodityUsecase implements UseCase<void, ParamsAddComodity> {
  final ComodityRepository repository;

  AddComodityUsecase(this.repository);

  @override
  Future<void> call(ParamsAddComodity params) async {
    return await repository.addComodity(params.token, params.farmerId, params.fruitId);
  }
}

class ParamsAddComodity extends Equatable {
  final String? token;
  final String? farmerId;
  final String? fruitId;

  const ParamsAddComodity({
    required this.token,
    required this.farmerId,
    required this.fruitId
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    token,
    farmerId,
    fruitId,
  ];

}