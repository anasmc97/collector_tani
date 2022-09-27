import 'package:flutter/material.dart';
import 'package:project_tani/feature/login/presentation/ui/login_page.dart';

import 'core/utils/theme.dart';
import 'feature/home/presentation/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      home: LoginPage(),
    );
  }
}