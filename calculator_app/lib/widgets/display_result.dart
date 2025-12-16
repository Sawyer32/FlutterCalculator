import 'package:flutter/material.dart';

class DisplayResult extends StatelessWidget {
  const DisplayResult({super.key, required this.result, required this.expression});

  final String? result;
  final String? expression;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final isSmallScreen = size.width < 600;
    // final expressionFontSize = isSmallScreen ? 40.0 : 48.0;
    // final resultFontSize = isSmallScreen ? 24.0 : 28.0;
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize;
    if (screenWidth < 600) {
      fontSize = 32.0;
    } else if (screenWidth < 900) {
      fontSize = 48.0;
    } else if (screenWidth < 1400) {
      fontSize = 64.0;
    } else if (screenWidth > 1500) {
      fontSize = 99.0;
    } else {
      fontSize = 26.0;
    }
    
    return Align(
        alignment: Alignment.bottomRight,
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (result != null && result!.isNotEmpty) 
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    result!,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              Text(
                expression ?? "0",
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
                ),
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            ]
          )
        )
      );
  }
}
