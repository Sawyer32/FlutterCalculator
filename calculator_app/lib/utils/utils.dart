import 'package:intl/intl.dart';

String getCurrentDate() {
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');

  final String formatted = formatter.format(DateTime.now());

  return formatted;
}