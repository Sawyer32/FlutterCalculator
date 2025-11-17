import 'package:math_expressions/math_expressions.dart';

double evaluateExpression(String expression) {
  expression = expression.replaceAll("x", "*");

  var parser = GrammarParser();
  Expression exp = parser.parse(expression);

  var context = ContextModel();
  var evaluator = RealEvaluator(context);

  num result = evaluator.evaluate(exp);

  if (result.isInfinite) {
    throw new Exception("Invalid expression");
  }

  return result.toDouble();
}