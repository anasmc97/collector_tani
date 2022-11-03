// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:project_tani/core/utils/shared_value.dart';
// import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
// import 'package:project_tani/feature/transaction/presentation/widget/transaction_with_farmer_detail_widget.dart';
//
// class TransactionWithFarmerDetail extends StatelessWidget {
//   TransactionWithFarmerDetail({Key? key}) : super(key: key);
//   TextEditingController qtyController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//             child: Container(
//                 padding: const EdgeInsets.only(left: 24, right: 24),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.only(top: 16),
//                         alignment: Alignment.center,
//                         child: Stack(
//                           children: [
//                             Container(
//                                 alignment: Alignment.centerLeft,
//                                 child: const Icon(Icons.arrow_back)),
//                             Center(
//                               child: Text('Detail Transaksi',
//                                 style: Theme.of(context).textTheme.headline1!.copyWith(color: CustomColors.colorsFontPrimary),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 54.0),
//                         child: Text('Detail Transaksi', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500, fontSize: 16),),
//                       ),
//                       TransactionWithFarmerDetailWidget(
//                         image: dummyListComodity[0].image,
//                         name: dummyListComodity[0].farmer!.name,
//                         comodity: dummyListComodity[0].comodityName,
//                         date: dummyListComodity[0].date,
//                         month: dummyListComodity[0].month,
//                         year: dummyListComodity[0].year,
//                         onTap: (){ },
//                       ),
//
//                     ]
//                 )
//             )
//         )
//     );
//   }
// }
