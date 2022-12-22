import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
import 'package:project_tani/feature/transaction/data/models/customer_transaction_model.dart';
import 'package:project_tani/feature/transaction/domain/entities/customer_transaction.dart';
import 'package:project_tani/feature/transaction/presentation/widget/transaction_with_customer_detail_widget.dart';
import 'package:project_tani/feature/transaction/presentation/widget/transaction_with_farmer_detail_widget.dart';

class TransactionWithCustomerDetail extends StatelessWidget {
  CustomerTransaction? customerTransaction;
  int? totalPayment;
  TransactionWithCustomerDetail(
      {Key? key, this.customerTransaction, this.totalPayment})
      : super(key: key);
  TextEditingController qtyController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                          .copyWith(color: CustomColors.colorsFontPrimary),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: TransactionWithCustomerDetailWidget(
                image: 'assets/fruit.png',
                customerTransactionModel: customerTransaction,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Text(
                'Detail Pengiriman',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: CustomColors.colorsFontPrimary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Nama',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: CustomColors.colorsFontPrimary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                customerTransaction!.receiverName!,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: CustomColors.colorsFontPrimary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Nomor Telepon',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: CustomColors.colorsFontPrimary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                customerTransaction!.customer!.phoneNumber!,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: CustomColors.colorsFontPrimary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Alamat',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: CustomColors.colorsFontPrimary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                customerTransaction!.address!,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: CustomColors.colorsFontPrimary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Tanggal Kirim',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: CustomColors.colorsFontPrimary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                customerTransaction!.shipingDate!,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: CustomColors.colorsFontPrimary),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24.0),
              child: Divider(
                thickness: 1,
                color: CustomColors.borderField,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                'Harga',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: CustomColors.colorsFontPrimary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${customerTransaction!.farmerTransaction!.comodity!.fruit!.name} (${customerTransaction!.farmerTransaction!.comodity!.fruitGrade}) x ${customerTransaction!.weight} Kg',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: CustomColors.colorsFontPrimary),
                  ),
                  Text(
                    'Rp ' + customerTransaction!.totalPayment.toString(),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: CustomColors.primary),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pengiriman',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: CustomColors.colorsFontPrimary),
                  ),
                  Text(
                    'Rp ' + customerTransaction!.shippingPayment.toString(),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: CustomColors.primary),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24.0),
              child: Divider(
                thickness: 1,
                color: CustomColors.borderField,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Harga',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: CustomColors.colorsFontPrimary),
                  ),
                  Text(
                    'Rp ' + totalPayment.toString(),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: CustomColors.primary),
                  ),
                ],
              ),
            ),
          ])),
    )));
  }
}
