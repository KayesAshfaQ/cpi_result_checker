import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/result_widget.dart';
import '../widgets/search_widget.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _isSearchAnimVisible = true;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () {
        //get auth token from cached
        setState(() {
          _isSearchAnimVisible = false;
        });
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
              visible: !_isSearchAnimVisible,
              child: const ResultWidget(),
            )
          ],
        ),
      ),
    );
  }
}
