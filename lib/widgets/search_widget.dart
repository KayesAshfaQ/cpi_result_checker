import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchAnimationWidget extends StatelessWidget {
  const SearchAnimationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          'assets/anim-search.json',
        ),
        DefaultTextStyle(
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'Orbitron',
            color: Color(0xFF0e607b),
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            isRepeatingAnimation: true,
            animatedTexts: [
              TyperAnimatedText(
                'searching_',
                speed: const Duration(milliseconds: 90),
              ),
            ],
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      ],
    );
  }
}
