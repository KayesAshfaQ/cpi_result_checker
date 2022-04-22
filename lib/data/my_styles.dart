import 'package:flutter/material.dart';
import 'my_colors.dart';

class MyStyles {
  static TextStyle hintStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyText2!.copyWith(color: MyColors.grey_40);

  static const noUnderline = InputDecoration(border: InputBorder.none);

  static const resultRow = TextStyle(
      fontFamily: 'Orbitron',
      color: MyColors.main,
      fontWeight: FontWeight.w600,
      fontSize: 16
  );
}
