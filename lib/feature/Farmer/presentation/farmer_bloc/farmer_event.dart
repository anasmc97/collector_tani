part of 'farmer_bloc.dart';

abstract class FarmerEvent extends Equatable {
  const FarmerEvent();
}

class AddFarmerEvent extends FarmerEvent {
  final String? token;
  final String? name;
  final String? landLocation;
  final String? numberTree;
  final String? estimationProduction;
  final String? landSize;
  const AddFarmerEvent({
    this.token,
    this.name,
    this.landLocation,
    this.numberTree,
    this.estimationProduction,
    this.landSize
  });
  @override
  List<Object?> get props => [
    token,
    name,
    landLocation,
    numberTree,
    estimationProduction,
    landSize
  ];
}

class UpdateFarmerEvent extends FarmerEvent {
  final String? token;
  final String? id;
  final String? name;
  final String? landLocation;
  final String? numberTree;
  final String? estimationProduction;
  final String? landSize;
  const UpdateFarmerEvent({
    this.token,
    this.id,
    this.name,
    this.landLocation,
    this.numberTree,
    this.estimationProduction,
    this.landSize
  });
  @override
  List<Object?> get props => [
    token,
    id,
    name,
    landLocation,
    numberTree,
    estimationProduction,
    landSize
  ];
}


class GetAllFarmerEvent extends FarmerEvent {
  final String? token;
  const GetAllFarmerEvent({
    this.token,
  });
  @override
  List<Object?> get props => [
    token,
  ];
}

class DeleteFarmerEvent extends FarmerEvent {
  final String? token;
  final String? id;
  const DeleteFarmerEvent({
    this.token,
    this.id
  });
  @override
  List<Object?> get props => [
    token,
    id
  ];
}