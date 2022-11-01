import 'package:equatable/equatable.dart';

class Farmer extends Equatable{
  final String? id;
  final String? name;
  final String? landLocation;
  final int? numberTree;
  final int? estimationProduction;
  final int? landSize;

  const Farmer({
    this.id,
    this.name,
    this.landLocation,
    this.numberTree,
    this.estimationProduction,
    this.landSize
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
    landLocation,
    numberTree,
    estimationProduction,
    landSize,
  ];
}

// List<Farmer> dummyListFarmer = [
//   Farmer(name: 'Imam', image: 'assets/Ellipse 9.png', luasLahan: '200 m2', jumlahPohon: '300', estimasiJumlahProduksi: '3000', koordinatLahan: 'Narmada'),
//   Farmer(name: 'Anas', image: 'assets/Ellipse 9.png', luasLahan: '200 m2', jumlahPohon: '300', estimasiJumlahProduksi: '3000', koordinatLahan: 'Narmada'),
//   Farmer(name: 'Wibi', image: 'assets/Ellipse 9.png', luasLahan: '200 m2', jumlahPohon: '300', estimasiJumlahProduksi: '3000', koordinatLahan: 'Narmada'),
// ];