import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/feature/transaction/presentation/ui/transaction_customer.dart';
import 'package:project_tani/feature/transaction/presentation/ui/transaction_farmer.dart';

class SelectTransaction extends StatelessWidget {
  const SelectTransaction({Key? key}) : super(key: key);

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
                                    'Pilih Transaksi',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            color:
                                                CustomColors.colorsFontPrimary),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return AddFarmerTransactionPage();
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                width: 358,
                                height: 227,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/transaksi petani.png'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return AddCustomerTransactionPage();
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                width: 358,
                                height: 227,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/transaksi pelanggan.png'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ),
                          ),
                        ])))));
  }
}
