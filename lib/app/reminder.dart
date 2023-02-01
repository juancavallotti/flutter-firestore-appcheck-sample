class Reminder {
  final String title;
  final DateTime when;
  final String? body;
  final bool active;

  Reminder(
      {required this.title,
      required this.when,
      this.body,
      this.active = false});
}
