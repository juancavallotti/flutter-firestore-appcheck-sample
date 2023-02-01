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

  Future<Reminder?> createUserReminder(String userId, Reminder reminder) async {
    final result = await reminders
        .add(StoredReminder.from(reminder, userId: userId).toJson());
    return StoredReminder.from(reminder, userId: userId, documentId: result.id);
  }
}

class StoredReminder extends Reminder {
  final String userId;
  final String? documentId;
  final bool active;

  StoredReminder(
      {required super.title,
      required super.when,
      super.body,
      required this.userId,
      required this.active,
      this.documentId});

  factory StoredReminder.from(Reminder base,
      {required String userId, String? documentId}) {
    return StoredReminder(
        title: base.title,
        when: base.when,
        body: base.body,
        userId: userId,
        documentId: documentId,
        active: true);
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "active": active,
      "title": title,
      "when": when,
      "body": body,
    };
  }
}
