import 'package:cpi_result_checker/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CPI Result Checker',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const SplashScreen(),
    );
  }
}
