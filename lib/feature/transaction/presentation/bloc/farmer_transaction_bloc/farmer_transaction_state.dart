part of 'farmer_transaction_bloc.dart';

abstract class FarmerTransactionState extends Equatable {
  const FarmerTransactionState();
}

class FarmerTransactionInitial extends FarmerTransactionState {
  @override
  List<Object> get props => [];
}
