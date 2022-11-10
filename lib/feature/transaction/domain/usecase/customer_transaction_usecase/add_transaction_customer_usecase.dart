import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/transaction/domain/repositories/customer_transaction.dart';

class AddCustomerTransactionUsecase
    implements UseCase<void, ParamsAddCustomerTransaction> {
  final CustomerTransactionRepository repository;

  AddCustomerTransactionUsecase(this.repository);

  @override
  Future<void> call(ParamsAddCustomerTransaction params) async {
    return await repository.addCustomerTransaction(
        params.token,
        params.farmerTransactionId,
        params.weight,
        params.price,
        params.shippingPayment,
        params.totalPayment,
        params.shippingDate,
        params.address,
        params.receiverName,
        params.phoneNumber);
  }
}

class ParamsAddCustomerTransaction extends Equatable {
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

  const ParamsAddCustomerTransaction(
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
  // TODO: implement props
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
