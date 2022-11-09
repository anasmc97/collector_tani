import 'package:project_tani/feature/transaction/data/models/customer_model.dart';
import 'package:project_tani/feature/transaction/data/models/farmer_transaction_model.dart';
import 'package:project_tani/feature/transaction/domain/entities/customer.dart';
import 'package:project_tani/feature/transaction/domain/entities/customer_transaction.dart';
import 'package:project_tani/feature/transaction/domain/entities/farmer_transaction.dart';

class CustomerTransactionModel extends CustomerTransaction {
  CustomerTransactionModel({
    required String? id,
    required String? customerId,
    required String? farmerTransactionId,
    required String? shipingDate,
    required int? weight,
    required int? totalPayment,
    required String? struckLink,
    required String? address,
    required String? receiverName,
    required int? shippingPayment,
    required int? price,
    required Customer? customer,
    required FarmerTransaction? farmerTransaction,
  }) : super(
            id: id,
            customerId: customerId,
            farmerTransactionId: farmerTransactionId,
            shipingDate: shipingDate,
            weight: weight,
            totalPayment: totalPayment,
            struckLink: struckLink,
            address: address,
            receiverName: receiverName,
            shippingPayment: shippingPayment,
            price: price,
            customer: customer,
            farmerTransaction: farmerTransaction);

  factory CustomerTransactionModel.fromJson(Map<String, dynamic> json) {
    return CustomerTransactionModel(
      id: json['id'],
      customerId: json['customer_id'],
      farmerTransactionId: json['farmer_transaction_id'],
      shipingDate: json['shiping_date'],
      weight: json['weight'],
      totalPayment: json['total_payment'],
      struckLink: json['struck_link'],
      address: json['address'],
      receiverName: json['receiver_name'],
      shippingPayment: json['shipping_payment'],
      price: json['price'],
      customer: CustomerModel.fromJson(
        json['customer'],
      ),
      farmerTransaction:
          FarmerTransactionModel.fromJson(json['farmer_transaction']),
    );
  }
}
