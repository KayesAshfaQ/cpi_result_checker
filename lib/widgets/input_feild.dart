import 'package:cpi_result_checker/data/my_colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({
    Key? key,
    required this.hint,
    required this.detailHint,
    required this.inputType,
    required this.controller,
  }) : super(key: key);

  String hint, detailHint;
  TextInputType inputType;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hint, style: TextStyle(color: MyColors.grey_40)),
        Container(
          height: 45,
          margin: const EdgeInsets.only(top: 2, bottom: 15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            maxLines: 1,
            controller: controller,
            keyboardType: inputType,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(-12),
              border: InputBorder.none,
              hintText: detailHint,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: MyColors.grey_40),
            ),
          ),
        ),
      ],
    );
  }
}
