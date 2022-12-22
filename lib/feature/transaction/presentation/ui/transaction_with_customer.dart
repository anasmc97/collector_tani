import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
import 'package:project_tani/feature/transaction/presentation/bloc/customer_transaction_bloc/customer_transaction_bloc.dart';
import 'package:project_tani/feature/transaction/presentation/ui/transacation_farmer_detail.dart';
import 'package:project_tani/feature/transaction/presentation/ui/transaction_with_customer_detail.dart';
import 'package:project_tani/feature/transaction/presentation/ui/transaction_with_farmer_detail.dart';
import 'package:project_tani/feature/transaction/presentation/widget/transaction_farmer_widget.dart';
import 'package:project_tani/feature/transaction/presentation/widget/transaction_with_customer_widget.dart';
import 'package:project_tani/feature/transaction/presentation/widget/transaction_with_farmer_widget.dart';

class TransactionWithCustomerPage extends StatefulWidget {
  String? token;
  TransactionWithCustomerPage({Key? key, this.token}) : super(key: key);

  @override
  State<TransactionWithCustomerPage> createState() =>
      _TransactionWithCustomerPageState();
}

class _TransactionWithCustomerPageState
    extends State<TransactionWithCustomerPage> {
  @override
  void initState() {
    BlocProvider.of<CustomerTransactionBloc>(context).add(
      GetListCustomerTransactionEvent(
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
                  padding: const EdgeInsets.only(top: 40.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: BlocBuilder<CustomerTransactionBloc,
                        CustomerTransactionState>(
                      builder: (context, state) {
                        if (state is CustomerTransactionLoading) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 48.0),
                            child: Center(
                                child: CircularProgressIndicator(
                                    color: CustomColors.primary)),
                          );
                        } else if (state is CustomerTransactionEmpty) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 48.0),
                            child: Center(
                                child: Text(
                                    'daftar transaksi customer yang sudah kosong')),
                          );
                        } else if (state is GetListCustomerTransactionSuccess) {
                          return ListView.builder(
                            itemCount: state.listCustomerTransaction?.length,
                            itemBuilder: (context, index) =>
                                TransactionWithCustomerWidget(
                              image: 'assets/fruit.png',
                              onTap: () {
                                var totalPayment = state
                                        .listCustomerTransaction![index]!
                                        .shippingPayment! +
                                    state.listCustomerTransaction![index]!
                                        .totalPayment!;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return TransactionWithCustomerDetail(
                                        customerTransaction: state
                                            .listCustomerTransaction![index],
                                        totalPayment: totalPayment,
                                      );
                                    },
                                  ),
                                );
                              },
                              customerTransactionModel:
                                  state.listCustomerTransaction![index],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
