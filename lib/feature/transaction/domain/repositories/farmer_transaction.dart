import 'package:project_tani/feature/transaction/data/models/farmer_transaction_model.dart';

abstract class FarmerTransactionRepository {
  Future<void> addFarmerTransaction(String? token, String? fruitComodityId,
      int? weight, int? price, int? priceTotal);
  Future<List<FarmerTransactionModel?>> getListFarmerTransaction(String? token);
  Future<FarmerTransactionModel?> getFarmerTransaction(
      String? token, String? id);
}
