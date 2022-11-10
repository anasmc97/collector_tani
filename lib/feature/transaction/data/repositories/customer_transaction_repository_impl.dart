import 'package:project_tani/feature/transaction/data/datasources/customer_transaction_datasource.dart';
import 'package:project_tani/feature/transaction/data/models/customer_transaction_model.dart';
import 'package:project_tani/feature/transaction/domain/repositories/customer_transaction.dart';

class CustomerTransactionRepositoryImpl
    implements CustomerTransactionRepository {
  final CustomerTransactionRemoteDataSource remoteDataSource;
  CustomerTransactionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addCustomerTransaction(
      String? token,
      String? farmerTransactionId,
      String? weight,
      String? price,
      String? shippingPayment,
      String? totalPayment,
      String? shippingDate,
      String? address,
      String? receiverName,
      String? phoneNumber) {
    return remoteDataSource.addCustomerTransaction(
        token,
        farmerTransactionId,
        weight,
        price,
        shippingPayment,
        totalPayment,
        shippingDate,
        address,
        receiverName,
        phoneNumber);
  }

  @override
  Future<CustomerTransactionModel?> getCustomerTransaction(
      String? token, String? id) {
    return remoteDataSource.getCustomerTransaction(token, id);
  }

  @override
  Future<List<CustomerTransactionModel?>> getListCustomerTransaction(
      String? token) {
    return remoteDataSource.getListCustomerTransaction(token);
  }
}
