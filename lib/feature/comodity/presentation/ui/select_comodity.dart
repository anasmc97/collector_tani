import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:project_tani/core/helper/helper.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/core/utils/widgets/custom_button.dart';
import 'package:project_tani/feature/Farmer/domain/entities/farmer.dart';
import 'package:project_tani/feature/comodity/domain/entity/fruit.dart';
import 'package:project_tani/feature/comodity/presentation/bloc/comodity_bloc.dart';
import 'package:project_tani/feature/comodity/presentation/ui/comodity.dart';
import 'package:project_tani/feature/comodity/presentation/widgets/selected_comodity_box.dart';

class SelectComodityPage extends StatefulWidget {
  String? token;
  Farmer? farmer;
  SelectComodityPage({Key? key, this.token, this.farmer}) : super(key: key);

  @override
  State<SelectComodityPage> createState() => _SelectComodityPageState();
}

class _SelectComodityPageState extends State<SelectComodityPage> {
  final List<String> _listComodity = [
    'Mangga',
    'Rambutan',
    'Durian',
    'Manggis'
  ];

  List<Fruit?>? selectedFruit = [];
  //bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: SafeArea(
        child: Container(
          //padding: const EdgeInsets.only(top: 8),
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 24, top: 24),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Catat Komoditas Buah',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        'Pilih Petani Terlebih Dahulu',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontWeight: FontWeight.normal, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: -10,
                top: -30,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Titik-titik.png'),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 16, left: 36, right: 35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: Text(
                              'Pilih jenis buah',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.only(top: 16.0),
                            child: BlocBuilder<ComodityBloc, ComodityState>(
                              builder: (context, state) {
                                if (state is GetFruitSuccess) {
                                  return ListView.builder(
                                      itemCount: state.listFruit.length ?? 0,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              selectedFruit!.clear();
                                              selectedFruit!
                                                  .add(state.listFruit[index]);
                                              setState(() {});
                                            },
                                            child: SelectedComodityBox(
                                              fruit: state.listFruit[index],
                                              selectedFruit:
                                                  selectedFruit!.isNotEmpty
                                                      ? selectedFruit!.first
                                                      : const Fruit(),
                                            ),
                                          ),
                                        );
                                      });
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                          BlocConsumer<ComodityBloc, ComodityState>(
                            listener: (context, state) {
                              if (state is ComodityDataError) {
                                showSimpleNotification(
                                    Text(state.message ?? 'terjadi kesalahan'),
                                    background: CustomColors.dangerColor);
                              } else if (state is AddComoditySucces) {
                                showSimpleNotification(
                                    Text("Sukses Menambah Data Petani"),
                                    background: CustomColors.primary);
                                Helper.navigatorPushAndReplacement(
                                  context,
                                  ComodityPage(
                                    token: widget.token,
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is ComodityLoading) {
                                return const Padding(
                                  padding: EdgeInsets.only(top: 48.0),
                                  child: Center(
                                      child: CircularProgressIndicator(
                                          color: CustomColors.primary)),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 24, bottom: 40),
                                  child: CustomButton(
                                    'Tambah',
                                    color: CustomColors.buttonColor,
                                    onTap: () {
                                      BlocProvider.of<ComodityBloc>(context)
                                          .add(
                                        AddComodityEvent(
                                            token: widget.token,
                                            farmerId: widget.farmer!.id,
                                            fruitId: selectedFruit?.first?.id),
                                      );

                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) {
                                      //       return ComodityPage();
                                      //     },
                                      //   ),
                                      // );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
