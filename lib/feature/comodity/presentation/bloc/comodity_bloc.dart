import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_tani/feature/comodity/data/models/comodity_model.dart';
import 'package:project_tani/feature/comodity/data/models/fruit_model.dart';
import 'package:project_tani/feature/comodity/domain/entity/fruit.dart';
import 'package:project_tani/feature/comodity/domain/usecase/add_comodity_usecase.dart';
import 'package:project_tani/feature/comodity/domain/usecase/delete_comodity_usecase.dart';
import 'package:project_tani/feature/comodity/domain/usecase/get_fruits_usecase.dart';
import 'package:project_tani/feature/comodity/domain/usecase/get_list_comodity.dart';
import 'package:project_tani/feature/comodity/domain/usecase/get_list_comodity_verified_usecase.dart';
import 'package:project_tani/feature/comodity/domain/usecase/update_comodity.dart';
import 'package:project_tani/feature/comodity/domain/usecase/verify_comodity.dart';

part 'comodity_event.dart';
part 'comodity_state.dart';

class ComodityBloc extends Bloc<ComodityEvent, ComodityState> {
  final AddComodityUsecase addComodity;
  final GetFruitUsecase getFruits;
  final GetListComodityUsecase getListComodity;
  final GetListComodityVerifiedUsecase getListComodityVerified;
  final UpdateComodityUsecase updateComodity;
  final VerifyComodityUsecase verifyComodity;
  final DeleteComodityUsecase deleteComodity;
  ComodityBloc(
      {required this.addComodity,
      required this.getFruits,
      required this.getListComodity,
      required this.getListComodityVerified,
      required this.updateComodity,
      required this.verifyComodity,
      required this.deleteComodity})
      : super(ComodityInitial()) {
    on<AddComodityEvent>(_mapAddComodityEvent);
    on<GetFruitEvent>(_mapGetFruitEvent);
    on<GetListComodityEvent>(_mapGetListComodityEvent);
    on<GetListComodityVerifiedEvent>(_mapGetListComodityVerifiedEvent);
    on<UpdateComodityEvent>(_mapUpdateComodityEvent);
    on<VerifyComodityEvent>(_mapVerifyComodityEvent);
    on<DeleteComodityEvent>(_mapDeleteComodityEvent);
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

  void _mapUpdateComodityEvent(
      UpdateComodityEvent event, Emitter<ComodityState> emit) async {
    emit(ComodityLoading());
    try {
      await updateComodity.call(
        ParamsUpdateComodity(
          token: event.token,
          id: event.id,
          blossomTreeDate: event.blossomTreeDate,
          fruitGrade: event.fruitGrade,
          harvestingDate: event.harvestingDate,
          weight: event.weight,
        ),
      );
      emit(UpdateComoditySucces());
    } catch (e) {
      emit(ComodityDataError(message: e.toString()));
    }
  }

  void _mapVerifyComodityEvent(
      VerifyComodityEvent event, Emitter<ComodityState> emit) async {
    emit(ComodityLoading());
    try {
      await verifyComodity.call(
        ParamsVerifyComodity(
          token: event.token,
          id: event.id,
        ),
      );
      emit(VerifyComoditySucces());
    } catch (e) {
      emit(ComodityDataError(message: e.toString()));
    }
  }

  void _mapDeleteComodityEvent(
      DeleteComodityEvent event, Emitter<ComodityState> emit) async {
    emit(ComodityLoading());
    try {
      await deleteComodity.call(
        ParamsDeleteComodity(
          token: event.token,
          id: event.id,
        ),
      );
      emit(DeleteComoditySucces());
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

  void _mapGetListComodityEvent(
      GetListComodityEvent event, Emitter<ComodityState> emit) async {
    emit(ComodityLoading());
    try {
      List<ComodityModel?> listComodity =
          await getListComodity.call(ParamsGetListComodity(token: event.token));
      if (listComodity.isEmpty) {
        emit(ComodityEmpty());
      } else {
        emit(GetListComoditySuccess(listComodity: listComodity));
      }
    } catch (e) {
      emit(FruitDataError(message: e.toString()));
    }
  }

  void _mapGetListComodityVerifiedEvent(
      GetListComodityVerifiedEvent event, Emitter<ComodityState> emit) async {
    emit(ComodityLoading());
    try {
      List<ComodityModel?> listComodity = await getListComodityVerified
          .call(ParamsGetListComodityVerified(token: event.token));
      if (listComodity.isEmpty) {
        emit(ComodityEmpty());
      } else {
        emit(GetListComoditySuccess(listComodity: listComodity));
      }
    } catch (e) {
      emit(FruitDataError(message: e.toString()));
    }
  }
}
