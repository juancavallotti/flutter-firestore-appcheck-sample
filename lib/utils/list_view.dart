import 'package:flutter/material.dart';

extension QuickListView on List<Widget> {
  Widget listView() {
    return ListView(
      children: this,
    );
  }
}
