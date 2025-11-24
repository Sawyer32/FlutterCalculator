import 'package:flutter/material.dart';

class DisplayResult extends StatelessWidget {
  const DisplayResult({super.key, required this.result, required this.expression});

  final String? result;
  final String? expression;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fontSize = size.width < 600 ? 32.0 : 40.0;
    
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              expression ?? "123",
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Text(
              result ?? '',
              style: TextStyle(
                fontSize: fontSize,
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
