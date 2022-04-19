import 'package:cpi_result_checker/data/my_colors.dart';
import 'package:cpi_result_checker/data/my_lists.dart';
import 'package:cpi_result_checker/widgets/drop_down_container.dart';
import 'package:cpi_result_checker/widgets/input_feild.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final rollController = TextEditingController();
  final regController = TextEditingController();

  String? semester;
  String? department;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFf2f2f2),
      body: Center(
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
              controller: rollController,
            ),
            InputField(
              hint: 'Registration_',
              detailHint: 'Enter your registration number',
              inputType: TextInputType.number,
              controller: regController,
            ),
            DropDownContainer(
              hint: 'Semester_',
              dropDown: DropdownButton<String>(
                isExpanded: true,
                value: semester,
                items: MyLists.semesters.map(buildMenuItem).toList(),
                onChanged: (String? value) => setState(() => semester = value!),
                hint: Text(
                  'Choose your semester',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: MyColors.grey_40),
                ),
              ),
            ),
            DropDownContainer(
              hint: 'Department_',
              dropDown: DropdownButton<String>(
                isExpanded: true,
                value: department,
                items: MyLists.departments.map(buildMenuItem).toList(),
                onChanged: (String? value) =>
                    setState(() => department = value!),
                hint: Text(
                  'Choose your department',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: MyColors.grey_40),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
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
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
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
