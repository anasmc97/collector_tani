import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';

class CustomButton extends StatelessWidget {
  Color? color;
  String textButton;
  Function()? onTap;
  Color? fontColor;
  Color? borderColor;
  CustomButton(this.textButton,{Key? key, this.color, this.onTap, this.fontColor = Colors.white, this.borderColor = CustomColors.buttonColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10),
          ),
          border: Border.all(
            color: borderColor!
          )
        ),
        child: Text(textButton,
          style: Theme.of(context).textTheme.headline1!.copyWith(color: fontColor, fontSize: 24, fontWeight: FontWeight.w500),),

      ),
    );
  }
}
