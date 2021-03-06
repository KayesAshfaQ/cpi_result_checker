import 'dart:convert';

import 'package:cpi_result_checker/data/my_colors.dart';
import 'package:cpi_result_checker/data/my_lists.dart';
import 'package:cpi_result_checker/data/my_styles.dart';
import 'package:cpi_result_checker/data/storage_key.dart';
import 'package:cpi_result_checker/model/result.dart';
import 'package:cpi_result_checker/widgets/drop_down_container.dart';
import 'package:cpi_result_checker/widgets/input_feild.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../data/my_routes.dart';
import '../data/my_text.dart';
import '../utils/toast.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final box = GetStorage();

  Map departmentMap = {};
  List<String> departmentKeys = [];
  List<String> semesterKeys = [];

  final _rollController = TextEditingController();
  final _regController = TextEditingController();

  String? _semester;
  String? _department;

  bool isRollValid = true;
  bool isRegValid = true;
  bool isSemesterValid = true;
  bool isDeptValid = true;

  @override
  void initState() {
    super.initState();
    departmentMap = box.read(StorageKey.departments);
    departmentKeys = departmentMap.keys.toList().cast<String>();
    semesterKeys = MyLists.semesters.keys.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(color: Colors.white),
      ),
      backgroundColor: MyColors.grey_5,
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: Center(
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
                errorText: isRollValid ? null : 'roll can\'t be empty',
              ),
              InputField(
                hint: 'Registration_',
                detailHint: 'Enter your registration number',
                inputType: TextInputType.number,
                controller: _regController,
                errorText: isRegValid ? null : 'registration can\'t be empty',
              ),
              DropDownContainer(
                hint: 'Semester_',
                dropDown: DropdownButton<String>(
                  isExpanded: true,
                  value: _semester,
                  items: semesterKeys.map(buildMenuItem).toList(),
                  onChanged: (String? value) =>
                      setState(() => _semester = value!),
                  hint: Text(
                    'Choose your semester',
                    style: MyStyles.hintStyle(context),
                  ),
                ),
                errorText: isSemesterValid ? null : 'semester can\'t be empty',
              ),
              DropDownContainer(
                hint: 'Department_',
                dropDown: DropdownButton<String>(
                  isExpanded: true,
                  value: _department,
                  items: departmentKeys.map(buildMenuItem).toList(),
                  onChanged: (String? value) =>
                      setState(() => _department = value!),
                  hint: Text(
                    'Choose your department',
                    style: MyStyles.hintStyle(context),
                  ),
                ),
                errorText: isDeptValid ? null : 'department can\'t be empty',
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
  void onCheckResult() async {
    if (validate()) {

      Map<String, String> infoMap = {
        'roll': _rollController.text.toString(),
        'reg': _regController.text.toString(),
        'department_id': departmentMap[_department].toString(),
        'semester_id': MyLists.semesters[_semester].toString(),
      };

      box.write(StorageKey.information, infoMap).whenComplete(
            () => Navigator.pushNamed(context, MyRoutes.resultScreen),
          );
    }
  }

  bool validate() {
    String? roll = _rollController.text.toString();
    String? reg = _regController.text.toString();

    //validate user inputs
    if (roll.isEmpty) {
      setState(() => isRollValid = false);
    } else {
      setState(() => isRollValid = true);
    }

    if (reg.isEmpty) {
      setState(() => isRegValid = false);
    } else {
      setState(() => isRegValid = true);
    }

    if (_semester == null) {
      setState(() => isSemesterValid = false);
    } else {
      setState(() => isSemesterValid = true);
    }

    if (_department == null) {
      setState(() => isDeptValid = false);
    } else {
      setState(() => isDeptValid = true);
    }

    return isRollValid && isRegValid && isSemesterValid && isDeptValid;
  }
}
