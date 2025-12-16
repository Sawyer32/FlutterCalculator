import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({super.key, required this.text, this.color, this.width, required this.onTap});

  final String text;
  final Color? color;
  final double? width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // GridView controls the child size via constraints; explicit width is ignored.
    // Size text responsively using available constraints.
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize;
    if (screenWidth < 600) {
      fontSize = 20.0;
    } else if (screenWidth < 900) {
      fontSize = 24.0;
    } else if (screenWidth > 1500) {
      fontSize = 99.0;
    } else {
      fontSize = 26.0;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
