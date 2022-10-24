import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';

class Helper{
  static navigator(BuildContext context, Widget widget) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => widget,
      ),
    );
  }


  static InputDecoration textFieldStyle(BuildContext context,{
    String labelText = "",
    String hintText = "",
    bool isPasswordField = false,
    VoidCallback? onTap,
    bool isObscure = false,
    bool isDateField = false,
    Widget? suffixIcon
  }) {
    return InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(vertical: -10, horizontal: 10),
        hintText: hintText,
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
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.red,
              width: 2
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.red,
              width: 2
          ),
          borderRadius: BorderRadius.circular(10.0),
        )
    );
  }
}




