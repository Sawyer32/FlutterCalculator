import 'package:calculator_app/utils/expression_handler.dart';
import 'package:calculator_app/utils/utils.dart';
import 'package:calculator_app/widgets/display_result.dart';
import 'package:calculator_app/widgets/history.dart';
import 'package:calculator_app/widgets/keypad.dart';
import 'package:calculator_app/widgets/transparent_button.dart';
import 'package:flutter/material.dart';

import '../models/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String expressionText = "0";
  String? resolutionText;
  bool calculated = false;
  bool isHistoryOpen = false;
  List<HistoryItem> calculationHistory = [];

  void handleKeypadPress(String value) {
    setState(() {
      if (expressionText == "0" || calculated) {
        expressionText = value;
        calculated = false;
        resolutionText = null;
      } else {
        expressionText += value;
      }
    });
  }

  void onCalculate() {
    String expression = expressionText;
    try {
      num res = evaluateExpression(expressionText);
      setState(() {
        expressionText = res.toString();
        resolutionText = expression;
        calculated = true;
        calculationHistory.add(HistoryItem(result: res.toString(), expression: resolutionText!, date: getCurrentDate()));
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

  void onClearHistory() {
    setState(() {
      calculationHistory.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                DisplayResult(expression: expressionText, result: resolutionText,),
                Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TransparentButton(text: "C", onTap: onClear ),
                        TransparentButton(text: "CE", onTap: onClearEntry ),
                      ],
                    ),
                    HistoryWidget(history: calculationHistory, onClearHistory: onClearHistory,)
                  ],
                ),
                Keypad(onPressed: handleKeypadPress, onCalculate: onCalculate,)
              ],
            )
        ),
    ],
    );
  }
}
