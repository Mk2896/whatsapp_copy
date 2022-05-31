import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

String callDate(String date) {
  initializeDateFormatting();
  DateTime providedDate = DateTime.parse(date);
  int difference = calculateDifference(providedDate);
  if (difference == -1) {
    return "Yesterday, " + DateFormat('jm').format(providedDate).toString();
  } else if (difference == 0) {
    return "Today, " + DateFormat('jm').format(providedDate).toString();
  } else {
    return DateFormat('MMM d, h:mm a').format(providedDate).toString();
  }
}

int calculateDifference(DateTime date) {
  DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays;
}
