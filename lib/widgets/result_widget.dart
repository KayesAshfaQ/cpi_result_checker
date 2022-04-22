import 'package:cpi_result_checker/data/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../data/my_colors.dart';
import '../data/my_routes.dart';

class ResultWidget extends StatelessWidget {
  ResultWidget({
    Key? key,
    required this.name,
    required this.point,
    required this.roll,
    required this.reg,
    required this.session,
    required this.grade,
  }) : super(key: key);

  String name, point, roll, reg, session, grade;

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
            style: TextStyle(fontSize: 16, color: MyColors.grey_60),
          ),
        ),
        const SizedBox(height: 30),
        Table(
          //border: TableBorder.symmetric(inside: Border.symmetric(horizontal: BorderSide.lerp(TextAlignVertical.bottom, b, t))),
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(4),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(4),
          },
          children: [
            tableRow(title: 'Name', value: name),
            tableRow(title: 'Roll', value: roll),
            tableRow(title: 'Registration', value: reg),
            tableRow(title: 'Session', value: session),
            tableRow(title: 'Grade', value: grade),
            tableRow(title: 'Point', value: point),
          ],
        ),
        const SizedBox(height: 20),
        /* Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Your obtained point: $point',
            style: const TextStyle(fontSize: 18, color: MyColors.grey_100_),
          ),
        ),
        const SizedBox(height: 8),*/
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
                fontFamily: 'Orbitron',
                fontSize: 13,
                color: MyColors.accentDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  TableRow tableRow({required String title, required String value}) {
    return TableRow(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(
            title,
            style: MyStyles.resultRow,
          ),
        ),
        const Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 24,
            child: Text(
              ':',
              style: MyStyles.resultRow,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: MyColors.grey_80,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
