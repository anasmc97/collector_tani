import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_tani/feature/transaction/data/models/farmer_transaction_model.dart';
import 'package:project_tani/feature/transaction/domain/entities/farmer_transaction.dart';
import 'package:project_tani/feature/transaction/domain/usecase/farmer_transaction_usecase/add_farmer_transaction_usecase.dart';
import 'package:project_tani/feature/transaction/domain/usecase/farmer_transaction_usecase/get_list_farmer_transaction_usecase.dart';
import 'package:project_tani/feature/transaction/domain/usecase/farmer_transaction_usecase/get_transaction_farmer_usecase.dart';

part 'farmer_transaction_event.dart';
part 'farmer_transaction_state.dart';

class FarmerTransactionBloc
    extends Bloc<FarmerTransactionEvent, FarmerTransactionState> {
  final AddFarmerTransactionUsecase addFarmerTransaction;
  final GetListFarmerTransactionUsecase getListFarmerTransaction;
  final GetFarmerTransactionUsecase getFarmerTransaction;
  FarmerTransactionBloc(
      {required this.addFarmerTransaction,
      required this.getListFarmerTransaction,
      required this.getFarmerTransaction})
      : super(FarmerTransactionInitial()) {
    on<AddFarmerTransactionEvent>(_mapAddFarmerTransactionEvent);
    on<GetListFarmerTransactionEvent>(_mapGetListFarmerTransactionEvent);
    on<GetFarmerTransactionEvent>(_mapGetFarmerTransactionEvent);
  }

  void _mapAddFarmerTransactionEvent(AddFarmerTransactionEvent event,
      Emitter<FarmerTransactionState> emit) async {
    emit(FarmerTransactionLoading());
    try {
      await addFarmerTransaction.call(ParamsAddFarmerTransaction(
        token: event.token,
        weight: event.weight,
        fruitComodityId: event.fruitComodityId,
        priceTotal: event.priceTotal,
        price: event.price,
      ));
      emit(AddFarmerTransactionSuccess());
    } catch (e) {
      emit(FarmerTransactionDataError(message: e.toString()));
    }
  }

  void _mapGetListFarmerTransactionEvent(GetListFarmerTransactionEvent event,
      Emitter<FarmerTransactionState> emit) async {
    emit(FarmerTransactionLoading());
    try {
      List<FarmerTransaction?> listFarmerTransaction =
          await getListFarmerTransaction
              .call(ParamsGetListFarmerTransaction(token: event.token));
      if (listFarmerTransaction.isEmpty) {
        emit(FarmerTransactionEmpty());
      } else {
        emit(GetListFarmerTransactionSuccess(
            listFarmerTransaction: listFarmerTransaction));
      }
    } catch (e) {
      emit(FarmerTransactionDataError(message: e.toString()));
    }
  }

  void _mapGetFarmerTransactionEvent(GetFarmerTransactionEvent event,
      Emitter<FarmerTransactionState> emit) async {
    emit(FarmerTransactionLoading());
    try {
      FarmerTransaction? farmerTransaction = await getFarmerTransaction.call(
          ParamsGetFarmerTransaction(token: event.token, id: event.token));
      if (farmerTransaction == null) {
        emit(const FarmerTransactionDataError(message: 'farmer data is null'));
      } else {
        emit(GetFarmerTransactionSuccess(farmerTransaction: farmerTransaction));
      }
    } catch (e) {
      emit(FarmerTransactionDataError(message: e.toString()));
    }
  }
}
