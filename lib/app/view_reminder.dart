import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reminders_app/app/reminder.dart';
import 'package:reminders_app/utils/utils.dart';

class ViewReminder extends StatelessWidget {
  final Reminder reminder;
  final void Function()? onDeletePressed;

  const ViewReminder({super.key, required this.reminder, this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(reminder.title),
        automaticallyImplyLeading: false,
      ),
      body: <Widget>[
        Text(
          "${DateFormat.yMd().format(reminder.when)} ${DateFormat.jm().format(reminder.when)}",
          style: Theme.of(context).textTheme.labelMedium,
        ).padding(bottom: 12),
        Text(reminder.body ?? "<No description>")
      ].column(crossAxisAlignment: CrossAxisAlignment.start).padding(all: 20),
      bottomNavigationBar: (onDeletePressed != null)
          ? TextButton(
                  onPressed: onDeletePressed,
                  child: const Text("Delete Reminder"))
              .padding(all: 20)
          : null,
    );
  }
}
