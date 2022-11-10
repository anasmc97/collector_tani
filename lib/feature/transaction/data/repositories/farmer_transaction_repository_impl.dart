import 'package:project_tani/feature/transaction/data/datasources/farmer_transaction_datasource.dart';
import 'package:project_tani/feature/transaction/data/models/farmer_transaction_model.dart';
import 'package:project_tani/feature/transaction/domain/repositories/farmer_transaction.dart';

class FarmerTransactionRepositoryImpl implements FarmerTransactionRepository {
  final FarmerTransactionRemoteDataSource remoteDataSource;
  FarmerTransactionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addFarmerTransaction(String? token, String? fruitComodityId,
      int? weight, int? price, int? priceTotal) {
    return remoteDataSource.addFarmerTransaction(
        token, fruitComodityId, weight, price, priceTotal);
  }

  @override
  Future<FarmerTransactionModel?> getFarmerTransaction(
      String? token, String? id) {
    return remoteDataSource.getFarmerTransaction(token, id);
  }

  @override
  Future<List<FarmerTransactionModel?>> getListFarmerTransaction(
      String? token) {
    return remoteDataSource.getListFarmerTransaction(token);
  }
}
