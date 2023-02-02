import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reminders_app/app/reminder.dart';
import 'package:reminders_app/utils/utils.dart';

class ViewReminder extends StatelessWidget {
  final Reminder reminder;

  const ViewReminder({super.key, required this.reminder});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        Text(
          reminder.title,
          style: Theme.of(context).textTheme.titleLarge,
        ).padding(bottom: 12),
        Text(
          "${DateFormat.yMd().format(reminder.when)} ${DateFormat.jm().format(reminder.when)}",
          style: Theme.of(context).textTheme.labelMedium,
        ).padding(bottom: 12),
        Text(reminder.body ?? "<No description>")
      ].column(crossAxisAlignment: CrossAxisAlignment.start).padding(all: 20),
    );
  }
}