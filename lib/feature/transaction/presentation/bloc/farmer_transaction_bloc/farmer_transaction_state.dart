part of 'farmer_transaction_bloc.dart';

abstract class FarmerTransactionState extends Equatable {
  const FarmerTransactionState();
}

class FarmerTransactionInitial extends FarmerTransactionState {
  @override
  List<Object> get props => [];
}

class AddFarmerTransactionSuccess extends FarmerTransactionState {
  @override
  List<Object> get props => [];
}

class FarmerTransactionLoading extends FarmerTransactionState {
  @override
  List<Object> get props => [];
}

class FarmerTransactionDataError extends FarmerTransactionState {
  final String? message;
  const FarmerTransactionDataError({required this.message});
  @override
  List<Object?> get props => [message];
}

class GetListFarmerTransactionSuccess extends FarmerTransactionState {
  final List<FarmerTransaction?>? listFarmerTransaction;
  const GetListFarmerTransactionSuccess({required this.listFarmerTransaction});
  @override
  List<Object?> get props => [listFarmerTransaction];
}

class GetFarmerTransactionSuccess extends FarmerTransactionState {
  final FarmerTransaction? farmerTransaction;
  const GetFarmerTransactionSuccess({required this.farmerTransaction});
  @override
  List<Object?> get props => [farmerTransaction];
}

class FarmerTransactionEmpty extends FarmerTransactionState {
  @override
  List<Object?> get props => [];
}
