import 'package:flutter/material.dart';

extension QuickRow on List<Widget> {
  Widget row() {
    return Row(
      children: this,
    );
  }
}
