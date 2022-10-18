import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';

class TransactionFarmerWidget extends StatelessWidget {
  final String? image;
  final String? name;
  final String? comodity;
  final String? date;
  final String? month;
  final String? year;
  final bool isValid;
  final Function()? onTap;
  const TransactionFarmerWidget({Key? key,
    required this.image,
    required this.name,
    required this.comodity,
    this.date,
    this.month,
    this.year,
    this.isValid = false,
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
              height: MediaQuery.of(context).size.height * 0.15,
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
                      Row(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage(image!),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(comodity!, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                                    fontSize: 14),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.person_outline, color: CustomColors.colorsFontSecondary, size: 16,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Text(name!, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: CustomColors.colorsFontSecondary
                                      ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.calendar_today_outlined, color: CustomColors.colorsFontSecondary, size: 16,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Text('$date - $month - $year', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: CustomColors.colorsFontSecondary
                                      ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text('Jumlah Berat: 000 Kg', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: CustomColors.primary
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: isValid ? Text('Valid',
                          style: Theme.of(context).textTheme.headline2!
                              .copyWith(fontWeight: FontWeight.w600,
                              color: CustomColors.colorValidText),
                        ) : null,
                      )
                    ],
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
