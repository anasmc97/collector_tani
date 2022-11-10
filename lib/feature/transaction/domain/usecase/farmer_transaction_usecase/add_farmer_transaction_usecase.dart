import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/transaction/domain/repositories/farmer_transaction.dart';

class AddFarmerTransactionUsecase
    implements UseCase<void, ParamsAddFarmerTransaction> {
  final FarmerTransactionRepository repository;

  AddFarmerTransactionUsecase(this.repository);

  @override
  Future<void> call(ParamsAddFarmerTransaction params) async {
    return await repository.addFarmerTransaction(params.token,
        params.fruitComodityId, params.weight, params.price, params.priceTotal);
  }
}

class ParamsAddFarmerTransaction extends Equatable {
  final String? token;
  final String? fruitComodityId;
  final int? weight;
  final int? price;
  final int? priceTotal;

  const ParamsAddFarmerTransaction(
      {required this.token,
      required this.fruitComodityId,
      required this.weight,
      required this.price,
      required this.priceTotal});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [token, fruitComodityId, weight, price, priceTotal];
}
