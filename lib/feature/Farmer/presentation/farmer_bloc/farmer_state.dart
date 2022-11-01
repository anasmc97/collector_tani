part of 'farmer_bloc.dart';

abstract class FarmerState extends Equatable {
  const FarmerState();
}

class FarmerInitial extends FarmerState {
  @override
  List<Object> get props => [];
}

class AddFarmerSucces extends FarmerState {
  @override
  List<Object> get props => [];
}

class UpdateFarmerSucces extends FarmerState {
  @override
  List<Object> get props => [];
}

class DeleteFarmerSucces extends FarmerState {
  @override
  List<Object> get props => [];
}

class FarmerLoading extends FarmerState {
  @override
  List<Object> get props => [];
}

class FarmerDataError extends FarmerState {
  final String? message;
  const FarmerDataError({required this.message});
  @override
  List<Object?> get props => [message];
}

class GetAllFarmerSucces extends FarmerState {
  final List<Farmer?>? listFarmer;
  const GetAllFarmerSucces({required this.listFarmer});
  @override
  List<Object?> get props => [listFarmer];
}

class FarmerEmpty extends FarmerState {
  @override
  List<Object?> get props => [];
}