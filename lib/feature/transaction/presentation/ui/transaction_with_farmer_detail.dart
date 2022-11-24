import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/feature/transaction/domain/entities/farmer_transaction.dart';
import 'package:project_tani/feature/transaction/presentation/widget/transaction_with_farmer_detail_widget.dart';

class TransactionWithFarmerDetail extends StatelessWidget {
  FarmerTransaction? farmerTransaction;
  TransactionWithFarmerDetail({Key? key, this.farmerTransaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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
                                'Detail Transaksi',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        color: CustomColors.colorsFontPrimary),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 54.0),
                        child: Text(
                          'Detail Transaksi',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ),
                      TransactionWithFarmerDetailWidget(
                        image: 'assets/fruit.png',
                        farmerTransaction: farmerTransaction,
                        onTap: () {},
                      ),
                    ]))));
  }
}
