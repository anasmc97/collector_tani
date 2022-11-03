import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:project_tani/core/helper/helper.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/core/utils/widgets/custom_button.dart';
import 'package:project_tani/core/utils/widgets/custom_text_form_field.dart';
import 'package:project_tani/feature/Farmer/domain/entities/farmer.dart';
import 'package:project_tani/feature/Farmer/presentation/farmer_bloc/farmer_bloc.dart';
import 'package:project_tani/feature/Farmer/presentation/ui/farmer_page.dart';
import 'package:project_tani/injection_container.dart';

class DetailFarmerPage extends StatefulWidget {
  Farmer? farmer;
  String? token;

  DetailFarmerPage({Key? key, this.farmer, this.token}) : super(key: key);

  @override
  State<DetailFarmerPage> createState() => _DetailFarmerPageState();
}

class _DetailFarmerPageState extends State<DetailFarmerPage> {
  final _formKey = GlobalKey<FormState>();
  FarmerBloc? _farmerBloc;

  TextEditingController nameController = TextEditingController();

  TextEditingController landSizeController = TextEditingController();

  TextEditingController numberTreeController = TextEditingController();

  TextEditingController estimationProductionController = TextEditingController();

  TextEditingController landLocationController = TextEditingController();


  @override
  void initState() {
    _farmerBloc = BlocProvider.of<FarmerBloc>(context);
    nameController = TextEditingController(text: widget.farmer!.name);

    landSizeController = TextEditingController(text: widget.farmer!.landSize.toString());

    numberTreeController = TextEditingController(text: widget.farmer!.numberTree.toString());

    estimationProductionController = TextEditingController(text: widget.farmer!.estimationProduction.toString());

    landLocationController = TextEditingController(text: widget.farmer!.landLocation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 16),
                            alignment: Alignment.center,
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: const Icon(Icons.arrow_back),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: 162,
                              height: 162,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage('assets/Ellipse 9.png'),
                                  fit: BoxFit.fill
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Center(
                              child: Text('Info Petani',
                                style: Theme.of(context).textTheme.headline1!.copyWith(color: CustomColors.colorsFontPrimary, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Builder(
                                builder: (context) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(top: 32),
                                        child: Text('Nama',
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: CustomColors.colorsFontSecondary),
                                          textAlign: TextAlign.start,),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: CustomTextFormField(
                                            controller: nameController,
                                            hintext: 'Masukkan Nama Petani',
                                            validator: (value){
                                              if(value!.trim().isEmpty){
                                                return 'Masukkan Nama Petani';
                                              }else{
                                                return null;
                                              }
                                            }
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top: 32),
                                        child: Text('Luas Lahan', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: CustomColors.colorsFontSecondary),
                                          textAlign: TextAlign.start,),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: CustomTextFormField(
                                            controller: landSizeController,
                                            hintext: 'Masukkan Luas Lahan',
                                            validator: (value) {
                                              if(value!.trim().isEmpty){
                                                return 'Masukkan Luas Lahan';
                                              }else{
                                                return null;
                                              }
                                            }
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top: 32),
                                        child: Text('Jumlah Pohon', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: CustomColors.colorsFontSecondary),
                                          textAlign: TextAlign.start,),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: CustomTextFormField(
                                          controller: numberTreeController,
                                          hintext: 'Masukkan Jumlah Pohon',
                                          isNumber: true,
                                          validator: (value){
                                            if(value!.trim().isEmpty){
                                              return 'Masukkan Jumlah Pohon';
                                            }else{
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top: 32),
                                        child: Text('Estimasi Jumlah Produksi', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: CustomColors.colorsFontSecondary),
                                          textAlign: TextAlign.start,),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.only(top: 8),
                                          child: CustomTextFormField(
                                            controller: estimationProductionController,
                                            hintext: 'Masukkan Estimasi Jumlah Produksi',
                                            validator: (value){
                                              if(value!.trim().isEmpty){
                                                return 'Masukkan Estimasi Jumlah Produksi';
                                              }else{
                                                return null;
                                              }
                                            },
                                          )
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top: 32),
                                        child: Text('Lokasi Lahan', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: CustomColors.colorsFontSecondary),
                                          textAlign: TextAlign.start,),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.only(top: 8),
                                          child: CustomTextFormField(
                                            controller: landLocationController,
                                            hintext: 'Masukkan Lokasi Lahan',
                                            validator: (value){
                                              if(value!.trim().isEmpty){
                                                return 'Masukkan Lokasi Lahan';
                                              }else{
                                                return null;
                                              }
                                            },
                                          )
                                      ),

                                    ],
                                  );
                                }
                            ),
                          ),
                          BlocConsumer<FarmerBloc, FarmerState>(
                          listener: (context, state) {
                            if(state is FarmerDataError){
                              showSimpleNotification(
                                  Text(state.message ?? 'terjadi kesalahan'),
                                  background: CustomColors.dangerColor);
                            }else if(state is UpdateFarmerSucces){
                              showSimpleNotification(
                                  Text("Sukses Merubah Data Petani"),
                                  background: CustomColors.primary);
                            }else if(state is DeleteFarmerSucces){
                              Navigator.pop(context);
                              showSimpleNotification(
                                  Text("Sukses Merubah mengapus Petani"),
                                  background: CustomColors.primary);
                            }
                          },
                          builder: (context, state) {
                            if (state is FarmerLoading){
                              return const Padding(
                                padding: EdgeInsets.only(top: 48.0),
                                child: Center(child: CircularProgressIndicator(color: CustomColors.primary)),
                              );
                            }else{
                              return Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(top: 48),
                                      child: CustomButton('Simpan', color: CustomColors.buttonColor,
                                        onTap: (){
                                          if(_formKey.currentState?.validate() ?? false){
                                            _farmerBloc!.add(UpdateFarmerEvent(
                                                id: widget.farmer!.id,
                                                token: widget.token,
                                                name: nameController.text,
                                                landLocation: landLocationController.text,
                                                landSize: landSizeController.text,
                                                estimationProduction: estimationProductionController.text,
                                                numberTree: numberTreeController.text
                                            ));
                                          }
                                        },
                                      )
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 12, bottom: 48),
                                      child: CustomButton('Hapus', color: Colors.white, fontColor: CustomColors.buttonColor,
                                        onTap: () async {
                                          _farmerBloc!.add(DeleteFarmerEvent(id: widget.farmer!.id, token: widget.token));
                                        },
                                      )
                                  ),
                                ],
                              );
                            }
                        },
                      ),
                          


                        ]
                    )
                )
            )
        )
    );
  }
}
