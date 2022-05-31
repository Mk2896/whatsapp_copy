import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

String statusDate(String date) {
  initializeDateFormatting();
  DateTime providedDate = DateTime.parse(date);
  int difference = calculateDifference(providedDate);
  int differenceInDays = calculateDifference(providedDate, true);
  if (difference == 0) {
    return "Just now";
  } else if (difference < 0 && difference > -60) {
    return difference.abs().toString() + " minute ago";
  } else {
    if (differenceInDays == 0) {
      return "Today, " + DateFormat('h:mm a').format(providedDate).toString();
    } else {
      return "Yesterday, " +
          DateFormat('h:mm a').format(providedDate).toString();
    }
  }
}

int calculateDifference(DateTime date, [bool inDays = false]) {
  DateTime now = DateTime.now();

  if (!inDays) {
    return DateTime(date.year, date.month, date.day, date.hour, date.minute,
            date.second)
        .difference(DateTime(
            now.year, now.month, now.day, now.hour, now.minute, now.second))
        .inMinutes;
  } else {
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }
}
