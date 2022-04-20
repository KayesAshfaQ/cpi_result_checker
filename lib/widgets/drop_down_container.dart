import 'package:cpi_result_checker/data/my_colors.dart';
import 'package:cpi_result_checker/widgets/error_text.dart';
import 'package:flutter/material.dart';

class DropDownContainer extends StatelessWidget {
  DropDownContainer({
    Key? key,
    required this.hint,
    required this.dropDown,
    required this.errorText,
  }) : super(key: key);

  final String hint;
  Widget dropDown;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint,
          style: const TextStyle(
            fontFamily: 'Orbitron',
            color: MyColors.main,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          height: 45,
          margin: const EdgeInsets.only(top: 4),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: DropdownButtonHideUnderline(
            child: dropDown,
          ),
        ),
        Visibility(
          visible: errorText == null ? false : true,
          child: ErrorText(error: errorText ?? ''),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
