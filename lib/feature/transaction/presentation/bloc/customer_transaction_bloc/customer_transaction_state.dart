part of 'customer_transaction_bloc.dart';

abstract class CustomerTransactionState extends Equatable {
  const CustomerTransactionState();
}

class CustomerTransactionInitial extends CustomerTransactionState {
  @override
  List<Object> get props => [];
}
