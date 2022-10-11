import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
import 'package:project_tani/feature/transaction/presentation/widget/transaction_farmer_widget.dart';

class TransactionfarmerDetail extends StatelessWidget {
  const TransactionfarmerDetail({Key? key}) : super(key: key);

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
                                  child: Text('Buat Transaksi Petani',
                                    style: Theme.of(context).textTheme.headline1!.copyWith(color: CustomColors.colorsFontPrimary),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 54.0),
                            child: Text('Pilih komoditas buah', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500, fontSize: 16),),
                          ),
                          TransactionFarmerWidget(
                                image: dummyListComodity[0].image,
                                name: dummyListComodity[0].farmer!.name,
                                comodity: dummyListComodity[0].comodityName,
                                date: dummyListComodity[0].date,
                                month: dummyListComodity[0].month,
                                year: dummyListComodity[0].year,
                                isValid: dummyListComodity[0].isValidate!,
                                onTap: (){ },
                              ),
                          Padding(
                            padding: const EdgeInsets.only(top: 36.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(Radius.circular(10),
                                ),
                                border: Border.all(
                                    color: CustomColors.borderField
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Kuantitas(Kg)', style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                                      ),
                                      Text('0000 Kg', style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w500, fontSize: 16))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Harga', style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                                      ),
                                      Text('Rp 0000', style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w500, fontSize: 16))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Total Harga', style: Theme.of(context).textTheme.headline1!,
                                      ),
                                      Text('Rp 0000', style: Theme.of(context).textTheme.headline1!.copyWith(color: CustomColors.primary))
                                    ],
                                  )
                                ],
                              ),
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
