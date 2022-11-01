import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/Farmer/data/models/farmer_model.dart';
import 'package:project_tani/feature/Farmer/domain/entities/farmer.dart';
import 'package:project_tani/feature/Farmer/domain/repositories/farmer_repositories.dart';

class UpdateFarmerUsecase implements UseCase<Farmer, ParamsUpdateFarmer> {
  final FarmerRepository repository;

  UpdateFarmerUsecase(this.repository);

  @override
  Future<FarmerModel?> call(ParamsUpdateFarmer params) async {
    return await repository.updateFarmer(
        params.token,
        params.id,
        params.name,
        params.landLocation,
        params.numberTree,
        params.estimationProduction,
        params.landSize);
  }
}

class ParamsUpdateFarmer extends Equatable {
  final String? id;
  final String? token;
  final String? name;
  final String? landLocation;
  final String? numberTree;
  final String? estimationProduction;
  final String? landSize;

  const ParamsUpdateFarmer({
    required this.id,
    required this.token,
    required this.name,
    required this.landLocation,
    required this.numberTree,
    required this.estimationProduction,
    required this.landSize,
  });

  @override
  List<Object?> get props => [
    id,
    token,
    name,
    landLocation,
    numberTree,
    estimationProduction,
    landSize
  ];
}