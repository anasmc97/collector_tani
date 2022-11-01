import 'package:project_tani/feature/Farmer/data/datasources/farmer_remote_datasource.dart';
import 'package:project_tani/feature/Farmer/data/models/farmer_model.dart';
import 'package:project_tani/feature/Farmer/domain/entities/farmer.dart';
import 'package:project_tani/feature/Farmer/domain/repositories/farmer_repositories.dart';

class FarmerRepositoryImpl implements FarmerRepository {
  final FarmerRemoteDataSource remoteDataSource;
  FarmerRepositoryImpl({required this.remoteDataSource});

  @override
  Future<FarmerModel?> addFarmer(String? token, String? name, String? landLocation, String? numberTree, String? estimationProduction, String? landSize) {
    return remoteDataSource.addFarmer(token, name, landLocation, numberTree, estimationProduction, landSize);
  }

  @override
  Future<List<FarmerModel?>?> getAllFarmer(String? token) {
    return remoteDataSource.getAllFarmer(token);
  }

  @override
  Future<void> deleteFarmer(String? token, String? id) {
    return remoteDataSource.deleteFarmer(token, id);
  }

  @override
  Future<FarmerModel?> updateFarmer(String? token, String? id, String? name, String? landLocation, String? numberTree, String? estimationProduction, String? landSize) {
    return remoteDataSource.updateFarmer(token, id, name, landLocation, numberTree, estimationProduction, landSize);
  }
}