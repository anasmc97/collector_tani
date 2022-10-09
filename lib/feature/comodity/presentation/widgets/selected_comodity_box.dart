import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';

class SelectedComodityBox extends StatefulWidget {
  final String? comodityName;
  const SelectedComodityBox({Key? key, this.comodityName}) : super(key: key);

  @override
  State<SelectedComodityBox> createState() => _SelectedComodityBoxState();
}

class _SelectedComodityBoxState extends State<SelectedComodityBox> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        alignment: Alignment.centerLeft,
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10),
          ),
          border: Border.all(
              color: _isSelected ? CustomColors.primary :CustomColors.borderField
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(widget.comodityName!, style: Theme.of(context).textTheme.headline2!.copyWith(color: _isSelected ? CustomColors.primary: CustomColors.colorsFontPrimary),
          ),
        ),
      ),
    );
  }
}
