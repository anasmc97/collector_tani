import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/core/utils/widgets/custom_button.dart';
import 'package:project_tani/core/utils/widgets/custom_text_form_field.dart';
import 'package:project_tani/feature/comodity/data/models/comodity_model.dart';
import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
import 'package:project_tani/feature/transaction/domain/entities/farmer_transaction.dart';
import 'package:project_tani/feature/transaction/presentation/bloc/farmer_transaction_bloc/farmer_transaction_bloc.dart';
import 'package:project_tani/feature/transaction/presentation/widget/transaction_farmer_widget.dart';

class TransactionFarmerDetail extends StatefulWidget {
  String? token;
  ComodityModel? comodity;
  TransactionFarmerDetail({Key? key, this.token, this.comodity})
      : super(key: key);

  @override
  State<TransactionFarmerDetail> createState() =>
      _TransactionFarmerDetailState();
}

class _TransactionFarmerDetailState extends State<TransactionFarmerDetail> {
  TextEditingController qtyController = TextEditingController(text: '0');

  TextEditingController priceController = TextEditingController(text: '0');

  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
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
                          'Pilih komoditas buah',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ),
                      TransactionFarmerWidget(
                        image: 'assets/fruit.png',
                        comodityModel: widget.comodity,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 36.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                'Kuantitas(Kg)',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: CustomColors.colorsFontPrimary),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              child: CustomTextFormField(
                                isNumber: true,
                                controller: qtyController,
                                hintext: 'Enter Quantity Comodity (Kg)',
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return 'Please enter your Quantitys';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  totalPrice = int.parse(qtyController.text) *
                                      int.parse(priceController.text);
                                  setState(() {});
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                'Harga',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: CustomColors.colorsFontPrimary),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              child: CustomTextFormField(
                                isNumber: true,
                                controller: priceController,
                                hintext: 'Enter Price Comodity',
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return 'Please enter your Price';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  totalPrice = int.parse(qtyController.text) *
                                      int.parse(priceController.text);
                                  setState(() {});
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Container(
                                height: 76,
                                padding: const EdgeInsets.only(top: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(
                                      width: 2,
                                      color: CustomColors.borderField),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Total Harga',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text(totalPrice.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  color: CustomColors.primary)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ])),
            BlocBuilder<FarmerTransactionBloc, FarmerTransactionState>(
              builder: (context, state) {
                if (state is FarmerTransactionLoading) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 48.0),
                    child: Center(
                        child: CircularProgressIndicator(
                            color: CustomColors.primary)),
                  );
                } else {
                  return Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: CustomButton(
                        'Simpan',
                        color: CustomColors.buttonColor,
                        onTap: () {
                          BlocProvider.of<FarmerTransactionBloc>(context).add(
                            AddFarmerTransactionEvent(
                              token: widget.token,
                              fruitComodityId: widget.comodity!.id,
                              price: int.parse(priceController.text),
                              weight: int.parse(qtyController.text),
                              priceTotal: totalPrice,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
