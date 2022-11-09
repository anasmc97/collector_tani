import 'package:project_tani/feature/transaction/data/models/customer_transaction_model.dart';

abstract class CustomerTransactionRepository {
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
      String? phoneNumber);
  Future<List<CustomerTransactionModel?>> getListCustomerTransaction(
      String? token);
  Future<CustomerTransactionModel?> getCustomerTransaction(
      String? token, String? id);
}
