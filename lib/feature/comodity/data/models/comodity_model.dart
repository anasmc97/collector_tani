import 'package:project_tani/feature/Farmer/data/models/farmer_model.dart';
import 'package:project_tani/feature/Farmer/domain/entities/farmer.dart';
import 'package:project_tani/feature/comodity/data/models/fruit_model.dart';
import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
import 'package:project_tani/feature/comodity/domain/entity/fruit.dart';

class ComodityModel extends Comodity {
  ComodityModel(
      {required String? id,
      required String? farmerId,
      required String? collectorId,
      required String? fruitId,
      required String? blossomTreedate,
      required String? harvestingDate,
      required String? fruitGrade,
      required int? verified,
      required String? verifiedDate,
      required int? weight,
      required int? priceKg,
      required int? weightSelled,
      required FarmerModel? farmer,
      required FruitModel? fruit})
      : super(
            id: id,
            farmerId: farmerId,
            collectorId: collectorId,
            fruitId: fruitId,
            blossomTreedate: blossomTreedate,
            harvestingDate: harvestingDate,
            fruitGrade: fruitGrade,
            verified: verified,
            verifiedDate: verifiedDate,
            weight: weight,
            priceKg: priceKg,
            weightSelled: weightSelled,
            farmer: farmer,
            fruit: fruit);

  factory ComodityModel.fromJson(Map<String, dynamic> json) {
    return ComodityModel(
      id: json['id'],
      farmerId: json['farmer_id'],
      collectorId: json['collector_id'],
      fruitId: json['fruit_id'],
      blossomTreedate: json['blossoms_tree_date'],
      harvestingDate: json['harvesting_date'],
      fruitGrade: json['fruit_grade'],
      verified: json['verified'],
      verifiedDate: json['verfied_date'],
      weight: json['weight'],
      priceKg: json['price_kg'],
      weightSelled: json['weight_selled'],
      farmer: FarmerModel.fromJson(
        json['farmer'],
      ),
      fruit: FruitModel.fromJson(json['fruit']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'farmer_id': farmerId,
      'collector_id': collectorId,
      'fruit_id': fruitId,
      'blossoms_tree_date': blossomTreedate,
      'harvesting_date': harvestingDate,
      'fruit_grade': fruitGrade,
      'verified': verified,
      'verfied_date': verifiedDate,
      'weight': weight,
      'price_kg': priceKg,
      'weight_selled': weightSelled,
      'farmer': farmer,
      'fruit': fruit
    };
  }
}
