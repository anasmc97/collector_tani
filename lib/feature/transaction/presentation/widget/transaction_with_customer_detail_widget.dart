import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';

class TransactionWithCustomerDetailWidget extends StatelessWidget {
  final String? image;
  final String? name;
  final String? comodity;
  final String? date;
  final String? month;
  final String? year;
  final Function()? onTap;
  const TransactionWithCustomerDetailWidget({Key? key,
    required this.image,
    required this.name,
    required this.comodity,
    this.date,
    this.month,
    this.year,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10),
                ),
                border: Border.all(
                    color: CustomColors.borderField
                ),
                  boxShadow: [
                    BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                    ),
                   ]
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text('No Order:', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: CustomColors.colorsFontSecondary
                        ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('XXXXXXXXXXXXX', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: CustomColors.colorsFontPrimary
                        ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text('Detail Order', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: CustomColors.colorsFontSecondary
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text('Petani', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: CustomColors.colorsFontSecondary
                          ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Text('Sayuti', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: CustomColors.colorsFontPrimary
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text('Nama Barang', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: CustomColors.colorsFontSecondary
                          ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Text('Manggis', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: CustomColors.colorsFontPrimary
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text('Grade', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: CustomColors.colorsFontSecondary
                          ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Text('A', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: CustomColors.colorsFontPrimary
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text('Berat', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: CustomColors.colorsFontSecondary
                          ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Text('0000 Kg', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: CustomColors.colorsFontPrimary
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text('Tanggal Panen', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: CustomColors.colorsFontSecondary
                          ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Text('$date - $month - $year', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: CustomColors.colorsFontPrimary
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
