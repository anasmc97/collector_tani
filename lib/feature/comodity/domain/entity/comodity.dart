import 'package:equatable/equatable.dart';
import 'package:project_tani/feature/Farmer/domain/entities/farmer.dart';
import 'package:project_tani/feature/comodity/domain/entity/fruit.dart';

class Comodity extends Equatable {
  final String? id;
  final String? farmerId;
  final String? collectorId;
  final String? fruitId;
  final String? blossomTreedate;
  final String? harvestingDate;
  final String? fruitGrade;
  final int? verified;
  final String? verifiedDate;
  final int? weight;
  final int? priceKg;
  final int? weightSelled;
  final Farmer? farmer;
  final Fruit? fruit;
  Comodity(
      {this.id,
      this.farmerId,
      this.collectorId,
      this.fruitId,
      this.blossomTreedate,
      this.harvestingDate,
      this.fruitGrade,
      this.verified,
      this.verifiedDate,
      this.weight,
      this.priceKg,
      this.weightSelled,
      this.farmer,
      this.fruit});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        farmerId,
        collectorId,
        fruitId,
        blossomTreedate,
        harvestingDate,
        fruitGrade,
        verified,
        verifiedDate,
        weight,
        priceKg,
        weightSelled,
        farmer,
        fruit
      ];
}

// List<Comodity> dummyListComodity = [
//   Comodity(
//       farmer: Farmer(name: 'Malik'),
//       comodityName: 'Manggis',
//       image: 'assets/fruit.png',
//       year: '2022',
//       month: '8',
//       date: '20',
//       isValidate: false
//   ),
//   Comodity(
//       farmer: Farmer(name: 'Imam'),
//       comodityName: 'Mangga',
//       image: 'assets/fruit.png',
//       year: '2022',
//       month: '7',
//       date: '6',
//       isValidate: true
//   ),
//   Comodity(
//       farmer: Farmer(name: 'Wibi'),
//       comodityName: 'Rambutan',
//       image: 'assets/fruit.png',
//       year: '2022',
//       month: '9',
//       date: '20',
//       isValidate: false
//   ),
// ];
