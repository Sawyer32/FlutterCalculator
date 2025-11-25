import 'package:math_expressions/math_expressions.dart';

num evaluateExpression(String input) {
  input = input.replaceAll("x", "*");

  var parser = GrammarParser();
  Expression exp = parser.parse(input);

  var context = ContextModel();
  var evaluator = RealEvaluator(context);

  num result = evaluator.evaluate(exp);

  if (result.isInfinite) {
    throw Exception("Invalid expression");
  }

  if (result % 1 == 0) {
    return result.toInt();
  } else {
    return result;
  }
}