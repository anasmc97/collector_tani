import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_tani/feature/comodity/data/models/fruit_model.dart';
import 'package:project_tani/feature/comodity/domain/entity/fruit.dart';
import 'package:project_tani/feature/comodity/domain/usecase/add_comodity_usecase.dart';
import 'package:project_tani/feature/comodity/domain/usecase/get_fruits_usecase.dart';

part 'comodity_event.dart';
part 'comodity_state.dart';

class ComodityBloc extends Bloc<ComodityEvent, ComodityState> {
  final AddComodityUsecase addComodity;
  final GetFruitUsecase getFruits;
  ComodityBloc({
    required this.addComodity,
    required this.getFruits,
  }) : super(ComodityInitial()) {
    on<AddComodityEvent>(_mapAddComodityEvent);
    on<GetFruitEvent>(_mapGetFruitEvent);
  }

  void _mapAddComodityEvent(
      AddComodityEvent event, Emitter<ComodityState> emit) async {
    emit(ComodityLoading());
    try {
      await addComodity.call(ParamsAddComodity(
          token: event.token,
          farmerId: event.farmerId,
          fruitId: event.fruitId));
      emit(AddComoditySucces());
    } catch (e) {
      emit(ComodityDataError(message: e.toString()));
    }
  }

  void _mapGetFruitEvent(
      GetFruitEvent event, Emitter<ComodityState> emit) async {
    emit(ComodityLoading());
    try {
      List<FruitModel?>? listFruit =
          await getFruits.call(ParamsGetFruit(token: event.token));
      if (listFruit == null || listFruit.isEmpty) {
        emit(FruitEmpty());
      } else {
        emit(GetFruitSuccess(listFruit: listFruit));
      }
    } catch (e) {
      emit(FruitDataError(message: e.toString()));
    }
  }
}
