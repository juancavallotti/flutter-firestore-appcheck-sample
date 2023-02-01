import 'package:flutter/material.dart';

extension QuickColumn on List<Widget> {
  Widget column(
      {CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center}) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: this,
    );
  }
}
