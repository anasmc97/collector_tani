import 'package:project_tani/feature/Farmer/domain/entities/farmer.dart';
import 'package:project_tani/feature/comodity/data/models/comodity_model.dart';
import 'package:project_tani/feature/comodity/data/models/fruit_model.dart';
import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
import 'package:project_tani/feature/comodity/domain/entity/fruit.dart';
import 'package:project_tani/feature/transaction/domain/entities/farmer_transaction.dart';

class FarmerTransactionModel extends FarmerTransaction {
  FarmerTransactionModel(
      {required String? id,
      required String? fruitComodityId,
      required int? weight,
      required int? payment,
      required int? priceKg,
      required int? weightSelled,
      required Comodity? comodity,
      required Fruit? fruit})
      : super(
            id: id,
            fruitComodityId: fruitComodityId,
            weight: weight,
            payment: payment,
            priceKg: priceKg,
            weightSelled: weightSelled,
            comodity: comodity,
            fruit: fruit);

  factory FarmerTransactionModel.fromJson(Map<String, dynamic> json) {
    return FarmerTransactionModel(
      id: json['id'],
      fruitComodityId: json['fruit_comodity_id'],
      weight: json['weight'],
      payment: json['payment'],
      priceKg: json['price_kg'],
      weightSelled: json['weight_selled'],
      comodity: ComodityModel.fromJson(
        json['fruit_commodity'],
      ),
      fruit: FruitModel.fromJson(json['fruit']),
    );
  }
}
