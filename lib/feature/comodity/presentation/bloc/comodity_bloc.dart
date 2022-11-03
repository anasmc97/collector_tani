import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_tani/feature/comodity/domain/usecase/add_comodity_usecase.dart';

part 'comodity_event.dart';
part 'comodity_state.dart';

class ComodityBloc extends Bloc<ComodityEvent, ComodityState> {
  final AddComodityUsecase addComodity;
  ComodityBloc({
    required this.addComodity,
}) : super(ComodityInitial()) {
    on<AddComodityEvent>(_mapAddComodityEvent);
  }

  void _mapAddComodityEvent(
      AddComodityEvent event, Emitter<ComodityState> emit) async{
    emit(ComodityLoading());
    try {
      await addComodity.call(ParamsAddComodity(
          token: event.token,
          farmerId: event.farmerId,
          fruitId: event.fruitId
      ));
      emit(AddComoditySucces());
    } catch (e) {
      emit(ComodityDataError(message: e.toString()));
    }
  }
}
