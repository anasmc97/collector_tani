
import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';

class ButtonHome extends StatelessWidget {
  final String? image;
  final String? title;
  final Function()? onTap;
  const ButtonHome({Key? key, this.image, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
              width: 51,
              height: 51,
              decoration: BoxDecoration(
                color: CustomColors.primary.withOpacity(0.1),
                image: DecorationImage(image: AssetImage(image!),
                  ),
                borderRadius: const BorderRadius.all(Radius.circular(10),
                ),
              ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(title!, style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
