import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/comodity/data/models/comodity_model.dart';
import 'package:project_tani/feature/comodity/data/models/fruit_model.dart';
import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
import 'package:project_tani/feature/comodity/domain/entity/fruit.dart';
import 'package:project_tani/feature/comodity/domain/repositories/comodity_repositories.dart';

class GetListComodityUsecase
    implements UseCase<List<Comodity?>?, ParamsGetListComodity> {
  final ComodityRepository repository;

  GetListComodityUsecase(this.repository);

  @override
  Future<List<ComodityModel?>> call(ParamsGetListComodity params) async {
    return await repository.getListComodity(params.token);
  }
}

class ParamsGetListComodity extends Equatable {
  final String? token;

  const ParamsGetListComodity({required this.token});

  @override
  // TODO: implement props
  List<Object?> get props => [
        token,
      ];
}
