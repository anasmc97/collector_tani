import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'customer_transaction_event.dart';
part 'customer_transaction_state.dart';

class CustomerTransactionBloc
    extends Bloc<CustomerTransactionEvent, CustomerTransactionState> {
  CustomerTransactionBloc() : super(CustomerTransactionInitial()) {
    on<CustomerTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
