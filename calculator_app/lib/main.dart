import 'package:calculator_app/models/model.dart';
import 'package:calculator_app/responsive/responsive_layout.dart';
import 'package:calculator_app/utils/expression_handler.dart';
import 'package:calculator_app/utils/utils.dart';
import 'package:calculator_app/views/home_page.dart';
import 'package:calculator_app/widgets/display_result.dart';
import 'package:calculator_app/widgets/history.dart';
import 'package:calculator_app/widgets/keypad.dart';
import 'package:calculator_app/widgets/transparent_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key} );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.white)),
      home: ResponsiveLayout(mobileBody: HomePage(), desktopApp: DesktopHomePage()),
    );
  }
}

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
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
        calculationHistory.add(
          HistoryItem(
            result: res.toString(),
            expression: resolutionText!,
            date: getCurrentDate(),
          ),
        );
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
  final horizontalPadding = 20.0;

  final verticalPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 1600,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    verticalPadding,
                    horizontalPadding,
                    8.0,
                  ),
                  child: DisplayResult(
                    expression: expressionText,
                    result: resolutionText,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TransparentButton(text: "C", onTap: onClear),
                        SizedBox(width: 8),
                        TransparentButton(text: "CE", onTap: onClearEntry),
                      ],
                    ),
                    HistoryWidget(
                      history: calculationHistory,
                      onClearHistory: onClearHistory,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(horizontalPadding),
                  child: Keypad(
                    onPressed: handleKeypadPress,
                    onCalculate: onCalculate,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}