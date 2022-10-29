import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_tani/core/helper/helper.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/core/utils/widgets/custom_button.dart';
import 'package:project_tani/core/utils/widgets/custom_text_form_field.dart';
import 'package:project_tani/feature/home/presentation/ui/home_page.dart';
import 'package:project_tani/feature/login/presentation/bloc/auth_bloc.dart';
import 'package:project_tani/feature/login/presentation/ui/register_page.dart';
import 'package:project_tani/injection_container.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  AuthBloc? _authBloc;

  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                Form(
                    key: _formKey,
                  child: Builder(
                    builder: (context){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              validator: (value) {
                                if(value!.trim().isEmpty){
                                  return 'Please enter your email address';
                                }else if(!EmailValidator.validate(value!)){
                                  return 'Please enter a valid email';
                                }else{
                                  return null;
                                }
                              } ,
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
                                validator: (value){
                                  if(value!.trim().isEmpty){
                                    return 'Please enter your password';
                                  }else{
                                    return null;
                                  }
                                },
                              )
                          ),
                        ],
                      );
                    },
                  )
                ),
                
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if(state is AuthDataLoaded){
                      Helper.navigator(context, BlocProvider(
                      create: (context) => sl<AuthBloc>(),
                      child: HomePage(authModel: state.authModel,),
                    ));
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading){
                      return const Padding(
                        padding: EdgeInsets.only(top: 48.0),
                        child: Center(child: CircularProgressIndicator(color: CustomColors.primary)),
                      );
                    }else{
                      return Padding(
                        padding: const EdgeInsets.only(top: 48),
                        child: CustomButton('Login', color: CustomColors.buttonColor,
                          onTap: (){
                            if(_formKey.currentState?.validate() ?? false){
                              _authBloc!.add(LoginEvent(email: emailController.text, password: passwordController.text));
                            }
                          },
                        ),
                      );
                    }

                  },
                ),
                Container(
                  padding: const EdgeInsets.only(top: 24, bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don’t have an account ?', style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.normal,
                          color: CustomColors.colorsFontPrimary),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: GestureDetector(
                          onTap: (){
                            Helper.navigator(context, BlocProvider(
                              create: (context) => sl<AuthBloc>(),
                              child: RegisterPage(),
                            ));
                          },
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
      ),
    );
  }
}

