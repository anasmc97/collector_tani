import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'farmer_transaction_event.dart';
part 'farmer_transaction_state.dart';

class FarmerTransactionBloc
    extends Bloc<FarmerTransactionEvent, FarmerTransactionState> {
  FarmerTransactionBloc() : super(FarmerTransactionInitial()) {
    on<FarmerTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
