import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/feature/comodity/data/models/comodity_model.dart';

class TransactionCustomerWidget extends StatefulWidget {
  final String? image;
  final ComodityModel? comodityModel;
  const TransactionCustomerWidget(
      {Key? key, required this.image, required this.comodityModel})
      : super(key: key);

  @override
  State<TransactionCustomerWidget> createState() =>
      _TransactionCustomerWidgetState();
}

class _TransactionCustomerWidgetState extends State<TransactionCustomerWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
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
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(color: CustomColors.borderField),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(widget.image!),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                widget.comodityModel!.fruit!.name!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Petani',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(widget.comodityModel!.farmer!.name!,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 14))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tanggal Panen',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(widget.comodityModel?.harvestingDate ?? '-',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 14))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jumlah Berat',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(widget.comodityModel?.weight.toString() ?? '-',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 14))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Harga /kg',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(widget.comodityModel?.priceKg.toString() ?? '-',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 14))
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
