import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Color? color;
  String textButton;
  CustomButton(this.textButton,{Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10),
        ),
      ),
      child: Text(textButton,
        style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.white, fontSize: 24),),

    );
  }
}
