import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
        child: Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Simple Reminders")),
      body: const Text("Hello World of Widgets").center(),
    ));
  }
}
