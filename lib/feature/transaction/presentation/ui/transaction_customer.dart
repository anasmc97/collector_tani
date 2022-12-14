import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
import 'package:project_tani/feature/comodity/presentation/bloc/comodity_bloc.dart';
import 'package:project_tani/feature/transaction/domain/entities/farmer_transaction.dart';
import 'package:project_tani/feature/transaction/presentation/bloc/farmer_transaction_bloc/farmer_transaction_bloc.dart';
import 'package:project_tani/feature/transaction/presentation/ui/transacation_farmer_detail.dart';
import 'package:project_tani/feature/transaction/presentation/ui/transaction_customer_detail.dart';
import 'package:project_tani/feature/transaction/presentation/widget/transaction_farmer_widget.dart';
import 'package:project_tani/feature/transaction/presentation/widget/transaction_with_farmer_widget.dart';

class AddCustomerTransactionPage extends StatefulWidget {
  String? token;
  AddCustomerTransactionPage({Key? key, this.token}) : super(key: key);

  @override
  State<AddCustomerTransactionPage> createState() =>
      _AddCustomerTransactionPageState();
}

class _AddCustomerTransactionPageState
    extends State<AddCustomerTransactionPage> {
  @override
  void initState() {
    BlocProvider.of<FarmerTransactionBloc>(context).add(
      GetListFarmerTransactionEvent(
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
                          'Transaksi Pelanggan',
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
                    'Pilih komoditas buah yang tersedia',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                BlocBuilder<FarmerTransactionBloc, FarmerTransactionState>(
                  builder: (context, state) {
                    if (state is FarmerTransactionLoading) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 48.0),
                        child: Center(
                            child: CircularProgressIndicator(
                                color: CustomColors.primary)),
                      );
                    } else if (state is FarmerTransactionEmpty) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 48.0),
                        child: Center(
                            child: Text(
                                'daftar komidatas yang sudah diverifikasi kosong')),
                      );
                    } else if (state is GetListFarmerTransactionSuccess) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: state.listFarmerTransaction?.length ?? 0,
                            itemBuilder: (context, index) =>
                                TransactionWithFarmerWidget(
                                  image: 'assets/fruit.png',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return TransactionCustomerDetail(
                                            farmerTransaction: state
                                                .listFarmerTransaction![index],
                                            token: widget.token,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  farmerTransactionModel:
                                      state.listFarmerTransaction![index],
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
