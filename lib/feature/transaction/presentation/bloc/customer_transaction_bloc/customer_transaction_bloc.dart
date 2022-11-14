import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_tani/feature/transaction/domain/entities/customer_transaction.dart';
import 'package:project_tani/feature/transaction/domain/usecase/customer_transaction_usecase/add_transaction_customer_usecase.dart';
import 'package:project_tani/feature/transaction/domain/usecase/customer_transaction_usecase/get_list_customer_transaction_usecase.dart';
import 'package:project_tani/feature/transaction/domain/usecase/customer_transaction_usecase/get_transaction_customer_usecase.dart';

part 'customer_transaction_event.dart';
part 'customer_transaction_state.dart';

class CustomerTransactionBloc
    extends Bloc<CustomerTransactionEvent, CustomerTransactionState> {
  final AddCustomerTransactionUsecase addCustomerTransaction;
  final GetListCustomerTransactionUsecase getListCustomerTransaction;
  final GetCustomerTransactionUsecase getCustomerTransaction;
  CustomerTransactionBloc(
      {required this.addCustomerTransaction,
      required this.getListCustomerTransaction,
      required this.getCustomerTransaction})
      : super(CustomerTransactionInitial()) {
    on<AddCustomerTransactionEvent>(_mapAddCustomerTransactionEvent);
    on<GetListCustomerTransactionEvent>(_mapGetListCustomerTransactionEvent);
    on<GetCustomerTransactionEvent>(_mapGetCustomerTransactionEvent);
  }

  void _mapAddCustomerTransactionEvent(AddCustomerTransactionEvent event,
      Emitter<CustomerTransactionState> emit) async {
    emit(CustomerTransactionLoading());
    try {
      await addCustomerTransaction.call(ParamsAddCustomerTransaction(
        token: event.token,
        weight: event.weight,
        price: event.price,
        farmerTransactionId: event.farmerTransactionId,
        shippingPayment: event.shippingPayment,
        totalPayment: event.totalPayment,
        receiverName: event.receiverName,
        address: event.address,
        phoneNumber: event.phoneNumber,
        shippingDate: event.shippingDate,
      ));
      emit(AddCustomerTransactionSuccess());
    } catch (e) {
      emit(CustomerTransactionDataError(message: e.toString()));
    }
  }

  void _mapGetListCustomerTransactionEvent(
      GetListCustomerTransactionEvent event,
      Emitter<CustomerTransactionState> emit) async {
    emit(CustomerTransactionLoading());
    try {
      List<CustomerTransaction?> listCustomerTransaction =
          await getListCustomerTransaction
              .call(ParamsGetListCustomerTransaction(token: event.token));
      if (listCustomerTransaction.isEmpty) {
        emit(CustomerTransactionEmpty());
      } else {
        emit(GetListCustomerTransactionSuccess(
            listCustomerTransaction: listCustomerTransaction));
      }
    } catch (e) {
      emit(CustomerTransactionDataError(message: e.toString()));
    }
  }

  void _mapGetCustomerTransactionEvent(GetCustomerTransactionEvent event,
      Emitter<CustomerTransactionState> emit) async {
    emit(CustomerTransactionLoading());
    try {
      CustomerTransaction? customerTransaction =
          await getCustomerTransaction.call(ParamsGetCustomerTransaction(
              token: event.token, id: event.token));
      if (customerTransaction == null) {
        emit(
            const CustomerTransactionDataError(message: 'farmer data is null'));
      } else {
        emit(GetCustomerTransactionSuccess(
            customerTransaction: customerTransaction));
      }
    } catch (e) {
      emit(CustomerTransactionDataError(message: e.toString()));
    }
  }
}
