import 'package:flutter/material.dart';

import 'calc_button.dart';

class Keypad extends StatelessWidget {
  const Keypad ({super.key, required this.onPressed, required this.onCalculate});
  final void Function(String) onPressed;
  final void Function() onCalculate;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        CalcButton(text: "7", onTap: () => onPressed("7")),
        CalcButton(text: "8", onTap: () => onPressed("8")),
        CalcButton(text: "9", onTap: () => onPressed("9")),
        CalcButton(text: "/", onTap: () => onPressed("/"), color: Colors.pinkAccent),

        CalcButton(text: "4", onTap: () => onPressed("4")),
        CalcButton(text: "5", onTap: () => onPressed("5")),
        CalcButton(text: "6", onTap: () => onPressed("6")),
        CalcButton(text: "-", onTap: () => onPressed("-"), color: Colors.pinkAccent),

        CalcButton(text: "1", onTap: () => onPressed("1")),
        CalcButton(text: "2", onTap: () => onPressed("2")),
        CalcButton(text: "3", onTap: () => onPressed("3")),
        CalcButton(text: "x", onTap: () => onPressed("x"), color: Colors.pinkAccent),

        CalcButton(text: ".", onTap: () => onPressed(",")),
        CalcButton(text: "0", onTap: () => onPressed("0")),
        CalcButton(text: "=", onTap: onCalculate),
        CalcButton(text: "+", onTap: () => onPressed("+"), color: Colors.pinkAccent),
      ],
    );
  }
}
