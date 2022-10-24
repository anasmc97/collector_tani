import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/core/utils/widgets/custom_button.dart';
import 'package:project_tani/core/utils/widgets/custom_text_form_field.dart';
import 'package:project_tani/feature/Farmer/domain/entities/farmer.dart';

class DetailFarmerPage extends StatelessWidget {
  Farmer? farmer;
  DetailFarmerPage({Key? key, this.farmer}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: farmer!.name);
    TextEditingController luasLahanController = TextEditingController(text: farmer!.luasLahan);
    TextEditingController jumlahPohonController = TextEditingController(text: farmer!.jumlahPohon);
    TextEditingController estimasiJumlahProduksiController = TextEditingController(text: farmer!.estimasiJumlahProduksi);
    TextEditingController koordinatLahanController = TextEditingController(text: farmer!.koordinatLahan);
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
                              decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage(farmer!.image!),
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
                                            hintext: 'Enter Your Full Name',
                                            validator: (value){
                                              if(value!.trim().isEmpty){
                                                return 'Please enter your Full Name';
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
                                            controller: luasLahanController,
                                            hintext: 'Enter Your Luas Lahan',
                                            validator: (value) {
                                              if(value!.trim().isEmpty){
                                                return 'Please enter your Luas Lahan';
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
                                          controller: jumlahPohonController,
                                          hintext: 'Enter Your Jumlah Pohon',
                                          isNumber: true,
                                          validator: (value){
                                            if(value!.trim().isEmpty){
                                              return 'Please enter your Jumlah Pohon';
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
                                            controller: estimasiJumlahProduksiController,
                                            hintext: 'Enter Your Estimasi Jumlah Produksi',
                                            validator: (value){
                                              if(value!.trim().isEmpty){
                                                return 'Please enter your Estimasi Jumlah Produksi';
                                              }else{
                                                return null;
                                              }
                                            },
                                          )
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top: 32),
                                        child: Text('Koordinat Lahan', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: CustomColors.colorsFontSecondary),
                                          textAlign: TextAlign.start,),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.only(top: 8),
                                          child: CustomTextFormField(
                                            controller: koordinatLahanController,
                                            hintext: 'Enter Your Koordinat Lahan',
                                            validator: (value){
                                              if(value!.trim().isEmpty){
                                                return 'Please enter your Koordinat Lahan';
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
                          Padding(
                              padding: const EdgeInsets.only(top: 48),
                              child: CustomButton('Simpan', color: CustomColors.buttonColor,
                                onTap: (){
                                  if(_formKey.currentState?.validate() ?? false){


                                  }
                                },
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 12, bottom: 48),
                              child: CustomButton('Hapus', color: Colors.white, fontColor: CustomColors.buttonColor,
                                onTap: (){},
                              )
                          ),


                        ]
                    )
                )
            )
        )
    );
  }
}
