import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? icon;
  const TransparentButton({super.key, required this.text, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fontSize = size.width < 600 ? 24.0 : 32.0;
    if (icon != null) {
      return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Icon(icon),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: Colors.grey[500],
            ),
          ),
        ),
      );
    }
  }
}
