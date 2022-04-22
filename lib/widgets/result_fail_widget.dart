import 'package:cpi_result_checker/data/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../data/my_routes.dart';

class ResultFailedWidget extends StatelessWidget {
  const ResultFailedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Lottie.asset('assets/anim-fail.json',
              repeat: false, height: 180, width: 180),
        ),
        const Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Sorry!',
            style: TextStyle(fontSize: 24, color: MyColors.grey_80),
          ),
        ),
        const SizedBox(height: 4),
        const Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Result not available...',
            style: TextStyle(fontSize: 16, color: MyColors.grey_60),
          ),
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.topCenter,
          child: TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, MyRoutes.informationScreen, (route) => false);
            },
            child: const Text(
              'Try again',
              style: TextStyle(
                fontFamily: 'Orbitron',
                fontSize: 13,
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
