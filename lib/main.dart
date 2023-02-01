import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reminders_app/app/add_reminder_state.dart';
import 'package:reminders_app/app/home_screen.dart';
import 'package:reminders_app/app/home_state.dart';
import 'package:reminders_app/app/repository.dart';
import 'package:reminders_app/firebase_options.dart';

void main() async {
  await dotenv.load();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => RemindersAppStateCubit(
                repository: RemindersRepository(
                    firestore: FirebaseFirestore.instance))),
        BlocProvider(
          create: (context) => AddReminderCubit(),
        ),
      ],
      child: const HomeScreen(),
    ));
  }
}
