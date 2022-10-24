import 'package:flutter/material.dart';
import 'package:project_tani/feature/login/data/datasources/auth_remote_datasource.dart';
import 'package:project_tani/feature/login/data/repositories/auth_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_tani/feature/login/domain/usecase/login_usecase.dart';
import 'package:project_tani/feature/login/domain/usecase/sign_up_usecase.dart';
import 'package:project_tani/feature/login/presentation/bloc/auth_bloc.dart';
import 'package:project_tani/feature/login/presentation/ui/login_page.dart';
import 'package:project_tani/feature/login/presentation/ui/register_page.dart';

import 'core/utils/theme.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // FlipperClient flipperClient = FlipperClient.getDefault();
  //
  // flipperClient.addPlugin(FlipperNetworkPlugin(
  //   useHttpOverrides: false,
  // ));
  // flipperClient.start();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      home: BlocProvider(
        create: (context) => AuthBloc(
          LoginUsecase(
            AuthRepositoryImpl(
              remoteDataSource: AuthRemoteDataSourceImpl()
            ),
          ),
          SignUpUsecase(
            AuthRepositoryImpl(
                remoteDataSource: AuthRemoteDataSourceImpl()
            ),
          ),
        ),
        child: LoginPage(),
      ),
    );
  }
}