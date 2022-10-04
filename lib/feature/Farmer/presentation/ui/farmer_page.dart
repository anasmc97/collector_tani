import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/feature/Farmer/domain/entity.dart';
import 'package:project_tani/feature/Farmer/presentation/ui/detail_farmer_page.dart';
import 'package:project_tani/feature/Farmer/presentation/widgets/farmer_widget.dart';

class FarmerPage extends StatelessWidget {
  FarmerPage({Key? key}) : super(key: key);
  final List<String> listComodity = ['Mangga, Durian', 'Rambutan, Manggis', 'Durian, Manggis'];
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
                      child: const Icon(Icons.arrow_back)),
                      Center(
                        child: Text('Petani',
                        style: Theme.of(context).textTheme.headline1!.copyWith(color: CustomColors.colorsFontPrimary),
                        ),
                      ),
                    ],
                  ),
                ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 32.0),
                child: ListView.builder(
                  itemCount: dummyListFarmer.length,
                  itemBuilder: (context, index) => FarmerWidget(
                      image: dummyListFarmer[index].image,
                      name: dummyListFarmer[index].name,
                      comodity: listComodity[index],
                      onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DetailFarmerPage(farmer: dummyListFarmer[index]);
                                  },
                                ),
                              );
                      },
                    )
                ),
              ),

              ]
            )
          )
        )
      )
    );
  }
}

