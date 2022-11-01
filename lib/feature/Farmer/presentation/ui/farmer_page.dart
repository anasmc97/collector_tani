import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_tani/core/helper/helper.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/feature/Farmer/presentation/farmer_bloc/farmer_bloc.dart';
import 'package:project_tani/feature/Farmer/presentation/ui/detail_farmer_page.dart';
import 'package:project_tani/feature/Farmer/presentation/widgets/farmer_widget.dart';
import 'package:project_tani/injection_container.dart';

class FarmerPage extends StatelessWidget {
  String? token;
  FarmerPage({Key? key, this.token}) : super(key: key);
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
              BlocBuilder<FarmerBloc, FarmerState>(
              builder: (context, state) {
                if(state is FarmerLoading){
                  return const Padding(
                    padding: EdgeInsets.only(top: 48.0),
                    child: Center(child: CircularProgressIndicator(color: CustomColors.primary)),
                  );
                }else if(state is FarmerEmpty){
                  return const Padding(
                    padding: EdgeInsets.only(top: 48.0),
                    child: Center(child: Text('daftar petani kosong')),
                  );
                }else if(state is GetAllFarmerSucces){
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 32.0),
                    child: ListView.builder(
                        itemCount: state.listFarmer!.length,
                        itemBuilder: (context, index) => FarmerWidget(
                          image: 'assets/Ellipse 9.png',
                          name: state.listFarmer![index]!.name,
                          onTap: (){
                            Helper.navigator(context, BlocProvider(
                                create: (context) => sl<FarmerBloc>(),
                            child: DetailFarmerPage(farmer: state.listFarmer![index]!, token: token,)));
                          },
                        )
                    ),
                  );
                }else{
                  return Container();
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

