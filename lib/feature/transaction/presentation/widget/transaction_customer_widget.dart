import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';

class TransactionCustomerWidget extends StatefulWidget {
  final String? image;
  final String? name;
  final String? comodity;
  final String? date;
  final String? month;
  final String? year;
  final bool isValid;
  final Function()? onTap;
  const TransactionCustomerWidget({Key? key,
    required this.image,
    required this.name,
    required this.comodity,
    this.date,
    this.month,
    this.year,
    this.isValid = false,
    required this.onTap}) : super(key: key);

  @override
  State<TransactionCustomerWidget> createState() => _TransactionCustomerWidgetState();
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
              borderRadius: const BorderRadius.all(Radius.circular(10),
              ),
              border: Border.all(
                  color: CustomColors.borderField
              ),
            ),
            child:  Column(
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
                              decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage(widget.image!),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(widget.comodity!, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
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
                      Text('Petani', style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Text('Petani', style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w500, fontSize: 14))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tanggal Panen', style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Text('DD-MM-YYYY', style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w500, fontSize: 14))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Jumlah Berat', style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Text('0000 kg', style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w500, fontSize: 14))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Harga /kg', style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Text('Rp 0000', style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w500, fontSize: 14))
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
