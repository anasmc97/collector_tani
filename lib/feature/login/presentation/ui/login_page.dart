import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/core/utils/widgets/custom_button.dart';
import 'package:project_tani/core/utils/widgets/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 16),
                alignment: Alignment.center,
                child: Text('Login', style: Theme.of(context).textTheme.headline1!.copyWith(color: CustomColors.colorsFontHeader),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 28),
                child: Row(
                  children: [
                    Text('Hi, Welcome Back!', style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/emojione_waving-hand.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Happy to see you again, please login here', style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.normal),
                  textAlign: TextAlign.start,),
              ),
              Container(
                padding: const EdgeInsets.only(top: 32),
                child: Text('Email', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.normal, fontSize: 16),
                  textAlign: TextAlign.start,),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8),
                child: CustomTextFormField(
                  controller: emailController,
                  hintext: 'Enter Your Email',
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 32),
                child: Text('Password', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.normal, fontSize: 16),
                  textAlign: TextAlign.start,),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: CustomTextFormField(
                    controller: passwordController,
                    hintext: 'Enter Your Password',
                    isPasswordField: true,
                  )
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: CustomButton('Login', color: CustomColors.buttonColor,)
              ),
              Container(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have an account ?', style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.normal,
                        color: CustomColors.colorsFontPrimary),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: GestureDetector(
                        onTap: (){},
                        child: Text('Register', style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.normal,
                            color: CustomColors.primary),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

