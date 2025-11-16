import 'package:flutter/material.dart';

class DisplayResult extends StatelessWidget {
  const DisplayResult({super.key, required this.result, required this.expression});

  final String? result;
  final String? expression;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              expression ?? "123",
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Text(
              result ?? '',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ],
        )
      ),
    );
  }
}
