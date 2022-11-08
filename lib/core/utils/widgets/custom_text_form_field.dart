import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_tani/core/utils/shared_value.dart';

class CustomTextFormField extends StatefulWidget {
  TextEditingController? controller;
  String? hintext;
  bool? isPasswordField;
  bool? isDateField;
  bool? isNumber;
  String? Function(String?)? validator;
  CustomTextFormField(
      {Key? key,
      this.controller,
      this.hintext,
      this.isPasswordField = false,
      this.isDateField = false,
      this.isNumber,
      this.validator})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscure;
  late bool isPasswordField;
  late bool isDateField;
  bool? isNumber;
  TextEditingController? controller;
  String? hintext;
  String? Function(String?)? validator;
  @override
  void initState() {
    isObscure = widget.isPasswordField!;
    isPasswordField = widget.isPasswordField!;
    isDateField = widget.isDateField!;
    controller = widget.controller;
    hintext = widget.hintext;
    isNumber = widget.isNumber;
    validator = widget.validator;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: isNumber != null ? TextInputType.number : null,
      obscureText: isObscure,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: isPasswordField
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child:
                      Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                )
              : isDateField
                  ? GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          String formattedDate = DateFormat('yyyy-MM-dd').format(
                              pickedDate); //formatted date output using intl package =>  2021-03-16
                          setState(
                            () {
                              controller!.text =
                                  formattedDate; //set output date to TextField value.
                            },
                          );
                        } else {}
                      },
                      child: const Icon(
                        Icons.calendar_today_outlined,
                        color: CustomColors.primary,
                        size: 17,
                      ),
                    )
                  : null,
          contentPadding:
              const EdgeInsets.symmetric(vertical: -10, horizontal: 10),
          hintText: hintext,
          hintStyle: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(fontWeight: FontWeight.normal, fontSize: 12),
          hoverColor: CustomColors.borderField,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: CustomColors.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: CustomColors.borderField, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
  }
}
