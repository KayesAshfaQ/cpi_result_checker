import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cpi_result_checker/data/my_routes.dart';
import 'package:cpi_result_checker/screens/information_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
                  onFinished: () => Navigator.pushReplacementNamed(
                    context,
                    MyRoutes.informationScreen,
                  ),
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
