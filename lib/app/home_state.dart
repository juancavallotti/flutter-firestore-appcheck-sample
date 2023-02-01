/*
Classes related to the home screens's state management.
*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'reminder.dart';

abstract class RemindersAppState {}

class LoadingReminders extends RemindersAppState {}

class RemindersAvailable extends RemindersAppState {
  final List<Reminder> reminders;

  RemindersAvailable(this.reminders);
}

class Uninitialized extends RemindersAppState {}

/*
And the cubit.
*/

class RemindersAppStateCubit extends Cubit<RemindersAppState> {
  RemindersAppStateCubit() : super(Uninitialized());

  Future<void> loadRemoteReminders() async {
    emit(LoadingReminders());
    //TODO - load reminders from firebase.
  }
}
