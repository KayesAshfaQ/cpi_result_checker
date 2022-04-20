import 'package:cpi_result_checker/data/my_colors.dart';
import 'package:cpi_result_checker/data/my_lists.dart';
import 'package:cpi_result_checker/data/my_styles.dart';
import 'package:cpi_result_checker/screens/result_screen.dart';
import 'package:cpi_result_checker/widgets/drop_down_container.dart';
import 'package:cpi_result_checker/widgets/input_feild.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _rollController = TextEditingController();
  final _regController = TextEditingController();

  String? _semester;
  String? _department;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFf2f2f2),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(28),
            shrinkWrap: true,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/find.png', width: 80, height: 100),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Fill-up the form\nto find your result_',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: MyColors.main,
                    fontFamily: 'Orbitron',
                    fontSize: 18,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InputField(
                hint: 'Roll_',
                detailHint: 'Enter your roll number',
                inputType: TextInputType.number,
                controller: _rollController,
                validator: (value) => validate(value, 'roll can\'t be empty'),
              ),
              InputField(
                hint: 'Registration_',
                detailHint: 'Enter your registration number',
                inputType: TextInputType.number,
                controller: _regController,
                validator: (value) =>
                    validate(value, 'registration can\'t be empty'),
              ),
              DropDownContainer(
                hint: 'Semester_',
                dropDown: DropdownButtonFormField<String>(
                  isExpanded: true,
                  value: _semester,
                  items: MyLists.semesters.map(buildMenuItem).toList(),
                  onChanged: (String? value) =>
                      setState(() => _semester = value!),
                  hint: Text(
                    'Choose your semester',
                    style: MyStyles.hintStyle(context),
                  ),
                  decoration: MyStyles.noUnderline,
                  validator: (value) =>
                      validate(value, 'semester can\'t be empty'),
                ),
              ),
              DropDownContainer(
                hint: 'Department_',
                dropDown: DropdownButtonFormField<String>(
                  isExpanded: true,
                  value: _department,
                  items: MyLists.departments.map(buildMenuItem).toList(),
                  onChanged: (String? value) =>
                      setState(() => _department = value!),
                  hint: Text(
                    'Choose your department',
                    style: MyStyles.hintStyle(context),
                  ),
                  //decoration: MyStyles.noUnderline,
                  validator: (value) =>
                      validate(value, 'department can\'t be empty'),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => onCheckResult(),
                child: const Text(
                  'CHECK_result',
                  style: TextStyle(
                    fontFamily: 'Orbitron',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MyColors.main),
                  minimumSize: MaterialStateProperty.all(
                    const Size.fromHeight(38),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //validate all user inputs
  String? validate(String? value, message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }

  //drop down item builder
  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
    );
  }

  //on button pressed
  void onCheckResult() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ResultScreen(),
        ),
      );
    }
  }
}
