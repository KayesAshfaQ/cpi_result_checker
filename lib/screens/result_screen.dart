import 'dart:async';
import 'dart:convert';
import 'package:cpi_result_checker/widgets/result_fail_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../data/my_text.dart';
import '../data/storage_key.dart';
import '../model/result.dart';
import '../utils/toast.dart';
import '../widgets/result_widget.dart';
import '../widgets/search_widget.dart';

import 'package:http/http.dart' as http;

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Result? _result;
  bool _isSearchAnimVisible = true;
  bool _isFailWizVisible = false;
  bool _isSuccessWizVisible = false;

  String _name = '',
      _point = '',
      _roll = '',
      _reg = '',
      _session = '',
      _grade = '';

  @override
  void initState() {
    super.initState();
    checkResult();
    Timer(
      const Duration(seconds: 5),
      () {
        if (_result != null) {
          setState(() {
            _isSearchAnimVisible = false;
            _isSuccessWizVisible = true;
          });
        } else {
          setState(() {
            _isSearchAnimVisible = false;
            _isFailWizVisible = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: [
            Visibility(
              visible: _isSearchAnimVisible,
              child: const SearchAnimationWidget(),
            ),
            Visibility(
              visible: _isSuccessWizVisible,
              child: ResultWidget(
                name: _name,
                point: _point,
                roll: _roll,
                reg: _reg,
                session: _session,
                grade: _grade,
              ),
            ),
            Visibility(
              visible: _isFailWizVisible,
              child: const ResultFailedWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Future<int> checkResult() async {
    var url = Uri.parse(MyText.baseUrl + '/results');

    var body = GetStorage().read(StorageKey.information);

    var response = await http.post(
      url,
      body: jsonEncode(body),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    int responseCode = response.statusCode;
    print(responseCode);

    if (responseCode == 200) {
      _result = Result.fromJson(jsonDecode(response.body));

      //update values
      setState(() {
        _name = _result!.student!.name!;
        _point = _result!.totalPoint!;
        _roll = _result!.student!.roll!.toString();
        _reg = _result!.student!.reg!.toString();
        _session = _result!.student!.session!;
        _grade = _result!.grade!;
      });
    } else {
      FlutterToast.error('Failed to load result!');
      throw Exception('Failed to load result');
    }

    return response.statusCode;
  }
}
