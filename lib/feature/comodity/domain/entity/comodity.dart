import 'package:project_tani/feature/Farmer/domain/entities/farmer.dart';

class Comodity{
  final Farmer? farmer;
  final String? comodityName;
  final String? image;
  final String? year;
  final String? month;
  final String? date;
  final bool? isValidate;

  Comodity({
   this.farmer,
   this.comodityName,
   this.image,
   this.year,
   this.month,
   this.date,
   this.isValidate = false
  });
}

List<Comodity> dummyListComodity = [
  Comodity(
      farmer: Farmer(name: 'Malik'),
      comodityName: 'Manggis',
      image: 'assets/fruit.png',
      year: '2022',
      month: '8',
      date: '20',
      isValidate: false
  ),
  Comodity(
      farmer: Farmer(name: 'Imam'),
      comodityName: 'Mangga',
      image: 'assets/fruit.png',
      year: '2022',
      month: '7',
      date: '6',
      isValidate: true
  ),
  Comodity(
      farmer: Farmer(name: 'Wibi'),
      comodityName: 'Rambutan',
      image: 'assets/fruit.png',
      year: '2022',
      month: '9',
      date: '20',
      isValidate: false
  ),
];