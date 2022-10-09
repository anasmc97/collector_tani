class Farmer{
  final String? name;
  final String? image;
  final String? luasLahan;
  final String? jumlahPohon;
  final String? estimasiJumlahProduksi;
  final String? koordinatLahan;

  Farmer({
    this.name,
    this.image,
    this.estimasiJumlahProduksi,
    this.jumlahPohon,
    this.koordinatLahan,
    this.luasLahan
  });
}

List<Farmer> dummyListFarmer = [
  Farmer(name: 'Imam', image: 'assets/Ellipse 9.png', luasLahan: '200 m2', jumlahPohon: '300', estimasiJumlahProduksi: '3000', koordinatLahan: 'Narmada'),
  Farmer(name: 'Anas', image: 'assets/Ellipse 9.png', luasLahan: '200 m2', jumlahPohon: '300', estimasiJumlahProduksi: '3000', koordinatLahan: 'Narmada'),
  Farmer(name: 'Wibi', image: 'assets/Ellipse 9.png', luasLahan: '200 m2', jumlahPohon: '300', estimasiJumlahProduksi: '3000', koordinatLahan: 'Narmada'),
];