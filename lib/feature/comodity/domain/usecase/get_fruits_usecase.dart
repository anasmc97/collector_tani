import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/comodity/data/models/fruit_model.dart';
import 'package:project_tani/feature/comodity/domain/entity/fruit.dart';
import 'package:project_tani/feature/comodity/domain/repositories/comodity_repositories.dart';

class GetFruitUsecase implements UseCase<List<Fruit?>?, ParamsGetFruit> {
  final ComodityRepository repository;

  GetFruitUsecase(this.repository);

  @override
  Future<List<FruitModel?>?> call(ParamsGetFruit params) async {
    return await repository.getFruits(params.token);
  }
}

class ParamsGetFruit extends Equatable {
  final String? token;

  const ParamsGetFruit({required this.token});

  @override
  // TODO: implement props
  List<Object?> get props => [
        token,
      ];
}
