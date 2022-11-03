// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:project_tani/core/utils/shared_value.dart';
// import 'package:project_tani/core/utils/widgets/custom_button.dart';
// import 'package:project_tani/core/utils/widgets/custom_text_form_field.dart';
// import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
// import 'package:project_tani/feature/transaction/presentation/widget/transaction_farmer_widget.dart';
//
// class TransactionfarmerDetail extends StatelessWidget {
//   TransactionfarmerDetail({Key? key}) : super(key: key);
//   TextEditingController qtyController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//             child: Stack(
//               children: [
//                 Container(
//                     padding: const EdgeInsets.only(left: 24, right: 24),
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.only(top: 16),
//                             alignment: Alignment.center,
//                             child: Stack(
//                               children: [
//                                 Container(
//                                     alignment: Alignment.centerLeft,
//                                     child: const Icon(Icons.arrow_back)),
//                                 Center(
//                                   child: Text('Buat Transaksi Petani',
//                                     style: Theme.of(context).textTheme.headline1!.copyWith(color: CustomColors.colorsFontPrimary),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 54.0),
//                             child: Text('Pilih komoditas buah', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500, fontSize: 16),),
//                           ),
//                           TransactionFarmerWidget(
//                                 image: dummyListComodity[0].image,
//                                 name: dummyListComodity[0].farmer!.name,
//                                 comodity: dummyListComodity[0].comodityName,
//                                 date: dummyListComodity[0].date,
//                                 month: dummyListComodity[0].month,
//                                 year: dummyListComodity[0].year,
//                                 isValid: dummyListComodity[0].isValidate!,
//                                 onTap: (){ },
//                               ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 36.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.only(top: 8),
//                                   child: Text('Kuantitas(Kg)', style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w500, fontSize: 16, color: CustomColors.colorsFontPrimary),
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: const EdgeInsets.only(top: 8),
//                                   child: CustomTextFormField(
//                                       controller: qtyController,
//                                       hintext: 'Enter Quantity Comodity (Kg)',
//                                       validator: (value) {
//                                         if(value!.trim().isEmpty){
//                                           return 'Please enter your Quantitys';
//                                         }else{
//                                           return null;
//                                         }
//                                       }
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: const EdgeInsets.only(top: 8),
//                                   child: Text('Harga', style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w500, fontSize: 16, color: CustomColors.colorsFontPrimary),
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: const EdgeInsets.only(top: 8),
//                                   child: CustomTextFormField(
//                                       controller: priceController,
//                                       hintext: 'Enter Price Comodity',
//                                       validator: (value) {
//                                         if(value!.trim().isEmpty){
//                                           return 'Please enter your Price';
//                                         }else{
//                                           return null;
//                                         }
//                                       }
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 16.0),
//                                   child: Container(
//                                     height: 76,
//                                     padding: const EdgeInsets.only(top: 8),
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: const BorderRadius.all(Radius.circular(10),
//                                       ),
//                                       border: Border.all(
//                                           width: 2,
//                                           color: CustomColors.borderField
//                                       ),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.only(left: 8.0),
//                                           child: Text('Total Harga', style: Theme.of(context).textTheme.headline1!,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(right: 8.0),
//                                           child: Text('Rp 0000', style: Theme.of(context).textTheme.headline1!.copyWith(color: CustomColors.primary)),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                           ),
//
//                         ]
//                     )
//                 ),
//                 Align(
//                     alignment: FractionalOffset.bottomCenter,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 24),
//                       padding: const EdgeInsets.only(bottom: 24.0),
//                       child: CustomButton('Simpan', color: CustomColors.buttonColor,
//                         onTap: (){
//                         },
//                       ),
//                     )
//                 ),
//               ],
//             )
//         )
//     );
//   }
// }
