import 'package:project_tani/feature/Farmer/domain/entities/farmer.dart';

class FarmerModel extends Farmer {
  const FarmerModel({
    required String? id,
    required String? name,
    required String? landLocation,
    required int? numberTree,
    required int? estimationProduction,
    required int? landSize,
  }) : super(
    id: id,
    name: name,
    landLocation: landLocation,
    numberTree: numberTree,
    estimationProduction: estimationProduction,
    landSize: landSize
  );


  factory FarmerModel.fromJson(Map<String, dynamic> json) {
    return FarmerModel(
      id: json['id'],
      name: json['name'],
      landLocation: json['land_location'],
      numberTree: json['number_tree'],
      estimationProduction: json['estimation_production'],
      landSize: json['land_size']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name': name,
      'land_location': landLocation,
      'number_tree': numberTree,
      'estimation_production': estimationProduction,
      'land_size': landSize,
    };
  }
}