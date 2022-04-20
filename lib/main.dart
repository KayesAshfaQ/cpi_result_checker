import 'package:cpi_result_checker/data/my_routes.dart';
import 'package:cpi_result_checker/screens/information_screen.dart';
import 'package:cpi_result_checker/screens/result_screen.dart';
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
      routes: {
        MyRoutes.splashScreen: (context) => const SplashScreen(),
        MyRoutes.informationScreen: (context) => const InformationScreen(),
        MyRoutes.resultScreen: (context) => const ResultScreen(),
      },
      initialRoute: MyRoutes.splashScreen,
    );
  }
}
