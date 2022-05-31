import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

String chatDate(String date) {
  initializeDateFormatting();
  DateTime providedDate = DateTime.parse(date);
  int difference = calculateDifference(providedDate);
  if (difference == -1) {
    return "Yesterday";
  } else if (difference == 0) {
    return DateFormat('jm').format(providedDate).toString();
  } else {
    return DateFormat('yMd').format(providedDate).toString();
  }
}

int calculateDifference(DateTime date) {
  DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays;
}
