import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? icon;
  const TransparentButton({super.key, required this.text, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
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
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.grey[500],
            ),
          ),
        ),
      );
    }
  }
}
