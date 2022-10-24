import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_tani/core/helper/helper.dart';
import 'package:project_tani/feature/home/presentation/ui/home_page.dart';
import 'package:project_tani/feature/login/presentation/bloc/auth_bloc.dart';
import 'package:project_tani/feature/login/presentation/ui/login_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is AuthDataLoaded){
          Helper.navigator(context, HomePage());
        }else{
          Helper.navigator(context, LoginPage());
        }
      },
      child: Container(),
    );
  }
}
