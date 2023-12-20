import 'package:danetki_flutter/router.dart';
import 'package:danetki_flutter/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeLight,
      // home: const MainScreen(),
      routes: routes,
    );
  }
}
