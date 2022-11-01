import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/Farmer/data/models/farmer_model.dart';
import 'package:project_tani/feature/Farmer/domain/entities/farmer.dart';
import 'package:project_tani/feature/Farmer/domain/repositories/farmer_repositories.dart';

class DeleteFarmerUsecase implements UseCase<void, ParamsDeleteFarmer> {
  final FarmerRepository repository;

  DeleteFarmerUsecase(this.repository);

  @override
  Future<void> call(ParamsDeleteFarmer params) async {
    return await repository.deleteFarmer(params.token, params.id);
  }
}

class ParamsDeleteFarmer extends Equatable {
  final String? token;
  final String? id;

  const ParamsDeleteFarmer({
    required this.token,
    required this.id,
  });

  @override
  List<Object?> get props => [
    token,
    id
  ];
}