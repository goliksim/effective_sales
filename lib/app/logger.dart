import 'dart:developer' as dev;
import 'package:intl/intl.dart';

Logs logger = Logs();

class Logs {
  Future<String> formatLog(String text) async {
    DateTime date = DateTime.now();
    String finalDateString = '${DateFormat.yMd().format(date)} ${DateFormat.jms().format(date)}\t';

    return finalDateString + text;
  }

  Future<void> log(String text) async {
    final finalString = await formatLog(text);
    dev.log(finalString);
  }

  Future<void> fine(String text) async {
    final finalString = await formatLog(text);
    dev.log('\u001b[1;32m $finalString');
  }

  Future<void> warning(String text) async {
    final finalString = await formatLog(text);
    dev.log('\u001b[1;31m $finalString');
  }
}
