import 'package:equatable/equatable.dart';
import 'package:project_tani/feature/Farmer/domain/entities/farmer.dart';
import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
import 'package:project_tani/feature/comodity/domain/entity/fruit.dart';

class FarmerTransaction extends Equatable {
  final String? id;
  final String? fruitComodityId;
  final int? weight;
  final int? payment;
  final int? priceKg;
  final int? weightSelled;
  final Comodity? comodity;
  final Fruit? fruit;
  FarmerTransaction(
      {this.id,
      this.fruitComodityId,
      this.weight,
      this.payment,
      this.priceKg,
      this.weightSelled,
      this.comodity,
      this.fruit});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        fruitComodityId,
        weight,
        payment,
        priceKg,
        weightSelled,
        comodity,
        fruit
      ];
}
