import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';


class CustomTextFormField extends StatefulWidget {
  TextEditingController? controller;
  String? hintext;
  bool? isPasswordField;
  CustomTextFormField({Key? key, this.controller, this.hintext, this.isPasswordField = false}) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscure;
  late bool isPasswordField;
  TextEditingController? controller;
  String? hintext;
  @override
  void initState() {
    isObscure = widget.isPasswordField!;
    isPasswordField = widget.isPasswordField!;
    controller = widget.controller;
    hintext = widget.hintext;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure!,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPasswordField ? GestureDetector(
            onTap: (){
              setState(() {
                isObscure = !isObscure;
              });
            },
            child: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
        ) : null,
        hintText: hintext,
        hintStyle: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.normal, fontSize: 12),
        hoverColor: CustomColors.borderField,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: CustomColors.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: CustomColors.borderField,
              width: 2
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

