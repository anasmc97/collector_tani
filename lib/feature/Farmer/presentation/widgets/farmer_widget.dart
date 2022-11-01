import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';

class FarmerWidget extends StatelessWidget {
  final String? image;
  final String? name;
  final Function()? onTap;
  const FarmerWidget({Key? key, required this.image, required this.name, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
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
                        Text(name!, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
                            fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Icon(Icons.arrow_forward_ios, color: CustomColors.primary,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Divider(
            thickness: 1,
            color: CustomColors.borderField,
          ),
        )
      ],
    );
  }
}
