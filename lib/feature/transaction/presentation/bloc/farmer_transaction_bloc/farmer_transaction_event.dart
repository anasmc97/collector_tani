part of 'farmer_transaction_bloc.dart';

abstract class FarmerTransactionEvent extends Equatable {
  const FarmerTransactionEvent();
}

class AddFarmerTransactionEvent extends FarmerTransactionEvent {
  final String? token;
  final String? fruitComodityId;
  final int? weight;
  final int? price;
  final int? priceTotal;
  const AddFarmerTransactionEvent(
      {required this.token,
      required this.fruitComodityId,
      required this.weight,
      required this.price,
      required this.priceTotal});
  @override
  List<Object?> get props =>
      [token, fruitComodityId, weight, price, priceTotal];
}

class GetListFarmerTransactionEvent extends FarmerTransactionEvent {
  final String? token;
  const GetListFarmerTransactionEvent({
    this.token,
  });
  @override
  List<Object?> get props => [
        token,
      ];
}

class GetFarmerTransactionEvent extends FarmerTransactionEvent {
  final String? token;
  final String? id;
  const GetFarmerTransactionEvent({this.token, this.id});
  @override
  List<Object?> get props => [token, id];
}
