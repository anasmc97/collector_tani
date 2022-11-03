// import 'package:flutter/material.dart';
// import 'package:project_tani/core/utils/shared_value.dart';
// import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
// import 'package:project_tani/feature/comodity/presentation/ui/detail_comodity.dart';
// import 'package:project_tani/feature/comodity/presentation/widgets/comodity_widget.dart';
//
// class ComodityPage extends StatelessWidget {
//   ComodityPage({Key? key}) : super(key: key);
//   final List<String> listComodity = ['Mangga, Durian', 'Rambutan, Manggis', 'Durian, Manggis'];
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
//                                   child: Text('Komoditas Buah',
//                                     style: Theme.of(context).textTheme.headline1!.copyWith(color: CustomColors.colorsFontPrimary),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             height: MediaQuery.of(context).size.height,
//                             width: MediaQuery.of(context).size.width,
//                             padding: const EdgeInsets.only(top: 32.0),
//                             child: ListView.builder(
//                                 itemCount: dummyListComodity.length,
//                                 itemBuilder: (context, index) => ComodityWidget(
//                                   image: dummyListComodity[index].image,
//                                   name: dummyListComodity[index].farmer!.name,
//                                   comodity: dummyListComodity[index].comodityName,
//                                   date: dummyListComodity[index].date,
//                                   month: dummyListComodity[index].month,
//                                   year: dummyListComodity[index].year,
//                                   isValid: dummyListComodity[index].isValidate!,
//                                   onTap: (){
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) {
//                                           return DetailComodity();
//                                         },
//                                       ),
//                                     );
//                                   },
//                                 )
//                             ),
//                           ),
//
//                         ]
//                     )
//                 )
//             )
//         )
//     );
//   }
// }
//
