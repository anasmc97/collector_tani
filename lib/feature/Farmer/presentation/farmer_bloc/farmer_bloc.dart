import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_tani/feature/Farmer/domain/entities/farmer.dart';
import 'package:project_tani/feature/Farmer/domain/usecase/add_farmer_usecase.dart';
import 'package:project_tani/feature/Farmer/domain/usecase/delete_farmer_usecase.dart';
import 'package:project_tani/feature/Farmer/domain/usecase/get_farmer_usecase.dart';
import 'package:project_tani/feature/Farmer/domain/usecase/update_farmer_usecase.dart';

part 'farmer_event.dart';
part 'farmer_state.dart';

class FarmerBloc extends Bloc<FarmerEvent, FarmerState> {
  final AddFarmerUsecase addFarmer;
  final GetAllFarmerUsecase getAllFarmer;
  final UpdateFarmerUsecase updateFarmer;
  final DeleteFarmerUsecase deleteFarmer;
  FarmerBloc({
    required this.addFarmer,
    required this.getAllFarmer,
    required this.updateFarmer,
    required this.deleteFarmer
  }) : super(FarmerInitial()) {
    on<AddFarmerEvent>(_mapAddFarmerEvent);
    on<GetAllFarmerEvent>(_mapGetAllFarmerEvent);
    on<UpdateFarmerEvent>(_mapUpdateFarmerEvent);
    on<DeleteFarmerEvent>(_mapDeleteFarmerEvent);
  }
  void _mapAddFarmerEvent(
      AddFarmerEvent event, Emitter<FarmerState> emit) async{
    emit(FarmerLoading());
    try {
      await addFarmer.call(ParamsAddFarmer(
          token: event.token,
          name: event.name,
          landLocation: event.landLocation,
          numberTree: event.numberTree,
          estimationProduction: event.estimationProduction,
          landSize: event.landSize));
      emit(AddFarmerSucces());
    } catch (e) {
      emit(FarmerDataError(message: e.toString()));
    }
  }

  void _mapUpdateFarmerEvent(
      UpdateFarmerEvent event, Emitter<FarmerState> emit) async{
    emit(FarmerLoading());
    try {
      await updateFarmer.call(ParamsUpdateFarmer(
          id: event.id,
          token: event.token,
          name: event.name,
          landLocation: event.landLocation,
          numberTree: event.numberTree,
          estimationProduction: event.estimationProduction,
          landSize: event.landSize));
      emit(UpdateFarmerSucces());
    } catch (e) {
      emit(FarmerDataError(message: e.toString()));
    }
  }

  void _mapDeleteFarmerEvent(
      DeleteFarmerEvent event, Emitter<FarmerState> emit) async{
    emit(FarmerLoading());
    try {
      await deleteFarmer.call(ParamsDeleteFarmer(
          id: event.id,
          token: event.token
      ));
      emit(DeleteFarmerSucces());
    } catch (e) {
      emit(FarmerDataError(message: e.toString()));
    }
  }

  void _mapGetAllFarmerEvent(
      GetAllFarmerEvent event, Emitter<FarmerState> emit) async{
    emit(FarmerLoading());
    try {
       List<Farmer?>? listFarmer = await getAllFarmer.call(ParamsGetAllFarmer(
          token: event.token));
       if(listFarmer == null || listFarmer.isEmpty){
         emit(FarmerEmpty());
       }else{
         emit(GetAllFarmerSucces(listFarmer: listFarmer));
       }
    } catch (e) {
      emit(FarmerDataError(message: e.toString()));
    }
  }
}
