import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/core/utils/widgets/custom_button.dart';
import 'package:project_tani/core/utils/widgets/custom_text_form_field.dart';
import 'package:project_tani/feature/Farmer/presentation/farmer_bloc/farmer_bloc.dart';
import 'package:project_tani/feature/home/presentation/ui/home_page.dart';

class AddFarmerPage extends StatelessWidget {
  String? token;
  AddFarmerPage({Key? key, this.token}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController landSizeController = TextEditingController();
  TextEditingController numberTreeController = TextEditingController();
  TextEditingController estimationProductionController = TextEditingController();
  TextEditingController landLocationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FarmerBloc? _famerBloc = BlocProvider.of<FarmerBloc>(context);
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: SafeArea(
          child: Container(
            //padding: const EdgeInsets.only(top: 8),
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 24, top: 20),
                  child: Icon(Icons.arrow_back, color: Colors.white,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text('Tentang Petani',
                      style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
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
                      image: DecorationImage(image: AssetImage('assets/Titik-titik.png'),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
                        child: Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Builder(
                                  builder: (context) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(top: 16),
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
                                          padding: const EdgeInsets.only(top: 16),
                                          child: Text('Luas Lahan', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: CustomColors.colorsFontSecondary),
                                            textAlign: TextAlign.start,),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(top: 8),
                                          child: CustomTextFormField(
                                            isNumber: true,
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
                                          padding: const EdgeInsets.only(top: 16),
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
                                          padding: const EdgeInsets.only(top: 16),
                                          child: Text('Estimasi Jumlah Produksi', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: CustomColors.colorsFontSecondary),
                                            textAlign: TextAlign.start,),
                                        ),
                                        Container(
                                            padding: const EdgeInsets.only(top: 8),
                                            child: CustomTextFormField(
                                              isNumber: true,
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
                                          padding: const EdgeInsets.only(top: 16),
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
                                }else if(state is AddFarmerSucces){
                                   Navigator.pop(context);
                                   showSimpleNotification(
                                       Text("Sukses Menambah Data Petani"),
                                       background: CustomColors.primary);
                                 }
                              },
                              builder: (context, state) {
                                if (state is FarmerLoading){
                                  return const Padding(
                                    padding: EdgeInsets.only(top: 48.0),
                                    child: Center(child: CircularProgressIndicator(color: CustomColors.primary)),
                                  );
                                  }else {
                                  return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 24, bottom: 48),
                                      child: CustomButton('Tambah',
                                        color: CustomColors.buttonColor,
                                        onTap: () {
                                          if (_formKey.currentState
                                              ?.validate() ?? false) {
                                            _famerBloc.add(AddFarmerEvent(
                                                token: token,
                                                name: nameController.text,
                                                landLocation: landLocationController.text,
                                                landSize: landSizeController.text,
                                                estimationProduction: estimationProductionController.text,
                                                numberTree: numberTreeController.text
                                            ));
                                          }
                                        },
                                      )
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
