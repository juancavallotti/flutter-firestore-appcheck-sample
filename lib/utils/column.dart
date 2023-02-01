import 'package:flutter/material.dart';

extension QuickColumn on List<Widget> {
  Widget column() {
    return Column(
      children: this,
    );
  }
}
