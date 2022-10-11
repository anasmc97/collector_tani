import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/core/utils/widgets/custom_button.dart';
import 'package:project_tani/core/utils/widgets/custom_text_form_field.dart';
import 'package:project_tani/feature/comodity/presentation/widgets/drop_down_grade.dart';
import 'package:project_tani/feature/comodity/presentation/widgets/mini_button.dart';

class DetailComodity extends StatelessWidget {
  DetailComodity({Key? key}) : super(key: key);
  TextEditingController floweringTreeDateController = TextEditingController(text: '02 - 04 - 2022');
  TextEditingController harvestWeightController = TextEditingController(text: '112 kg');
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
                            child: Stack(
                              children: [
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: const Icon(Icons.arrow_back),
                                ),
                                Center(
                                  child: Text('Detail Komoditas',
                                    style: Theme.of(context).textTheme.headline1!.copyWith(color: CustomColors.colorsFontPrimary),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 66,
                                  height: 66,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(image: AssetImage('assets/Ellipse 9.png'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 42.0),
                                  child: SizedBox(
                                    height: 66,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Sayuti', style: Theme.of(context).textTheme.headline1!.copyWith(color: CustomColors.colorsFontPrimary, fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 14,
                                              height: 14,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(image: AssetImage('assets/catat_komoditas_buah.png'),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 4.0),
                                              child: Text('Manggis', style: Theme.of(context).textTheme.headline2!.copyWith(color: CustomColors.primary, fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 28.0),
                            child: Divider(
                              thickness: 1,
                              color: CustomColors.borderField,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Tanggal Pohon Berbunga', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                                    fontSize: 14),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: CustomTextFormField(
                                      isDateField: true,
                                      controller: floweringTreeDateController,
                                      hintext: 'Masukan tanggal berbunga',
                                      validator: (value){
                                        if(value!.trim().isEmpty){
                                          return 'Tolong Masukan tanggal berbunga';
                                        }else{
                                          return null;
                                        }
                                      }
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Tanggal Panen', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                                    fontSize: 14),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: CustomTextFormField(
                                      isDateField: true,
                                      controller: floweringTreeDateController,
                                      hintext: 'Masukan tanggal berbunga',
                                      validator: (value){
                                        if(value!.trim().isEmpty){
                                          return 'Tolong Masukan tanggal berbunga';
                                        }else{
                                          return null;
                                        }
                                      }
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Tanggal Panen', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                                    fontSize: 14),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: CustomTextFormField(
                                      isDateField: true,
                                      controller: floweringTreeDateController,
                                      hintext: 'Masukan tanggal berbunga',
                                      validator: (value){
                                        if(value!.trim().isEmpty){
                                          return 'Tolong Masukan tanggal berbunga';
                                        }else{
                                          return null;
                                        }
                                      }
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Grade Buah', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                                    fontSize: 14),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: const DropDownGrade(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Berat Hasil Panen', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                                    fontSize: 14),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: CustomTextFormField(
                                      controller: harvestWeightController,
                                      hintext: 'Masukan Berat Hasil Panen',
                                      validator: (value){
                                        if(value!.trim().isEmpty){
                                          return 'Tolong Masukan Berat Hasil Panen';
                                        }else{
                                          return null;
                                        }
                                      }
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: MiniButton(text: 'Hapus'),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 48),
                              child: CustomButton('Simpan', color: Colors.white,
                                  fontColor: CustomColors.buttonColor,
                                onTap: (){
                                  }
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: CustomButton('Validasi', color: CustomColors.buttonColor,
                                onTap: (){},
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0, bottom: 33),
                            child: Text('Jika catatan telah di validasi, maka data tidak dapat dirubah.' ,
                              style: Theme.of(context).textTheme.bodyText1!
                                  .copyWith(fontWeight: FontWeight.w400, color: CustomColors.dangerColor),
                            textAlign: TextAlign.center,
                            ),
                          )
                        ]
                    )
                )
            )
        )
    );
  }
}
