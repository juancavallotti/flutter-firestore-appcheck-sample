import 'package:flutter_bloc/flutter_bloc.dart';

abstract class EditReminderState {
  final String? title;
  final DateTime? when;
  final String? body;

  EditReminderState({this.title, this.when, this.body});
}

class EditingReminderState extends EditReminderState {
  EditingReminderState({super.title, super.when, super.body});
}

class SubmittedReminderState extends EditReminderState {
  SubmittedReminderState({super.title, super.when, super.body});
}

class CanceledReminderState extends EditReminderState {}

class AddReminderCubit extends Cubit<EditReminderState> {
  AddReminderCubit() : super(EditingReminderState());

  void updateField({String? title, DateTime? when, String? body}) {
    final newState = EditingReminderState(
        title: title ?? state.title,
        when: when ?? state.when,
        body: body ?? state.body);
    emit(newState);
  }

  bool isValid() {
    return state.title != null &&
        state.title!.isNotEmpty &&
        state.when != null &&
        state.when!.isAfter(DateTime.now());
  }

  void create() {
    if (isValid()) {
      emit(SubmittedReminderState(
          title: state.title, when: state.when, body: state.body));
    }
  }
}
