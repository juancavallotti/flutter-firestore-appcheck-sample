class Reminder {
  final String title;
  final DateTime when;
  final String? body;

  Reminder({
    required this.title,
    required this.when,
    this.body,
  });
}
