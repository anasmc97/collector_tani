
import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';

class ButtonHome extends StatelessWidget {
  final String? image;
  final String? title;
  const ButtonHome({Key? key, this.image, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: CustomColors.secondary,
              image: DecorationImage(image: AssetImage(image!),
                ),
              borderRadius: const BorderRadius.all(Radius.circular(20),
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
