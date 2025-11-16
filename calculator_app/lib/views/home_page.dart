import 'package:calculator_app/widgets/display_result.dart';
import 'package:calculator_app/widgets/keypad.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String expressionText = "0";
  String? resolutionText;

  void handleKeypadPress(String value) {
    setState(() {
      if (value == "=") {
        expressionText = "0";
      } else {
        if (expressionText == "0") {
          expressionText = value;
        } else {
          expressionText += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              DisplayResult(expression: expressionText, result: resolutionText,),
              Keypad(onPressed: handleKeypadPress,)
            ],
          )
      );
  }
}
