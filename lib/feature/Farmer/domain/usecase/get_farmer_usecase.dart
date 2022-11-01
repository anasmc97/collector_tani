import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/Farmer/data/models/farmer_model.dart';
import 'package:project_tani/feature/Farmer/domain/entities/farmer.dart';
import 'package:project_tani/feature/Farmer/domain/repositories/farmer_repositories.dart';

class GetAllFarmerUsecase implements UseCase<List<Farmer?>?, ParamsGetAllFarmer> {
  final FarmerRepository repository;

  GetAllFarmerUsecase(this.repository);

  @override
  Future<List<FarmerModel?>?> call(ParamsGetAllFarmer params) async {
    return await repository.getAllFarmer(params.token);
  }
}

class ParamsGetAllFarmer extends Equatable {
  final String? token;

  const ParamsGetAllFarmer({
    required this.token,
  });

  @override
  List<Object?> get props => [
    token,
  ];
}