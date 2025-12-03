import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? icon;
  const TransparentButton({super.key, required this.text, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize;
    if (screenWidth < 600) {
      fontSize = 32.0;
    } else if (screenWidth < 900) {
      fontSize = 48.0;
    } else if (screenWidth < 1400) {
      fontSize = 48.0;
    } else if (screenWidth > 1500) {
      fontSize = 99.0;
    } else {
      fontSize = 26.0;
    }
    final iconSize = fontSize;
    final padding = fontSize / 4;

    if (icon != null) {
      return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Icon(icon, size: iconSize, color: Colors.grey[700]),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ),
      );
    }
  }
}
