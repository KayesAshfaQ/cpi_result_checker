import 'package:cpi_result_checker/data/my_colors.dart';
import 'package:cpi_result_checker/widgets/input_feild.dart';
import 'package:flutter/material.dart';
import '';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final rollController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFf2f2f2),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              InputField(
                hint: 'Roll',
                detailHint: '',
                inputType: TextInputType.number,
                controller: rollController,
              ),
              InputField(
                hint: 'Register',
                detailHint: '',
                inputType: TextInputType.number,
                controller: rollController,
              ),
              InputField(
                hint: 'Semester',
                detailHint: '',
                inputType: TextInputType.text,
                controller: rollController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
