import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/core/utils/widgets/custom_button.dart';
import 'package:project_tani/core/utils/widgets/custom_text_form_field.dart';
import 'package:project_tani/feature/home/presentation/ui/home_page.dart';

class AddFarmerPage extends StatelessWidget {
  AddFarmerPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController luasLahanController = TextEditingController();
    TextEditingController jumlahPohonController = TextEditingController();
    TextEditingController estimasiJumlahProduksiController = TextEditingController();
    TextEditingController koordinatLahanController = TextEditingController();
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 16),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 24),
                      child: Icon(Icons.arrow_back, color: Colors.white,),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/Titik-titik.png'),
                        ),
                      ),
                    ),
                  ],
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
                        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            Text('Tentang Petani',
                              style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w500),
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
                                        Container(
                                          padding: const EdgeInsets.only(top: 8),
                                          child: Text('cth: -8.5988404, 116.1514111  ', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: CustomColors.colorsFontSecondary),
                                            textAlign: TextAlign.start,),
                                        ),

                                      ],
                                    );
                                  }
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 48, bottom: 48),
                                child: CustomButton('Tambah', color: CustomColors.buttonColor,
                                  onTap: (){
                                    if(_formKey.currentState?.validate() ?? false){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return HomePage();
                                          },
                                        ),
                                      );
                                    }
                                  },
                                )
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
