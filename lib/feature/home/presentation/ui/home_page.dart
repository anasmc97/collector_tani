import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:project_tani/feature/home/presentation/widgets/button_home.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<String> images = ["assets/Icon.png", "assets/catat_komoditas_buah.png",
     "assets/buat_transaksi.png", "assets/petani.png",
     "assets/komoditas_buah.png","assets/transaksi.png", "assets/transaksi.png"];
  List<String> title = ["Tambah Petani", "Catat Komoditas Buah",
    "Buat Transaksi", "Petani",
    "Komoditas Buah","Transaksi dengan Petani", "Transaksi dengan Pelanggan"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 16, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hallo Budi,", style: Theme.of(context).textTheme.headline1),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("Selamat beraktifitas hari ini", style: Theme.of(context).textTheme.headline2),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50),
                          ),
                        ),
                        child: ImageSlideshow(
                          isLoop: true,
                          indicatorRadius: 0,
                          children: [
                            Image.asset(
                              'assets/images/promo_image.png',
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/promo_image.png',
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/promo_image.png',
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                              itemCount: images.length,
                              itemBuilder: (context, i) =>
                                  ButtonHome(image: images[i], title: title[i]),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 16
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ),
        ),
    );

  }
}
