import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/feature/Farmer/presentation/ui/add_farmer_page.dart';
import 'package:project_tani/feature/Farmer/presentation/ui/farmer_page.dart';
import 'package:project_tani/feature/comodity/presentation/ui/comodity.dart';
import 'package:project_tani/feature/comodity/presentation/ui/select_farmer.dart';
import 'package:project_tani/feature/home/presentation/widgets/button_home.dart';
import 'package:project_tani/feature/transaction/presentation/ui/select_transaction.dart';
import 'package:project_tani/feature/transaction/presentation/ui/transaction_farmer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<String> images = ["assets/Icon.png", "assets/catat_komoditas_buah.png",
     "assets/buat_transaksi.png", "assets/petani.png",
     "assets/komoditas_buah.png","assets/transaksi.png", "assets/transaksi.png"];
  List<String> title = ["Tambah Petani", "Catat Komoditas Buah",
    "Buat Transaksi", "Petani",
    "Komoditas Buah","Transaksi Petani", "Transaksi Pelanggan"];
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
                    Text('Hallo Budi,', style: Theme.of(context).textTheme.headline1),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('Selamat beraktifitas hari ini', style: Theme.of(context).textTheme.headline2),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10),
                          ),
                        ),
                        child: ImageSlideshow(
                          isLoop: true,
                          indicatorRadius: 8,
                          indicatorColor: CustomColors.buttonColor,
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
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                              itemCount: images.length,
                              itemBuilder: (context, i) {
                              if(title[i] == 'Tambah Petani'){
                                return ButtonHome(image: images[i], title: title[i],
                                  onTap:(){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return AddFarmerPage();
                                        },
                                      ),
                                    );
                                  });
                              }else if(title[i] == 'Petani'){
                                return ButtonHome(image: images[i], title: title[i],
                                    onTap:(){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return FarmerPage();
                                          },
                                        ),
                                      );
                                    });
                              }else if(title[i] == 'Catat Komoditas Buah'){
                                return ButtonHome(image: images[i], title: title[i],
                                    onTap:(){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return SelectFarmerPage();
                                          },
                                        ),
                                      );
                                    });
                              }else if(title[i] == 'Komoditas Buah'){
                                return ButtonHome(image: images[i], title: title[i],
                                    onTap:(){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return ComodityPage();
                                          },
                                        ),
                                      );
                                    });
                              }else if(title[i] == 'Buat Transaksi'){
                                return ButtonHome(image: images[i], title: title[i],
                                    onTap:(){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return SelectTransaction();
                                          },
                                        ),
                                      );
                                    });
                              }

                              else{
                                return ButtonHome(image: images[i], title: title[i],
                                    );
                                }
                              },

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
