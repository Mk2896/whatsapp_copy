import 'package:flutter/material.dart';

Widget circularNotification(
    {required int count,
    required BuildContext context,
    Color? backgroundColor,
    Color? textColor}) {
  return CircleAvatar(
    backgroundColor: backgroundColor ?? Theme.of(context).primaryColorLight,
    child: Text(
      count.toString(),
      style: TextStyle(
        fontSize: 12,
        color: textColor ?? Colors.white,
      ),
    ),
    radius: 10,
  );
}
