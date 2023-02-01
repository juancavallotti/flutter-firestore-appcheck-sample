import 'package:flutter/material.dart';

extension QuickRow on List<Widget> {
  Widget column() {
    return Row(
      children: this,
    );
  }
}
