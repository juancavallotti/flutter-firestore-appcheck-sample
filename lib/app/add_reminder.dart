import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reminders_app/app/add_reminder_state.dart';
import 'package:reminders_app/utils/utils.dart';

class AddReminder extends StatelessWidget {
  const AddReminder({super.key});

  @override
  Widget build(BuildContext context) {
    const formPadding = 12.0;

    return BlocBuilder<AddReminderCubit, EditReminderState>(
        builder: (context, state) {
      final cubit = context.read<AddReminderCubit>();
      return Scaffold(
        appBar: AppBar(
          title: const Text("Add a Reminder"),
          automaticallyImplyLeading: false,
        ),
        body: <Widget>[
          Text(
            "Title",
            style: Theme.of(context).textTheme.labelLarge,
          ).padding(top: formPadding),
          TextFormField(
            initialValue: state.title,
            onChanged: (value) => cubit.updateField(title: value),
          ).padding(left: formPadding, right: formPadding),
          Text("When?", style: Theme.of(context).textTheme.labelLarge)
              .padding(top: formPadding),
          TextButton(
            child: state.when == null
                ? const Text("Select...")
                : Text(
                    "${DateFormat.yMd().format(state.when!)} ${DateFormat.jm().format(state.when!)}"),
            onPressed: () {
              _dateAndTimePicker(context,
                  initialDateTime: state.when,
                  onSelect: (dateTime) => cubit.updateField(when: dateTime));
            },
          )
              .boxExpand()
              .sizedBox(height: 40)
              .padding(left: formPadding, right: formPadding, top: formPadding),
          Text("Description", style: Theme.of(context).textTheme.labelLarge)
              .padding(top: formPadding),
          TextFormField(
            initialValue: state.body,
            maxLines: 6,
            onChanged: (value) => cubit.updateField(body: value),
          ).padding(left: formPadding, right: formPadding),
        ].listView().padding(all: 12).boxExpand(),
        bottomNavigationBar: TextButton(
          onPressed: cubit.isValid()
              ? () {
                  cubit.create();
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                }
              : null,
          child: const Text("Create Reminder"),
        ).padding(all: 20),
      );
    });
  }
}

void _dateAndTimePicker(BuildContext context,
    {DateTime? initialDateTime,
    required void Function(DateTime? dateTime) onSelect}) {
  showDatePicker(
    context: context,
    initialDate: initialDateTime ?? DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 60)),
  ).then((selectedDate) {
    if (selectedDate != null) {
      showTimePicker(
              context: context,
              initialTime: (initialDateTime == null)
                  ? TimeOfDay.now()
                  : TimeOfDay.fromDateTime(initialDateTime))
          .then((selectedTime) {
        if (selectedTime == null) {
          onSelect(null);
        } else {
          //combine the date and time.
          final combined = DateTime(selectedDate.year, selectedDate.month,
              selectedDate.day, selectedTime.hour, selectedTime.minute);
          onSelect(combined);
        }
      });
    } else {
      onSelect(null);
    }
  });
}
