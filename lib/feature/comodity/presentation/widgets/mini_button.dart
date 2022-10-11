import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';

class MiniButton extends StatelessWidget {
  MiniButton({Key? key, required this.text}) : super(key: key);
  String? text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        alignment: Alignment.center,
        height: 34,
        width: 79,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10),
            ),
            border: Border.all(
                color: CustomColors.borderField!
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.delete_outline_outlined, color: CustomColors.colorsFontSecondary, size: 18,),
            Text(text!,
              style: Theme.of(context).textTheme.headline1!.copyWith(color: CustomColors.colorsFontSecondary, fontSize: 12, fontWeight: FontWeight.w400),),
          ],
        ),

      ),
    );
  }
}
