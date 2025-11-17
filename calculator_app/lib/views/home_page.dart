import 'dart:io';

import 'package:calculator_app/utils/expression_handler.dart';
import 'package:calculator_app/widgets/display_result.dart';
import 'package:calculator_app/widgets/keypad.dart';
import 'package:calculator_app/widgets/transparent_button.dart';
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
      if (expressionText == "0") {
        expressionText = value;
      } else {
        expressionText += value;
      }
    });
  }

  void onCalculate() {
    String expression = expressionText;
    try {
      double res = evaluateExpression(expressionText);
      setState(() {
        expressionText = res.toString();
        resolutionText = expression;
      });
    } catch (e) {
      setState(() {
        expressionText = "";
        resolutionText = "Ogiltigt uttryck";
      });
    }
  }

  void onClear() {
    setState(() {
      expressionText = "0";
      resolutionText = null;
    });
  }

  void onClearEntry() {
    setState(() {
      if (expressionText.length > 1) {
        expressionText = expressionText.substring(0, expressionText.length - 1);
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
              Row(
                spacing: 20,
                children: [
                  TransparentButton(text: "C", onTap: onClear ),
                  TransparentButton(text: "CE", onTap: onClearEntry ),
                ],
              ),
              Keypad(onPressed: handleKeypadPress, onCalculate: onCalculate,)
            ],
          )
      );
  }
}
