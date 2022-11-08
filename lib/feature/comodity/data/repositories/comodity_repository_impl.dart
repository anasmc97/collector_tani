import 'package:project_tani/feature/comodity/data/datasources/comodity_remote_datasource.dart';
import 'package:project_tani/feature/comodity/data/models/comodity_model.dart';
import 'package:project_tani/feature/comodity/data/models/fruit_model.dart';
import 'package:project_tani/feature/comodity/domain/repositories/comodity_repositories.dart';

class ComodityRepositoryImpl implements ComodityRepository {
  final ComodityRemoteDataSource remoteDataSource;
  ComodityRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addComodity(String? token, String? farmerId, String? fruitId) {
    return remoteDataSource.addComodity(token, farmerId, fruitId);
  }

  @override
  Future<List<FruitModel?>> getFruits(String? token) {
    return remoteDataSource.getFruits(token);
  }

  @override
  Future<List<ComodityModel?>> getListComodity(String? token) {
    return remoteDataSource.getListComodity(token);
  }

  @override
  Future<void> updateComodity(
      String? token,
      String? id,
      String? blossomTreeDate,
      String? harvestingDate,
      String? fruitGrade,
      int? weight) {
    return remoteDataSource.updateComodity(
        token, id, blossomTreeDate, harvestingDate, fruitGrade, weight);
  }

  @override
  Future<void> verifyComodity(String? token, String? id) {
    return remoteDataSource.verifyComodity(token, id);
  }
}
