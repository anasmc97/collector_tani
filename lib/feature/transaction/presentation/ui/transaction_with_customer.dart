// import 'package:flutter/material.dart';
// import 'package:project_tani/core/utils/shared_value.dart';
// import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
// import 'package:project_tani/feature/transaction/presentation/ui/transacation_farmer_detail.dart';
// import 'package:project_tani/feature/transaction/presentation/ui/transaction_with_customer_detail.dart';
// import 'package:project_tani/feature/transaction/presentation/ui/transaction_with_farmer_detail.dart';
// import 'package:project_tani/feature/transaction/presentation/widget/transaction_farmer_widget.dart';
// import 'package:project_tani/feature/transaction/presentation/widget/transaction_with_farmer_widget.dart';
//
// class TransactionWithCustomerPage extends StatelessWidget {
//   const TransactionWithCustomerPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//             child: SingleChildScrollView(
//                 child: Container(
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
//                                   child: Text('Transaksi Pelanggan',
//                                     style: Theme.of(context).textTheme.headline1!.copyWith(color: CustomColors.colorsFontPrimary),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 40.0),
//                             child: Container(
//                               height: MediaQuery.of(context).size.height,
//                               width: MediaQuery.of(context).size.width,
//                               child: ListView.builder(
//                                   itemCount: dummyListComodity.length,
//                                   itemBuilder: (context, index) => TransactionWithFarmerWidget(
//                                     image: dummyListComodity[index].image,
//                                     name: dummyListComodity[index].farmer!.name,
//                                     comodity: dummyListComodity[index].comodityName,
//                                     date: dummyListComodity[index].date,
//                                     month: dummyListComodity[index].month,
//                                     year: dummyListComodity[index].year,
//                                     onTap: (){
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) {
//                                             return TransactionWithCustomerDetail();
//                                           },
//                                         ),
//                                       );
//                                     },
//                                   )
//                               ),
//                             ),
//                           ),
//
//
//                         ]
//                     )
//                 )
//             )
//         )
//     );
//   }
// }
