import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';

class DropDownGrade extends StatefulWidget {
  String? dropDownValue;
  DropDownGrade({Key? key, required this.dropDownValue}) : super(key: key);

  @override
  State<DropDownGrade> createState() => _DropDownGradeState();
}

class _DropDownGradeState extends State<DropDownGrade> {
  final items = ['A', 'B', 'C', 'D'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: const BoxDecoration(
          border: Border.fromBorderSide(
              BorderSide(color: CustomColors.borderField, width: 2)),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: DropdownButton(
              isExpanded: true,
              elevation: 0,
              value: widget.dropDownValue,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: CustomColors.primary,
              ),
              items: items.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  widget.dropDownValue = newValue!;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
