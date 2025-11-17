import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const TransparentButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
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
