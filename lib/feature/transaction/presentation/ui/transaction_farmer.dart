import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
import 'package:project_tani/feature/comodity/presentation/bloc/comodity_bloc.dart';
import 'package:project_tani/feature/comodity/presentation/ui/detail_comodity.dart';
import 'package:project_tani/feature/comodity/presentation/widgets/comodity_widget.dart';
import 'package:project_tani/feature/login/data/models/auth_model.dart';
import 'package:project_tani/feature/transaction/presentation/ui/transacation_farmer_detail.dart';
import 'package:project_tani/feature/transaction/presentation/ui/transaction_with_farmer_detail.dart';
import 'package:project_tani/feature/transaction/presentation/widget/transaction_farmer_widget.dart';

class AddFarmerTransactionPage extends StatefulWidget {
  final String? token;
  const AddFarmerTransactionPage({Key? key, this.token}) : super(key: key);

  @override
  State<AddFarmerTransactionPage> createState() =>
      _AddFarmerTransactionPageState();
}

class _AddFarmerTransactionPageState extends State<AddFarmerTransactionPage> {
  @override
  void initState() {
    BlocProvider.of<ComodityBloc>(context).add(
      GetListComodityVerifiedEvent(
        token: widget.token,
      ),
    );
    super.initState();
  }

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
                        child: Text(
                          'Buat Transaksi Petani',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: CustomColors.colorsFontPrimary),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 54.0),
                  child: Text(
                    'Pilih komoditas buah',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                BlocBuilder<ComodityBloc, ComodityState>(
                  builder: (context, state) {
                    if (state is ComodityLoading) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 48.0),
                        child: Center(
                            child: CircularProgressIndicator(
                                color: CustomColors.primary)),
                      );
                    } else if (state is ComodityEmpty) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 48.0),
                        child: Center(
                            child: Text(
                                'daftar komidatas yang sudah diverifikasi kosong')),
                      );
                    } else if (state is GetListComoditySuccess) {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: state.listComodity.length,
                            itemBuilder: (context, index) =>
                                TransactionFarmerWidget(
                                  image: 'assets/fruit.png',
                                  comodityModel: state.listComodity[index],
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return TransactionFarmerDetail(
                                            token: widget.token,
                                            comodity: state.listComodity[index],
                                          );
                                        },
                                      ),
                                    );
                                  },
                                )),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
