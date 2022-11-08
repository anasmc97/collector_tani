import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/comodity/domain/repositories/comodity_repositories.dart';

class UpdateComodityUsecase implements UseCase<void, ParamsUpdateComodity> {
  final ComodityRepository repository;

  UpdateComodityUsecase(this.repository);

  @override
  Future<void> call(ParamsUpdateComodity params) async {
    return await repository.updateComodity(
        params.token,
        params.id,
        params.blossomTreeDate,
        params.harvestingDate,
        params.fruitGrade,
        params.weight);
  }
}

class ParamsUpdateComodity extends Equatable {
  final String? token;
  final String? id;
  final String? blossomTreeDate;
  final String? harvestingDate;
  final String? fruitGrade;
  final int? weight;

  const ParamsUpdateComodity(
      {required this.token,
      required this.id,
      required this.blossomTreeDate,
      required this.harvestingDate,
      required this.fruitGrade,
      required this.weight});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [token, id, blossomTreeDate, harvestingDate, fruitGrade, weight];
}
