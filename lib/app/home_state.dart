/*
Classes related to the home screens's state management.
*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminders_app/app/repository.dart';
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
  final RemindersRepository repository;

  RemindersAppStateCubit({required this.repository}) : super(Uninitialized());

  Future<void> loadRemoteReminders() async {
    emit(LoadingReminders());
    repository
        .readUserReminders("test@test.com")
        .then((value) => emit(RemindersAvailable(value)));
  }
}
