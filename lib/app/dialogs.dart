import 'package:flutter/material.dart';

Future<bool> confirmDeleteDialog(BuildContext context) async {
  bool ret = false;

  final confirm = TextButton(
      onPressed: () {
        ret = true;
        Navigator.of(context).pop();
      },
      child: const Text("Confirm"));

  final cancel = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text("Cancel"));
  final dialog = AlertDialog(
    title: const Text("Delete Reminder"),
    content: const Text("Please confirm you'd like to delete this reminder."),
    actions: [cancel, confirm],
  );

  await showDialog(
    context: context,
    builder: (context) => dialog,
  );

  return ret;
}
