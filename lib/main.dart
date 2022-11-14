import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flipperkit/flutter_flipperkit.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:project_tani/feature/Farmer/presentation/farmer_bloc/farmer_bloc.dart';
import 'package:project_tani/feature/comodity/presentation/bloc/comodity_bloc.dart';
import 'package:project_tani/feature/login/presentation/bloc/auth_bloc.dart';
import 'package:project_tani/feature/login/presentation/ui/login_page.dart';
import 'package:project_tani/feature/transaction/presentation/bloc/customer_transaction_bloc/customer_transaction_bloc.dart';
import 'package:project_tani/feature/transaction/presentation/bloc/farmer_transaction_bloc/farmer_transaction_bloc.dart';
import 'package:project_tani/injection_container.dart';
import 'injection_container.dart' as di;

import 'core/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlipperClient flipperClient = FlipperClient.getDefault();
  flipperClient.addPlugin(FlipperNetworkPlugin());
  flipperClient.addPlugin(FlipperSharedPreferencesPlugin());
  flipperClient.start();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthBloc>()..add(AutoLoginEvent())),
        BlocProvider(create: (_) => sl<FarmerBloc>()),
        BlocProvider(create: (_) => sl<ComodityBloc>()),
        BlocProvider(create: (_) => sl<FarmerTransactionBloc>()),
        BlocProvider(create: (_) => sl<CustomerTransactionBloc>()),
      ],
      child: OverlaySupport.global(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: CustomTheme.lightTheme,
          home: LoginPage(),
        ),
      ),
    );
  }
}
