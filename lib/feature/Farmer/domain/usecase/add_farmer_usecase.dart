import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/Farmer/data/models/farmer_model.dart';
import 'package:project_tani/feature/Farmer/domain/entities/farmer.dart';
import 'package:project_tani/feature/Farmer/domain/repositories/farmer_repositories.dart';

class AddFarmerUsecase implements UseCase<Farmer, ParamsAddFarmer> {
  final FarmerRepository repository;

  AddFarmerUsecase(this.repository);

  @override
  Future<FarmerModel?> call(ParamsAddFarmer params) async {
    return await repository.addFarmer(params.token, params.name, params.landLocation, params.numberTree, params.estimationProduction, params.landSize);
  }
}

class ParamsAddFarmer extends Equatable {
  final String? token;
  final String? name;
  final String? landLocation;
  final String? numberTree;
  final String? estimationProduction;
  final String? landSize;

  const ParamsAddFarmer({
    required this.token,
    required this.name,
    required this.landLocation,
    required this.numberTree,
    required this.estimationProduction,
    required this.landSize,
  });

  @override
  List<Object?> get props => [
    token,
    name,
    landLocation,
    numberTree,
    estimationProduction,
    landSize
  ];
}