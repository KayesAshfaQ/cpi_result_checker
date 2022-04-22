import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cpi_result_checker/data/my_routes.dart';
import 'package:cpi_result_checker/data/my_text.dart';
import 'package:cpi_result_checker/model/department.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

import '../utils/toast.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Department> _departments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(28),
          shrinkWrap: true,
          children: [
            Center(
              child: Lottie.asset(
                'assets/anim-exams.json',
                height: 320,
                width: 320,
              ),
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              width: 250.0,
              height: 100,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'Orbitron',
                  color: Color(0xFF0e607b),
                ),
                child: AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'CPI\nResult Checker',
                      speed: const Duration(milliseconds: 170),
                    ),
                  ],
                  onFinished: () => onTxtAnimFinish(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getDepartments();
  }

  void getDepartments() async {
    var url = Uri.parse(MyText.baseUrl + '/departments');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      _departments =
          List<Department>.from(l.map((model) => Department.fromJson(model)));
    } else {
      FlutterToast.error('Failed to load departments!');
      throw Exception('Failed to load departments');
    }
  }

  void onTxtAnimFinish() {
    if (_departments.isNotEmpty) {
      Navigator.pushReplacementNamed(
        context,
        MyRoutes.informationScreen,
      );
    } else {
      FlutterToast.create(
          'Failed to load departments!\nServer issue, try again later!');
    }
  }
}
