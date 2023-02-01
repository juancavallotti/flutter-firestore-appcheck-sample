import 'package:flutter/material.dart';
import 'package:reminders_app/utils/utils.dart';

class AddReminder extends StatelessWidget {
  const AddReminder({super.key});

  @override
  Widget build(BuildContext context) {
    const formPadding = 12.0;

    return Scaffold(
      body: <Widget>[
        Text(
          "Add a Reminder",
          style: Theme.of(context).textTheme.titleLarge,
        ).padding(top: 20),
        const Text("Title").padding(top: formPadding),
        const TextField().padding(left: formPadding, right: formPadding),
        const Text("When?").padding(top: formPadding),
        TextButton(
          child: const Text("Select..."),
          onPressed: () {
            _dateAndTimePicker(context,
                onSelect: (dateTime) => print("Selected: $dateTime"));
          },
        )
            .boxExpand()
            .sizedBox(height: 40)
            .padding(left: formPadding, right: formPadding, top: formPadding),
        const Text("Description").padding(top: formPadding),
        const TextField(
          maxLines: 6,
        ).padding(left: formPadding, right: formPadding),
        TextButton(
          child: const Text("Create Reminder"),
          onPressed: () {},
        )
            .boxExpand()
            .sizedBox(height: 40)
            .padding(left: formPadding, right: formPadding, top: formPadding)
      ].column().boxExpand(),
    );
  }
}

void _dateAndTimePicker(BuildContext context,
    {required void Function(DateTime? dateTime) onSelect}) {
  showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 60)),
  ).then((selectedDate) {
    if (selectedDate != null) {
      showTimePicker(context: context, initialTime: TimeOfDay.now())
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
