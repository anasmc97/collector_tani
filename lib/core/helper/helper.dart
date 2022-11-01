import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';
enum ViewDialogsAction { yes, no }
class Helper{
  static navigator(BuildContext context, Widget widget) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  static navigatorPushAndReplacement(BuildContext context, Widget widget) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return widget;
        }));
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

  static Future<ViewDialogsAction> yesOrNoDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(ViewDialogsAction.no),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(ViewDialogsAction.yes),
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : ViewDialogsAction.no;
  }
}




