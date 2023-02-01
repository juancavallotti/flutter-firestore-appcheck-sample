import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reminders_app/app/reminder.dart';

class RemindersRepository {
  final CollectionReference reminders;

  RemindersRepository({required FirebaseFirestore firestore})
      : reminders = firestore.collection("reminders");

  Future<List<Reminder>> readUserReminders(String userId) async {
    return reminders
        .where('userId', isEqualTo: userId)
        .get()
        .then<List<Reminder>>((value) {
      print(value);

      return [];
    });
  }
}
