import 'package:equatable/equatable.dart';
import 'package:project_tani/feature/Farmer/domain/entities/farmer.dart';
import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
import 'package:project_tani/feature/comodity/domain/entity/fruit.dart';
import 'package:project_tani/feature/transaction/domain/entities/customer.dart';
import 'package:project_tani/feature/transaction/domain/entities/farmer_transaction.dart';

class CustomerTransaction extends Equatable {
  final String? id;
  final String? customerId;
  final String? farmerTransactionId;
  final String? shipingDate;
  final int? weight;
  final int? totalPayment;
  final String? struckLink;
  final String? address;
  final String? receiverName;
  final int? shippingPayment;
  final int? price;
  final Customer? customer;
  final FarmerTransaction? farmerTransaction;
  CustomerTransaction({
    this.id,
    this.customerId,
    this.farmerTransactionId,
    this.shipingDate,
    this.weight,
    this.totalPayment,
    this.struckLink,
    this.address,
    this.receiverName,
    this.shippingPayment,
    this.price,
    this.customer,
    this.farmerTransaction,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        customerId,
        farmerTransactionId,
        shipingDate,
        weight,
        totalPayment,
        struckLink,
        address,
        receiverName,
        shippingPayment,
        price,
        customer,
        farmerTransaction,
      ];
}
