import 'package:flutter/material.dart';

import 'core/utils/theme.dart';
import 'feature/home/presentation/ui/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      home: const HomePage(),
    );
  }
}