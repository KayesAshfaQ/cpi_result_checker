import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  ErrorText({Key? key, required this.error}) : super(key: key);

  String error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            error,
            style: const TextStyle(
              color: Colors.red,
              fontFamily: 'Orbitron',
              fontSize: 10,
            ),
          ),
          const SizedBox(width: 2),
          const Icon(Icons.error_outline, color: Colors.red, size: 15),
        ],
      ),
    );
  }
}
