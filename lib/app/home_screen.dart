import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reminders_app/app/add_reminder.dart';
import 'package:reminders_app/app/home_state.dart';

import '../utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        appBar:
            AppBar(centerTitle: true, title: const Text("Simple Reminders")),
        body: BlocBuilder<RemindersAppStateCubit, RemindersAppState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case Uninitialized:
                context.read<RemindersAppStateCubit>().loadRemoteReminders();
                return ListView();
              case LoadingReminders:
                context.loaderOverlay.show();
                return ListView();
              case RemindersAvailable:
                context.loaderOverlay.hide();
                final reminders = (state as RemindersAvailable).reminders;
                return (reminders.isEmpty)
                    ? const Text(
                            "There are no reminders configured, try adding some!")
                        .center()
                    : ListView();
            }
            return const Text("This Should never happen!").center();
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => const AddReminder(),
            );
          },
        ),
      ),
    );
  }
}
