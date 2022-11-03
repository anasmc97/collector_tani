import 'package:project_tani/feature/comodity/data/datasources/comodity_remote_datasource.dart';
import 'package:project_tani/feature/comodity/domain/repositories/comodity_repositories.dart';

class ComodityRepositoryImpl implements ComodityRepository {
  final ComodityRemoteDataSource remoteDataSource;
  ComodityRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addComodity(String? token, String? farmerId, String? fruitId) {
    return remoteDataSource.addComodity(token, farmerId, fruitId);
  }


}