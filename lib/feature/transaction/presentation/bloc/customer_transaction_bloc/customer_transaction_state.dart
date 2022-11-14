part of 'customer_transaction_bloc.dart';

abstract class CustomerTransactionState extends Equatable {
  const CustomerTransactionState();
}

class CustomerTransactionInitial extends CustomerTransactionState {
  @override
  List<Object> get props => [];
}

class AddCustomerTransactionSuccess extends CustomerTransactionState {
  @override
  List<Object> get props => [];
}

class CustomerTransactionLoading extends CustomerTransactionState {
  @override
  List<Object> get props => [];
}

class CustomerTransactionDataError extends CustomerTransactionState {
  final String? message;
  const CustomerTransactionDataError({required this.message});
  @override
  List<Object?> get props => [message];
}

class GetListCustomerTransactionSuccess extends CustomerTransactionState {
  final List<CustomerTransaction?>? listCustomerTransaction;
  const GetListCustomerTransactionSuccess(
      {required this.listCustomerTransaction});
  @override
  List<Object?> get props => [listCustomerTransaction];
}

class GetCustomerTransactionSuccess extends CustomerTransactionState {
  final CustomerTransaction? customerTransaction;
  const GetCustomerTransactionSuccess({required this.customerTransaction});
  @override
  List<Object?> get props => [customerTransaction];
}

class CustomerTransactionEmpty extends CustomerTransactionState {
  @override
  List<Object?> get props => [];
}
