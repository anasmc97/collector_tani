import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/feature/comodity/domain/entity/fruit.dart';

class SelectedComodityBox extends StatefulWidget {
  final Fruit? fruit;
  final Fruit? selectedFruit;
  const SelectedComodityBox({Key? key, this.fruit, this.selectedFruit})
      : super(key: key);

  @override
  State<SelectedComodityBox> createState() => _SelectedComodityBoxState();
}

class _SelectedComodityBoxState extends State<SelectedComodityBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
            color: identical(widget.selectedFruit, widget.fruit)
                ? CustomColors.primary
                : CustomColors.borderField),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          widget.fruit!.name ?? '',
          style: Theme.of(context).textTheme.headline2!.copyWith(
              color: identical(widget.selectedFruit, widget.fruit)
                  ? CustomColors.primary
                  : CustomColors.colorsFontPrimary),
        ),
      ),
    );
  }
}
