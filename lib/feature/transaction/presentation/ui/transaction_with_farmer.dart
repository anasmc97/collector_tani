import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/feature/transaction/presentation/bloc/farmer_transaction_bloc/farmer_transaction_bloc.dart';
import 'package:project_tani/feature/transaction/presentation/ui/transaction_with_farmer_detail.dart';
import 'package:project_tani/feature/transaction/presentation/widget/transaction_with_farmer_widget.dart';

class TransactionWithFarmerPage extends StatefulWidget {
  final String? token;
  const TransactionWithFarmerPage({Key? key, this.token}) : super(key: key);

  @override
  State<TransactionWithFarmerPage> createState() =>
      _TransactionWithFarmerPageState();
}

class _TransactionWithFarmerPageState extends State<TransactionWithFarmerPage> {
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
                          'Transaksi Dengan Petani',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: CustomColors.colorsFontPrimary),
                        ),
                      ),
                    ],
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
                            child: Text('daftar transaksi petani kosong')),
                      );
                    } else if (state is GetListFarmerTransactionSuccess) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemCount: state.listFarmerTransaction!.length,
                            itemBuilder: (context, index) =>
                                TransactionWithFarmerWidget(
                              image: 'assets/fruit.png',
                              farmerTransactionModel:
                                  state.listFarmerTransaction![index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return TransactionWithFarmerDetail(
                                        farmerTransaction:
                                            state.listFarmerTransaction![index],
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
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
