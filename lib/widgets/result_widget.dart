import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../data/my_colors.dart';
import '../data/my_routes.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Lottie.asset('assets/anim-success.json',
              repeat: false, height: 180, width: 180),
        ),
        const Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Congratulation!',
            style: TextStyle(fontSize: 24, color: MyColors.grey_80),
          ),
        ),
        const SizedBox(height: 4),
        const Align(
          alignment: Alignment.topCenter,
          child: Text(
            'You\'ve passed...',
            style: TextStyle(fontSize: 16, color: MyColors.grey_40),
          ),
        ),
        const SizedBox(height: 12),
        const Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Your obtained point: 3.79',
            style: TextStyle(fontSize: 18, color: MyColors.grey_100_),
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.topCenter,
          child: TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, MyRoutes.informationScreen, (route) => false);
            },
            child: const Text(
              'Check again',
              style: TextStyle(
                fontSize: 14,
                color: MyColors.main,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
