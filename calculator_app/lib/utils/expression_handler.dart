import 'package:math_expressions/math_expressions.dart';

num evaluateExpression(String expression) {
  expression = expression.replaceAll("x", "*");

  var parser = GrammarParser();
  Expression exp = parser.parse(expression);

  var context = ContextModel();
  var evaluator = RealEvaluator(context);

  num result = evaluator.evaluate(exp);

  if (result.isInfinite) {
    throw new Exception("Invalid expression");
  }

  if (result % 1 == 0) {
    return result.toInt();
  } else {
    return result;
  }
}