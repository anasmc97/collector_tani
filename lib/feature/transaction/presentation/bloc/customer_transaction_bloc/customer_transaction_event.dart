part of 'customer_transaction_bloc.dart';

abstract class CustomerTransactionEvent extends Equatable {
  const CustomerTransactionEvent();
}

class AddCustomerTransactionEvent extends CustomerTransactionEvent {
  final String? token;
  final String? farmerTransactionId;
  final String? weight;
  final String? price;
  final String? shippingPayment;
  final String? totalPayment;
  final String? shippingDate;
  final String? address;
  final String? receiverName;
  final String? phoneNumber;
  const AddCustomerTransactionEvent(
      {required this.token,
      required this.farmerTransactionId,
      required this.weight,
      required this.price,
      required this.shippingPayment,
      required this.totalPayment,
      required this.shippingDate,
      required this.address,
      required this.receiverName,
      required this.phoneNumber});
  @override
  List<Object?> get props => [
        token,
        farmerTransactionId,
        weight,
        price,
        shippingPayment,
        totalPayment,
        shippingPayment,
        totalPayment,
        shippingDate,
        address,
        receiverName,
        phoneNumber
      ];
}

class GetListCustomerTransactionEvent extends CustomerTransactionEvent {
  final String? token;
  const GetListCustomerTransactionEvent({
    this.token,
  });
  @override
  List<Object?> get props => [
        token,
      ];
}

class GetCustomerTransactionEvent extends CustomerTransactionEvent {
  final String? token;
  final String? id;
  const GetCustomerTransactionEvent({this.token, this.id});
  @override
  List<Object?> get props => [token, id];
}
