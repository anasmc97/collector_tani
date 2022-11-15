import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/comodity/data/models/comodity_model.dart';
import 'package:project_tani/feature/comodity/data/models/fruit_model.dart';
import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
import 'package:project_tani/feature/comodity/domain/entity/fruit.dart';
import 'package:project_tani/feature/comodity/domain/repositories/comodity_repositories.dart';

class GetListComodityVerifiedUsecase
    implements UseCase<List<Comodity?>?, ParamsGetListComodityVerified> {
  final ComodityRepository repository;

  GetListComodityVerifiedUsecase(this.repository);

  @override
  Future<List<ComodityModel?>> call(
      ParamsGetListComodityVerified params) async {
    return await repository.getListComodityVerified(params.token);
  }
}

class ParamsGetListComodityVerified extends Equatable {
  final String? token;

  const ParamsGetListComodityVerified({required this.token});

  @override
  // TODO: implement props
  List<Object?> get props => [
        token,
      ];
}
