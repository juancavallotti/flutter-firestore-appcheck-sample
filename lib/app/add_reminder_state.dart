import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminders_app/app/reminder.dart';

class AddReminderCubit extends Cubit<Reminder> {
  AddReminderCubit() : super(Reminder(title: "", when: DateTime.now()));

  void updateField({String? title, DateTime? when, String? body}) {
    final newState = Reminder(
        title: title ?? state.title,
        when: when ?? state.when,
        body: body ?? state.body);
    emit(newState);
  }
}
