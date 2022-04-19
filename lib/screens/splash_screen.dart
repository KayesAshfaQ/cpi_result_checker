import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cpi_result_checker/screens/information_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                onFinished: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FormScreen(),
                    ),
                  );
                },
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
