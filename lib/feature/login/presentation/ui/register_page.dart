import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_tani/core/helper/helper.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/core/utils/widgets/custom_button.dart';
import 'package:project_tani/core/utils/widgets/custom_text_form_field.dart';
import 'package:project_tani/feature/home/presentation/ui/home_page.dart';
import 'package:project_tani/feature/login/presentation/bloc/auth_bloc.dart';
import 'package:project_tani/feature/login/presentation/ui/login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;
  AuthBloc? _authBloc;
  final _formKey = GlobalKey<FormState>();

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
                  child: Stack(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Icon(Icons.arrow_back_ios)),
                      Center(
                        child: Text('Register',
                          style: Theme.of(context).textTheme.headline1!.copyWith(color: CustomColors.colorsFontHeader),
                        ),
                      ),
                    ],
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
                  child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 32),
                                child: Text('Nama', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.normal, fontSize: 16),
                                  textAlign: TextAlign.start,),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 8),
                                child:
                                TextFormField(
                                  validator: (value){
                                    if(value!.trim().isEmpty){
                                      return 'Please enter your Full Name';
                                    }else{
                                      return null;
                                    }
                                  },
                                  controller: nameController,
                                  decoration: Helper.textFieldStyle(context, hintText: 'Masukkan Nama Lengkap'),
                                )
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 32),
                                child: Text('Email', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.normal, fontSize: 16),
                                  textAlign: TextAlign.start,),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 8),
                                child:
                                TextFormField(
                                  validator: (value) {
                                    if(value!.trim().isEmpty){
                                      return 'Please enter your email address';
                                    }else if(!EmailValidator.validate(value!)){
                                      return 'Please enter a valid email';
                                    }else{
                                      return null;
                                    }
                                  },
                                  controller: emailController,
                                  decoration: Helper.textFieldStyle(context, hintText: 'Masukkan Email'),
                                )
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 32),
                                child: Text('No Telepon', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.normal, fontSize: 16),
                                  textAlign: TextAlign.start,),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 8),
                                child:
                                TextFormField(
                                  validator: (value){
                                    if(value!.trim().isEmpty){
                                      return 'Please enter your Phone Number';
                                    }else{
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.phone,
                                  controller: phoneNumberController,
                                  decoration: Helper.textFieldStyle(context, hintText: 'Masukkan Nomer Handphone'),
                                )
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 32),
                                child: Text('Password', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.normal, fontSize: 16),
                                  textAlign: TextAlign.start,),
                              ),
                              Container(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: TextFormField(
                                    validator: (value){
                                      if(value!.trim().isEmpty){
                                        return 'Please enter your password';
                                      }else{
                                        return null;
                                      }
                                    },
                                    controller: passwordController,
                                    obscureText: isObscure,
                                    decoration: Helper.textFieldStyle(context,
                                        hintText: 'Masukkan Password',
                                      suffixIcon:  GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            isObscure = !isObscure;
                                          });
                                        },
                                          child: Icon( isObscure ? Icons.visibility_off : Icons.visibility))
                                    ),
                                  )
                              ),
                            ],
                          )
                        ),

                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if(state is AuthDataLoaded){
                      Helper.navigator(context, HomePage());
                    }
                  },
                  builder: (context, state) {
                          if (state is AuthLoading){
                          return const Padding(
                            padding: EdgeInsets.only(top: 48),
                            child: Center(child: CircularProgressIndicator(color: CustomColors.primary)),
                          );
                          }else{
                            return Padding(
                                padding: const EdgeInsets.only(top: 48),
                                child: CustomButton('Register', color: CustomColors.buttonColor,
                                  onTap: (){
                                    if(_formKey.currentState?.validate() ?? false){
                                      _authBloc!.add(SignUpEvent(email: emailController.text, password: passwordController.text, name: nameController.text, phoneNumber: phoneNumberController.text ));
                                    }
                                  },
                                )
                            );
                          }
                        },
                      ),
                Container(
                  padding: const EdgeInsets.only(top: 24, bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account ?', style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.normal,
                          color: CustomColors.colorsFontPrimary),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginPage();
                                },
                              ),
                            );
                          },
                          child: Text('Login', style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.normal,
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
