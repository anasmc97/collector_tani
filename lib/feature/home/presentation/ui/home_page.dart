import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:project_tani/core/helper/helper.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/feature/Farmer/presentation/farmer_bloc/farmer_bloc.dart';
import 'package:project_tani/feature/Farmer/presentation/ui/add_farmer_page.dart';
import 'package:project_tani/feature/Farmer/presentation/ui/farmer_page.dart';
import 'package:project_tani/feature/comodity/presentation/bloc/comodity_bloc.dart';
import 'package:project_tani/feature/comodity/presentation/ui/comodity.dart';
import 'package:project_tani/feature/comodity/presentation/ui/select_farmer.dart';
import 'package:project_tani/feature/home/presentation/widgets/button_home.dart';
import 'package:project_tani/feature/login/data/models/auth_model.dart';
import 'package:project_tani/feature/login/presentation/bloc/auth_bloc.dart';
import 'package:project_tani/feature/login/presentation/ui/login_page.dart';
import 'package:project_tani/feature/transaction/presentation/ui/select_transaction.dart';
import 'package:project_tani/feature/transaction/presentation/ui/transaction_with_customer.dart';
import 'package:project_tani/feature/transaction/presentation/ui/transaction_with_farmer.dart';
import 'package:project_tani/injection_container.dart';

class HomePage extends StatefulWidget {
  AuthModel? authModel;

  HomePage({Key? key, this.authModel}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthBloc? _authBloc;
  FarmerBloc? _farmerBloc;
  AuthModel? _authModel;
  List<String> images = [
    "assets/Icon.png",
    "assets/catat_komoditas_buah.png",
    "assets/buat_transaksi.png",
    "assets/petani.png",
    "assets/komoditas_buah.png",
    "assets/transaksi.png",
    "assets/transaksi.png"
  ];

  List<String> title = [
    "Tambah Petani",
    "Catat Komoditas Buah",
    "Buat Transaksi",
    "Petani",
    "Komoditas Buah",
    "Transaksi Petani",
    "Transaksi Pelanggan"
  ];

  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _farmerBloc = BlocProvider.of<FarmerBloc>(context);
    _authModel = widget.authModel;
    super.initState();
  }

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
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthInitial) {
                      Helper.navigator(
                          context,
                          BlocProvider(
                            create: (context) => sl<AuthBloc>(),
                            child: LoginPage(),
                          ));
                    }
                  },
                  child: GestureDetector(
                      onTap: () {
                        _authBloc!.add(LogoutEvent(token: _authModel!.token));
                      },
                      child: Text('Hallo ' + _authModel!.name! + ',',
                          style: Theme.of(context).textTheme.headline1)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('Selamat beraktifitas hari ini',
                      style: Theme.of(context).textTheme.headline2),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
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
                        if (title[i] == 'Tambah Petani') {
                          return ButtonHome(
                              image: images[i],
                              title: title[i],
                              onTap: () {
                                Helper.navigator(
                                    context,
                                    BlocProvider(
                                        create: (context) => sl<FarmerBloc>(),
                                        child: AddFarmerPage(
                                          token: _authModel!.token,
                                        )));
                              });
                        } else if (title[i] == 'Petani') {
                          return ButtonHome(
                              image: images[i],
                              title: title[i],
                              onTap: () {
                                Helper.navigator(
                                    context,
                                    BlocProvider(
                                        create: (context) => sl<FarmerBloc>()
                                          ..add(GetAllFarmerEvent(
                                              token: _authModel!.token)),
                                        child: FarmerPage(
                                            token: _authModel!.token)));
                              });
                        } else if (title[i] == 'Catat Komoditas Buah') {
                          return ButtonHome(
                              image: images[i],
                              title: title[i],
                              onTap: () {
                                _farmerBloc!.add(GetAllFarmerEvent(
                                    token: _authModel!.token));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SelectFarmerPage(
                                        token: _authModel!.token,
                                      );
                                    },
                                  ),
                                );
                              });
                        } else if (title[i] == 'Komoditas Buah') {
                          return ButtonHome(
                              image: images[i],
                              title: title[i],
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) {
                                //       return ComodityPage();
                                //     },
                                //   ),
                                // );
                              });
                        } else if (title[i] == 'Transaksi Petani') {
                          return ButtonHome(
                              image: images[i],
                              title: title[i],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return TransactionWithFarmerPage(
                                        token: widget.authModel!.token,
                                      );
                                    },
                                  ),
                                );
                              });
                        } else if (title[i] == 'Transaksi Pelanggan') {
                          return ButtonHome(
                              image: images[i],
                              title: title[i],
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) {
                                //       return TransactionWithCustomerPage();
                                //     },
                                //   ),
                                // );
                              });
                        } else if (title[i] == 'Buat Transaksi') {
                          return ButtonHome(
                              image: images[i],
                              title: title[i],
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) {
                                //       return SelectTransaction();
                                //     },
                                //   ),
                                // );
                              });
                        } else {
                          return ButtonHome(
                            image: images[i],
                            title: title[i],
                          );
                        }
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, mainAxisSpacing: 16),
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
